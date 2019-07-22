//
//  PhotoServiceVC.h
//  PhotoExplorer
//
//  Created by Ahmed El-Kollaly on 6/19/19.
//  Copyright © 2019 Ahmed El-Kollaly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Networking.h"
NS_ASSUME_NONNULL_BEGIN

@interface PhotoService : NSObject

- (instancetype) initWithNetworking: (Networking *) networking;
extern NSString *API_KEY;
- (void) getPhotosWithCompletionBlock: (void (^)(NSArray *imagesURLs))completionBlock;

- (void) getPhotosURLs: (NSDictionary *) response withCompletion: (void (^) (NSArray *imagesURLs))completionBlock;
- (NSString*) getPhotoURL: (NSDictionary *) photoDictionary;
@end

NS_ASSUME_NONNULL_END
