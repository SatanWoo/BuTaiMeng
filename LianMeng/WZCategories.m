//
//  WZCategories.m
//  LianMeng
//
//  Created by satanwoo on 14-7-28.
//  Copyright (c) 2014年 Ziqi Wu. All rights reserved.
//

#import "WZCategories.h"
#import "WZResourceProvider.h"

@interface WZCategories()
@property (nonatomic, assign, readwrite) WZComponentsType type;
@property (nonatomic, strong) NSMutableArray *componentsArray;
@end

@implementation WZCategories

+ (WZCategories *)createComponentCategoriesByType:(WZComponentsType)type
{
    WZCategories *categories = [[WZCategories alloc] initWithType:type];
    return categories;
}

- (instancetype)initWithType:(WZComponentsType)type
{
    self = [super init];
    
    if (self) {
        self.type = type;
        
        NSArray *imageArray = [[WZResourceProvider resourceArray] objectAtIndex:self.type];
        for (NSString *name in imageArray) {
            @autoreleasepool {
                WZComponents *component = [WZComponents createComponentsWithName:name];
                [self.componentsArray addObject:component];
            }
        }
    }
    
    return self;
}

#pragma mark - Public
- (WZComponents *)componentsAtIndex:(NSInteger)index
{
    if (index < 0 || index >= [self.componentsArray count]) return nil;
    return [self.componentsArray objectAtIndex:index];
}

- (NSInteger)countOfComponents
{
    return [self.componentsArray count];
}

#pragma mark - Override
- (NSMutableArray *)componentsArray
{
    if (!_componentsArray) {
        _componentsArray = [[NSMutableArray alloc] init];
    }
    return _componentsArray;
}

@end
