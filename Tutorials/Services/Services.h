//
//  Services.h
//  Tutorials
//
//  Created by Velkei Miklós on 2018. 05. 27..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

#import <Foundation/Foundation.h>

//block syntax
typedef void(^onComplete)(NSArray * __nullable dataArray, NSString * __nullable errMessage);

@interface Services : NSObject
+(id) instance;
-(void)getTutorials:(nullable onComplete)completionHandler;
@end
