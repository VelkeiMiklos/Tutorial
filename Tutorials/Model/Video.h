//
//  Video.h
//  Tutorials
//
//  Created by Velkei Miklós on 2018. 05. 27..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject
@property(nonatomic,strong) NSString *videoTitle;
@property(nonatomic,strong) NSString *videoDescription;
@property(nonatomic,strong) NSString *videoIframe;
@property(nonatomic,strong) NSString *thumbnailUrl;
@end
