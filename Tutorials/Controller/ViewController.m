//
//  ViewController.m
//  Tutorials
//
//  Created by Velkei Miklós on 2018. 05. 27..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

#import "ViewController.h"
#import "Services.h"
#import  "Video.h"
#import "VideoCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *videoList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.videoList = [[NSArray alloc]init ];
    
    [[Services instance]getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errMessage) {
        if (dataArray){
            NSLog(@"Array: %@", dataArray.debugDescription);
            NSMutableArray *arr = [[NSMutableArray alloc] init];
            for (NSDictionary *dict in dataArray){
                Video *video = [[Video alloc] init];
                video.videoTitle = [dict objectForKey:@"title"];
                video.videoDescription = [dict objectForKey:@"description"];
                video.thumbnailUrl = [dict objectForKey:@"thumbnail"];
                video.videoIframe = [dict objectForKey:@"iframe"];
                [arr addObject:video];
            }
            self.videoList = arr;
            [self updateTableData];
        }else if(errMessage){
            NSLog(@"Err: %@", errMessage.debugDescription);
        }
    }];
}

-(void) updateTableData{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *) cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    VideoCell *videoCell = (VideoCell*)cell;
    [videoCell updateUI:video];
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"main"];
    if (!cell) {
        cell = [[VideoCell alloc] init];
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.videoList.count;
}



@end
