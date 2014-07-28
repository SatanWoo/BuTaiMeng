//
//  WZComponents.h
//  LianMeng
//
//  Created by satanwoo on 14-7-28.
//  Copyright (c) 2014年 Ziqi Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    WZComponentsTypeBackground = 0,
    WZComponentsTypeBody = 1,
    WZComponentsTypeFace = 2,
    WZComponentsTypeBrow = 3,
    WZComponentsTypeEye  = 4,
    WZComponentsTypeNode = 5,
    WZComponentsTypeMouth = 6,
    WZComponentsTypeEar   = 7,
    WZComponentsTypeHair  = 8,
    WZComponentsTypeBeard = 9,
    WZComponentsTypeInjured = 10,
    WZComponentsTypeGlass = 11,
    WZComponentsTypeNecklace = 12,
    WZComponentsTypeCloth = 13,
    WZComponentsTypeDecoration = 14,
} WZComponentsType;

@interface WZComponents : NSObject

@property (nonatomic, strong, readonly) CALayer *componentLayer;
@property (nonatomic, strong, readonly) CALayer *thumbnailLayer;

+ (WZComponents *)createComponentsWithName:(NSString *)name;

@end
