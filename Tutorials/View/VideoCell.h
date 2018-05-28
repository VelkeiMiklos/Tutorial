//
//  VideoCell.h
//  Tutorials
//
//  Created by Velkei Miklós on 2018. 05. 27..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface VideoCell : UITableViewCell
-(void)updateUI:(nonnull Video*)video;
@end
