//
//  Networking.m
//  PhotoExplorer
//
//  Created by Ahmed El-Kollaly on 6/17/19.
//  Copyright © 2019 Ahmed El-Kollaly. All rights reserved.
//

#import "Networking.h"
#import "AFURLSessionManager.h"




@implementation Networking


- (void)getRecentPhotosWithURLString: (NSString*) urlStr withCompletionBlock: (void (^)(NSDictionary * _Nonnull))completionBlock {
    
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            
            
            if ([responseObject isKindOfClass:[NSDictionary class]]){
                
                
                completionBlock(responseObject);
            }
            
            
        }
        
        
    }];
    
    [dataTask resume];
    
    
    
    
}



@end
