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
    }
    
    if (self.borderColor) {
        self.borderColor = self.borderColor;
    }
}

-(void)setBorderColor:(UIColor *)borderColor{
    _borderColor = borderColor;
    for (UIImageView* imageView in imageViews) {
        [imageView.layer setBorderColor:self.borderColor.CGColor];
        [imageView.layer setBorderWidth:0.5];
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

        
        self.moreContainerView = [[UIView alloc]initWithFrame:frame];
        [self.moreContainerView setBackgroundColor:self.borderColor];
        [self addSubview:self.moreContainerView];
        frame.origin = CGPointMake(0, 0);
        frame.size.width *= 0.7;
        frame.size.height *= 0.7;
        
        self.moreLabel = [[UILabel alloc]initWithFrame:frame];
        [self.moreLabel setFont:[UIFont boldSystemFontOfSize:13]];
        [self.moreLabel setTextColor:[UIColor whiteColor]];
        [self.moreLabel setTextAlignment:NSTextAlignmentCenter];
        
        [self.moreContainerView addSubview:self.moreLabel];
    }
}

@end
