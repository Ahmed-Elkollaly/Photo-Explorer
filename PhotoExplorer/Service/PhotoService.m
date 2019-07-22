//
//  PhotoServiceVC.m
//  PhotoExplorer
//
//  Created by Ahmed El-Kollaly on 6/19/19.
//  Copyright © 2019 Ahmed El-Kollaly. All rights reserved.
//

#import "PhotoService.h"


@interface PhotoService ()


@property (nonatomic, strong, readonly) Networking *networking;

@end

@implementation PhotoService

- (instancetype)initWithNetworking:(Networking *)networking {
    self = [super init];
    if (!self) return nil;
    
    _networking = networking;

    return self;
}

NSString *API_KEY = @"7910cf5980ed8252cdaaa76f20e5a6ef";

- (void) getPhotosWithCompletionBlock: (void (^)(NSArray *imagesURLs))completionBlock {
    
    
    
    NSString *urlStr = [NSString stringWithFormat: @"https://www.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=%@&format=json&nojsoncallback=1",API_KEY];
    
    [_networking getRecentPhotosWithURLString:urlStr withCompletionBlock:^(NSDictionary * _Nonnull response) {
        NSLog(@"Response %@",response.description);
        NSDictionary *photoDictionary = response[@"photos"];
        NSLog(@"Photo Dictionary %@",photoDictionary.description);
        if ([photoDictionary[@"photo"] isKindOfClass:[NSArray class]]) {
            NSLog(@"Array");
        }else{
            NSLog(@"Dictionary");
        }
        NSDictionary *photos = photoDictionary[@"photo"];
        
        NSLog(@"Photos %@",photos.description);
        
        [self getPhotosURLs:photos withCompletion:^(NSArray * _Nonnull imagesURLs) {
            
            
            completionBlock(imagesURLs);
        }];
        
        
        
    }];
   
    
  

    
}


- (void)getPhotosURLs:(NSDictionary *)response withCompletion:(void (^)(NSArray * _Nonnull))completionBlock {
    
    
    NSMutableArray *imagesURLs = [[NSMutableArray alloc] init];
    
    
    if (response) {
        
        
        for(id photo in response) {
          
            NSString *imageURL = [self getPhotoURL:photo];
            
            [imagesURLs addObject:imageURL];
            
        }
        
        
        
    }
    completionBlock(imagesURLs);
    
    
}
- (NSString *)getPhotoURL:(NSDictionary *)photoDictionary {
    
    
    
    
    NSString *farmID = photoDictionary[@"farm"];
    NSString *photoID = photoDictionary[@"id"];
    NSString *secret = photoDictionary[@"secret"];
    NSString *serverID = photoDictionary [@"server"];
    

    
    NSString *imgURL = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@_z.jpg",farmID,serverID,photoID,secret];
    
   
    
    return imgURL;
}
@end
