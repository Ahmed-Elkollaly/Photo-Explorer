//
//  PhotosViewModel.m
//  PhotoExplorer
//
//  Created by Ahmed El-Kollaly on 6/19/19.
//  Copyright © 2019 Ahmed El-Kollaly. All rights reserved.
//

#import "PhotosViewModel.h"

@interface PhotosViewModel ()

@property (nonatomic,strong) NSArray *imagesURLs;
@property (nonatomic, strong, readonly) PhotoService *photoService;

@end

@implementation PhotosViewModel

- (instancetype)initWithPhotoService:(PhotoService *)photoService {
    self = [super init];
    if (!self) return nil;

    _photoService = photoService;

    
    
    __weak PhotosViewModel *weakSelf = self;
    [_photoService getPhotosWithCompletionBlock:^(NSArray * _Nonnull imagesURLs) {
       
        __strong PhotosViewModel *strongSelf = weakSelf;
        
        if(strongSelf) {
            
            strongSelf.imagesURLs = imagesURLs;
            if (strongSelf.reloadPhotosCollectionView) {
                strongSelf.reloadPhotosCollectionView();
            }else{
                NSLog(@"Block is nil");
            }
            
        }
        
        
    }];
    
    
    return self;

}
- (NSString *)fullPhotoURLAtItem:(NSInteger)item {
    
   
    return _imagesURLs[item];
    
    
}
- (NSUInteger)numberOfPhotoInSection {
    return _imagesURLs.count;
}


@end
