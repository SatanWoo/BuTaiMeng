//
//  WZCategories.h
//  LianMeng
//
//  Created by satanwoo on 14-7-28.
//  Copyright (c) 2014年 Ziqi Wu. All rights reserved.
//

#import "WZComponents.h"

@interface WZCategories : WZComponents

@property (nonatomic, assign, readonly) WZComponentsType type;

+ (WZCategories *)createComponentCategoriesByType:(WZComponentsType)type;
- (WZComponents *)componentsAtIndex:(NSInteger)index;
- (NSInteger)countOfComponents;

@end
