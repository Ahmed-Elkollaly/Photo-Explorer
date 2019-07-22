//
//  PhotosViewModel.h
//  PhotoExplorer
//
//  Created by Ahmed El-Kollaly on 6/19/19.
//  Copyright © 2019 Ahmed El-Kollaly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoService.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotosViewModel : NSObject



- (instancetype) initWithPhotoService: (PhotoService *) photoService;
- (NSUInteger)numberOfPhotoInSection;
- (NSString *)fullPhotoURLAtItem:(NSInteger) item;
@property (nonatomic, copy) void (^reloadPhotosCollectionView)(void);

@end

NS_ASSUME_NONNULL_END
