//
//  ViewController.m
//  PhotoExplorer
//
//  Created by Ahmed El-Kollaly on 6/17/19.
//  Copyright © 2019 Ahmed El-Kollaly. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PhotoCollectionViewCell.h"
#import "PhotosViewModel.h"


@interface ViewController ()

@property (nonatomic, strong, readonly) PhotosViewModel *viewModel;

@end

@implementation ViewController

- (instancetype)initWithPhotoViewModel:(PhotosViewModel *)viewModel {
    self = [super init];
    if (!self) return nil;
    
    _viewModel = viewModel;
    
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak ViewController *weakSelf = self;
    
    _viewModel.reloadPhotosCollectionView = ^ {
        
        __strong ViewController *strongSelf = weakSelf;
        
        if(strongSelf) {
            
            [strongSelf.photosCollectionView reloadData];
        }
        
    };
    
    dispatch_async(dispatch_get_main_queue(), ^(void){
        
        [self configureUI];
        
    });
    
    
   
    
    
    
}

- (void)configureUI {
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self configurePhotosCollectionViewUI];
}
- (void)configurePhotosCollectionViewUI {
    
    //Configure Flow Layout for collection view
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing = 20;
    
    
    //Configure Photos Collection view
    _photosCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _photosCollectionView.delegate = self;
    _photosCollectionView.dataSource = self;
    _photosCollectionView.showsVerticalScrollIndicator = NO;
    
    _photosCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
    _photosCollectionView.backgroundColor = UIColor.whiteColor;
    
    [_photosCollectionView registerNib:[UINib nibWithNibName: @"PhotoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"PhotoCell"];
    
    
    //Add Collection View to view
    [self.view addSubview:_photosCollectionView];
    
    UILayoutGuide *safeGuides = [self.view safeAreaLayoutGuide];
    
    [_photosCollectionView.topAnchor constraintEqualToAnchor:safeGuides.topAnchor].active = YES;
    [_photosCollectionView.bottomAnchor constraintEqualToAnchor:safeGuides.bottomAnchor].active = YES;
    [_photosCollectionView.leadingAnchor constraintEqualToAnchor:safeGuides.leadingAnchor].active = YES;
    [_photosCollectionView.trailingAnchor constraintEqualToAnchor:safeGuides.trailingAnchor].active = YES;
    
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
    if (cell != nil) {
        
        cell.backgroundColor = UIColor.blueColor;
        
        cell.layer.cornerRadius = 20;
        
        NSString *imageStrURL = [_viewModel fullPhotoURLAtItem:indexPath.item];
        NSURL *url = [[NSURL alloc] initWithString:imageStrURL];
        NSData *data = [[NSData alloc] initWithContentsOfURL:url];
        cell.imageView.image = [[UIImage alloc] initWithData:data];
        
        return cell;
    }
   
    
    return [[UICollectionViewCell alloc] init];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _viewModel.numberOfPhotoInSection;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat widthAndHeight = CGRectGetWidth([self view].frame) * 0.8;
    
    return CGSizeMake(widthAndHeight, widthAndHeight);
}



@end
