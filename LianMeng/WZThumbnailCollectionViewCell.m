//
//  WZThumbnailCollectionViewCell.m
//  LianMeng
//
//  Created by satanwoo on 14-7-28.
//  Copyright (c) 2014年 Ziqi Wu. All rights reserved.
//

#import "WZThumbnailCollectionViewCell.h"

@interface WZThumbnailCollectionViewCell()
@property (nonatomic, strong) CALayer *currentLayer;
@end

@implementation WZThumbnailCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.layer.borderWidth = 2.0f;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

- (void)addThumbNailLayer:(CALayer *)layer
{
    if (layer == nil) return;
    
    if (self.currentLayer) {
        [self.currentLayer removeFromSuperlayer];
        self.currentLayer = nil;
    }
    
    layer.frame = self.containerView.layer.bounds;
    [self.containerView.layer addSublayer:layer];
    self.currentLayer = layer;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    if (selected) {
        self.layer.borderColor = [UIColor redColor].CGColor;
    } else {
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
}

@end
