//
//  WZCategoriesViewController.h
//  LianMeng
//
//  Created by satanwoo on 14-7-28.
//  Copyright (c) 2014年 Ziqi Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WZComponents.h"

@protocol WZCategoriesSelectionDelegate <NSObject>
- (void)didSelectComponentsInCategories:(WZComponents *)selectedComponent type:(WZComponentsType)type selectionIndex:(NSInteger)index;
@end

@interface WZCategoriesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) id <WZCategoriesSelectionDelegate>delegate;

+ (WZCategoriesViewController *)createCategoriesViewControllerWithType:(WZComponentsType)type;

@end
