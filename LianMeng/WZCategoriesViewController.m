//
//  WZCategoriesViewController.m
//  LianMeng
//
//  Created by satanwoo on 14-7-28.
//  Copyright (c) 2014年 Ziqi Wu. All rights reserved.
//

#import "WZCategoriesViewController.h"
#import "WZCategories.h"
#import "WZThumbnailCollectionViewCell.h"
#define WZCategoriesVCIdentifier @"kWZCategoriesViewController"

@interface WZCategoriesViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, assign) WZComponentsType type;
@property (nonatomic, strong) WZCategories *categories;
@end

@implementation WZCategoriesViewController

+ (WZCategoriesViewController *)createCategoriesViewControllerWithType:(WZComponentsType)type
{
    WZCategoriesViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:WZCategoriesVCIdentifier];
    vc.type = type;
    return vc;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"WZThumbnailCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"WZThumbnailCollectionViewCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Override
- (WZCategories *)categories
{
    if (!_categories) {
        _categories = [WZCategories createComponentCategoriesByType:self.type];
    }
    return _categories;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.categories countOfComponents];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    WZThumbnailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WZThumbnailCollectionViewCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[WZThumbnailCollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, WZThumbnailCollectionViewCellSize, WZThumbnailCollectionViewCellSize)];
    }
    
    WZComponents *components = [self.categories componentsAtIndex:indexPath.row];
    [cell addThumbNailLayer:[components thumbnailLayer]];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
static bool hasDelegateAndItsMethod = false;
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (!hasDelegateAndItsMethod) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectComponentsInCategories:type:selectionIndex:)]) {
            hasDelegateAndItsMethod = true;
        }
    }
    
    if (hasDelegateAndItsMethod) {
        WZComponents *component = [self.categories componentsAtIndex:indexPath.row];
        [self.delegate didSelectComponentsInCategories:component type:self.categories.type selectionIndex:indexPath.row];
    }
}

#pragma mark - UICollectionViewFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(WZThumbnailCollectionViewCellSize, WZThumbnailCollectionViewCellSize);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 15, 10, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15.0f;
}

@end
