//
//  WZComponents.m
//  LianMeng
//
//  Created by satanwoo on 14-7-28.
//  Copyright (c) 2014年 Ziqi Wu. All rights reserved.
//

#import "WZComponents.h"

@interface WZComponents ()
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, strong, readwrite) CALayer *componentLayer;
@property (nonatomic, strong, readwrite) CALayer *thumbnailLayer;
@end

@implementation WZComponents

+ (WZComponents *)createComponentsWithName:(NSString *)name
{
    WZComponents *component = [[WZComponents alloc] init];
    component.imageName = name;
    
    return component;
}

- (CALayer *)componentLayer
{
    if (!_componentLayer) {
        _componentLayer = [CALayer layer];
        _componentLayer.contents = (id)[UIImage imageNamed:[self.imageName stringByAppendingString:@"L"]].CGImage;
    }
    return _componentLayer;
}

- (CALayer *)thumbnailLayer
{
    if (!_thumbnailLayer) {
        _thumbnailLayer = [CALayer layer];
        _thumbnailLayer.contents = (id)[UIImage imageNamed:self.imageName].CGImage;
    }
    return _thumbnailLayer;
}


@end
