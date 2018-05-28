//
//  Services.m
//  Tutorials
//
//  Created by Velkei Miklós on 2018. 05. 27..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

#import "Services.h"
#define URL_BASE "http://localhost:6069"
#define URL_TUTORIALS "/tutorials"
@implementation Services

+(id)instance{
    static Services *sharedInstance = nil;
    @synchronized(self){
        if (sharedInstance == nil)
            sharedInstance = [[self alloc]init];
    }
    return sharedInstance;
}
-(void)getTutorials:(nullable onComplete)completionHandler{
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s", URL_BASE, URL_TUTORIALS]];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL: url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil){
            NSError *err;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            if (err == nil){
                completionHandler(json, nil);
            }else{
                completionHandler(nil,@"Data is corrupt Please try again");
            }
        }else{
            NSLog(@"Err: %@", error.debugDescription);
            completionHandler(nil, @"Problem connecting to the server");
        }

    }] resume];
}
@end
