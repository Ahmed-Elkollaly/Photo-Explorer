//
//  Networking.h
//  PhotoExplorer
//
//  Created by Ahmed El-Kollaly on 6/17/19.
//  Copyright © 2019 Ahmed El-Kollaly. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Networking : NSObject

- (void)getRecentPhotosWithURLString: (NSString*) urlStr withCompletionBlock: (void (^)(NSDictionary * _Nonnull))completionBlock;

@end

NS_ASSUME_NONNULL_END
