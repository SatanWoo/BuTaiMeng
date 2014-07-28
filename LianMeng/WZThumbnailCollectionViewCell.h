//
//  WZThumbnailCollectionViewCell.h
//  LianMeng
//
//  Created by satanwoo on 14-7-28.
//  Copyright (c) 2014年 Ziqi Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define WZThumbnailCollectionViewCellSize 120

@interface WZThumbnailCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *containerView;

- (void)addThumbNailLayer:(CALayer *)layer;

@end
