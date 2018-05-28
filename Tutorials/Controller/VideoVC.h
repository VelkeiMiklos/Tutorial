//
//  VideoVC.h
//  Tutorials
//
//  Created by Velkei Miklós on 2018. 05. 27..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

#import "ViewController.h"
@class Video;
@interface VideoVC : ViewController <UIWebViewDelegate>
@property (nonatomic, strong) Video *video;
@end
