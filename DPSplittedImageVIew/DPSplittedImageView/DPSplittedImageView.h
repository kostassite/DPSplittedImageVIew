//
//  DPSplittedImageView.h
//  DPSplittedImageVIew
//
//  Created by Kostas on 3/7/15.
//  Copyright (c) 2015 Kostas Antonopoulos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DPSplittedImageView : UIView{
    NSMutableArray *imageViews;
}

-(void)setRemoteImageUrls:(NSArray*)remoteImageUrls; //NSArray of NSURLs

-(void)cancelDownloads;

@property (nonatomic,strong) UILabel *moreLabel;
@property (nonatomic,strong) UIView *moreContainerView;

@property(nonatomic,strong) UIColor *borderColor;

@end
