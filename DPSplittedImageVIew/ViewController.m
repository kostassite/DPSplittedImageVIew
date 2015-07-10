//
//  ViewController.m
//  DPSplittedImageVIew
//
//  Created by Kostas on 3/7/15.
//  Copyright (c) 2015 Kostas Antonopoulos. All rights reserved.
//

#import "ViewController.h"
#import "DPSplittedImageView.h"

@interface ViewController (){
    DPSplittedImageView *splittedImageView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    splittedImageView = [[DPSplittedImageView alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
    [self.view addSubview:splittedImageView];
    [splittedImageView setRemoteImageUrls:[self fiveUrlArray]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray*)oneUrlArray{
    return @[[NSURL URLWithString:@"http://www.staylocal.org/sites/default/files/present-box-3007278.jpg"]];
}

-(NSArray*)twoUrlArray{
    return @[[NSURL URLWithString:@"http://www.staylocal.org/sites/default/files/present-box-3007278.jpg"],
             [NSURL URLWithString:@"http://images4.fanpop.com/image/photos/22500000/Gift-Present-cynthia-selahblue-cynti19-22541940-325-325.jpg"]];
}

-(NSArray*)threeUrlArray{
    return @[[NSURL URLWithString:@"http://www.staylocal.org/sites/default/files/present-box-3007278.jpg"],
             [NSURL URLWithString:@"http://images4.fanpop.com/image/photos/22500000/Gift-Present-cynthia-selahblue-cynti19-22541940-325-325.jpg"],
             [NSURL URLWithString:@"http://images4.fanpop.com/image/photos/22200000/White-present-white-22226613-2048-2193.jpg"]];
}

-(NSArray*)fourUrlArray{
    return @[[NSURL URLWithString:@"http://www.staylocal.org/sites/default/files/present-box-3007278.jpg"],
             [NSURL URLWithString:@"http://images4.fanpop.com/image/photos/22500000/Gift-Present-cynthia-selahblue-cynti19-22541940-325-325.jpg"],
             [NSURL URLWithString:@"http://images4.fanpop.com/image/photos/22200000/White-present-white-22226613-2048-2193.jpg"],
             [NSURL URLWithString:@"http://www.clker.com/cliparts/q/r/L/5/t/k/pink-present-box-hi.png"]];
}

-(NSArray*)fiveUrlArray{
    return @[[NSURL URLWithString:@"http://www.staylocal.org/sites/default/files/present-box-3007278.jpg"],
             [NSURL URLWithString:@"http://images4.fanpop.com/image/photos/22500000/Gift-Present-cynthia-selahblue-cynti19-22541940-325-325.jpg"],
             [NSURL URLWithString:@"http://images4.fanpop.com/image/photos/22200000/White-present-white-22226613-2048-2193.jpg"],
             [NSURL URLWithString:@"http://www.clker.com/cliparts/q/r/L/5/t/k/pink-present-box-hi.png"],
             [NSURL URLWithString:@"http://www.clker.com/cliparts/q/r/L/5/t/k/pink-present-box-hi.png"]];
}

@end
