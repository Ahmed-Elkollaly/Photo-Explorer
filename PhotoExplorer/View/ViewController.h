//
//  ViewController.h
//  PhotoExplorer
//
//  Created by Ahmed El-Kollaly on 6/17/19.
//  Copyright © 2019 Ahmed El-Kollaly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotosViewModel.h"

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong,nonatomic) UICollectionView *photosCollectionView;


- (instancetype) initWithPhotoViewModel:(PhotosViewModel*) viewModel;
- (void) configureUI;
- (void) configurePhotosCollectionViewUI;

@end

