//
//  DPSplittedImageView.m
//  DPSplittedImageVIew
//
//  Created by Kostas on 3/7/15.
//  Copyright (c) 2015 Kostas Antonopoulos. All rights reserved.
//

#import "DPSplittedImageView.h"
#import "UIImageView+WebCache.h"

@implementation DPSplittedImageView

-(void)setRemoteImageUrls:(NSArray*)remoteImageUrls{
    [self createNeededImageViewsForNumberOfImages:[remoteImageUrls count]];
    
    if (remoteImageUrls.count<=4) {
        for (int i=0; i<remoteImageUrls.count; i++) {
            UIImageView *currentImageView = [imageViews objectAtIndex:i];
            NSURL *currentUrl = [remoteImageUrls objectAtIndex:i];
            
            [currentImageView setContentMode:UIViewContentModeScaleAspectFill];

            [currentImageView sd_setImageWithURL:currentUrl];
            [currentImageView setClipsToBounds:YES];
            [self addSubview:currentImageView];
        }
    }else{
        //add first 3
        for (int i=0; i<3; i++) {
            UIImageView *currentImageView = [imageViews objectAtIndex:i];
            NSURL *currentUrl = [remoteImageUrls objectAtIndex:i];
            
            [currentImageView setContentMode:UIViewContentModeScaleAspectFill];
            
            [currentImageView sd_setImageWithURL:currentUrl];
            [currentImageView setClipsToBounds:YES];
            [self addSubview:currentImageView];
        }
        
        //set moreLabel
        [self.moreLabel setText:[NSString stringWithFormat:@"+%d",(int)remoteImageUrls.count-3]];
        [self addSubview:self.moreLabel];
    }
}

-(void)createNeededImageViewsForNumberOfImages:(NSInteger)countImages{
    imageViews = [[NSMutableArray alloc]init];
    
    if (countImages==1) {
        UIImageView *firstImageView = [[UIImageView alloc]initWithFrame:self.bounds];
        [imageViews addObject:firstImageView];
    }else if (countImages==2){
        CGRect frame = self.bounds;
        frame.size.width /= 2;
        
        UIImageView *firstImageView = [[UIImageView alloc]initWithFrame:frame];
        [imageViews addObject:firstImageView];
        
        frame.origin.x = frame.size.width;
        UIImageView *secondImageView = [[UIImageView alloc]initWithFrame:frame];

        [imageViews addObject:secondImageView];
        
    }else if (countImages==3){
        CGRect frame = self.bounds;
        frame.size.width /= 2;
        frame.size.height /=2;
        
        UIImageView *firstImageView = [[UIImageView alloc]initWithFrame:frame];
        [imageViews addObject:firstImageView];
        
        frame.origin.y = frame.size.height;
        UIImageView *secondImageView = [[UIImageView alloc]initWithFrame:frame];
        [imageViews addObject:secondImageView];
        
        frame = self.bounds;
        frame.size.width /= 2;
        frame.origin.x = frame.size.width;
        UIImageView *thirdImageView = [[UIImageView alloc]initWithFrame:frame];
        [imageViews addObject:thirdImageView];
        
    }else if (countImages==4){
        CGRect frame = self.bounds;
        frame.size.width /= 2;
        frame.size.height /=2;
        
        UIImageView *firstImageView = [[UIImageView alloc]initWithFrame:frame];
        [imageViews addObject:firstImageView];
        
        frame.origin.y = frame.size.height;
        UIImageView *secondImageView = [[UIImageView alloc]initWithFrame:frame];
        [imageViews addObject:secondImageView];
        
        frame.origin.y=0;
        frame.origin.x=frame.size.width;
        UIImageView *thirdImageView = [[UIImageView alloc]initWithFrame:frame];
        [imageViews addObject:thirdImageView];
        
        frame.origin.y = frame.size.height;
        UIImageView *fourthImageView = [[UIImageView alloc]initWithFrame:frame];
        [imageViews addObject:fourthImageView];
        
    }else{
        CGRect frame = self.bounds;
        frame.size.width /= 2;
        frame.size.height /=2;
        
        UIImageView *firstImageView = [[UIImageView alloc]initWithFrame:frame];
        [imageViews addObject:firstImageView];
        
        frame.origin.y = frame.size.height;
        UIImageView *secondImageView = [[UIImageView alloc]initWithFrame:frame];
        [imageViews addObject:secondImageView];
        
        frame.origin.y=0;
        frame.origin.x=frame.size.width;
        UIImageView *thirdImageView = [[UIImageView alloc]initWithFrame:frame];
        [imageViews addObject:thirdImageView];
        
        frame.origin.y = frame.size.height;
        self.moreLabel = [[UILabel alloc]initWithFrame:frame];
        [self.moreLabel setBackgroundColor:[UIColor colorWithRed:156/255.0 green:198/255.0 blue:110/255.0 alpha:1]];
        [self.moreLabel setFont:[UIFont systemFontOfSize:14]];
        [self.moreLabel setTextColor:[UIColor whiteColor]];
        [self.moreLabel setTextAlignment:NSTextAlignmentCenter];
    }
}

@end
