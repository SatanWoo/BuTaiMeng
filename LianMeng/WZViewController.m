//
//  WZViewController.m
//  LianMeng
//
//  Created by satanwoo on 14-7-27.
//  Copyright (c) 2014年 Ziqi Wu. All rights reserved.
//

#import "WZViewController.h"
#import "WZCategoriesViewController.h"

@interface WZViewController () <WZCategoriesSelectionDelegate>

@property (nonatomic, strong) NSMutableDictionary *bodies;
@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, assign) WZComponentsType currentCategories;
@property (nonatomic, strong) CALayer *indicator;
- (void)configureCategoriesView;
- (void)configureButtons;
- (void)configureNavigationbar;
@end

@implementation WZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureCategoriesView];
    [self configureButtons];
    [self configureNavigationbar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Override
- (NSMutableDictionary *)bodies
{
    if (!_bodies) {
        _bodies = [[NSMutableDictionary alloc] init];
    }
    return _bodies;
}

#pragma mark - Private
- (void)configureCategoriesView
{
    for (WZComponentsType type = WZComponentsTypeBackground; type <= WZComponentsTypeDecoration; type++) {
        @autoreleasepool {
            WZCategoriesViewController *vc = [WZCategoriesViewController createCategoriesViewControllerWithType:type];
        
            [vc.view setFrame:CGRectMake(0,
                                         self.view.frame.size.height - vc.view.frame.size.height,
                                         vc.view.frame.size.width,
                                         vc.view.frame.size.height)];
            vc.delegate = self;
            [self addChildViewController:vc];
        }
    }
    
    UIViewController *vc = [self.childViewControllers objectAtIndex:0];
    [self.view addSubview:vc.view];
}

- (void)configureNavigationbar
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(save)];
}

- (void)save
{
    UIGraphicsBeginImageContext(self.previewContainerView.layer.bounds.size);
    [self.previewContainerView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"保存" message:@"保存成功" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"好的", nil];
    
    [alert show];
}

#warning should use NSStringWithFormat not literal string
- (NSString *)stringFromType:(WZComponentsType)type
{
    if (type == WZComponentsTypeFace) return @"脸";
    if (type == WZComponentsTypeBody) return @"身体";
    if (type == WZComponentsTypeBrow) return @"眉毛";
    if (type == WZComponentsTypeEye)  return @"眼睛";
    if (type == WZComponentsTypeNode) return @"鼻子";
    if (type == WZComponentsTypeMouth)return @"嘴";
    if (type == WZComponentsTypeEar)  return @"耳朵";
    if (type == WZComponentsTypeHair) return @"头发";
    if (type == WZComponentsTypeBeard)return @"胡子";
    if (type == WZComponentsTypeInjured) return @"伤口";
    if (type == WZComponentsTypeGlass)return @"眼镜";
    if (type == WZComponentsTypeNecklace)return @"项链";
    if (type == WZComponentsTypeCloth)return @"衣服";
    if (type == WZComponentsTypeDecoration) return @"装饰";
    if (type == WZComponentsTypeBackground) return @"背景";
    
    return nil;
}

- (void)configureButtons
{
    self.buttons = [[NSMutableArray alloc] init];
    self.indicator = [CALayer layer];
    self.indicator.backgroundColor = [UIColor colorWithRed:11.0f/255.0f green:110.f/255.0f blue:198.0f/255.0f alpha:0.6].CGColor;
    
    for (WZComponentsType type = WZComponentsTypeBackground; type <= WZComponentsTypeDecoration; type++) {
        @autoreleasepool {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitle:[self stringFromType:type] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor clearColor]];
            button.tag = type;
            
            [button setFrame:CGRectMake(type * 60, 0, 60, CGRectGetHeight(self.scrollView.frame))];
            [button.titleLabel setTextAlignment: NSTextAlignmentCenter];
            [self.scrollView addSubview:button];
            [self.buttons addObject:button];
        }
    }
    self.indicator.frame = CGRectMake(0, CGRectGetHeight(self.scrollView.frame) - 5, 60, 5);
    [self.scrollView.layer addSublayer:self.indicator];
    [self.scrollView setContentSize:CGSizeMake(60 * ([self.buttons count] + 1), CGRectGetHeight(self.scrollView.frame))];
}

- (void)didClickButton:(UIButton *)sender
{
    if (sender.tag == self.currentCategories) return;
    
    [self transitionFromViewController:[self.childViewControllers objectAtIndex:self.currentCategories] toViewController:[self.childViewControllers objectAtIndex:sender.tag] duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        self.currentCategories = sender.tag;
    }];
    
    self.indicator.frame = CGRectMake(sender.tag * 60 ,
                                      CGRectGetMinY(self.indicator.frame),
                                      CGRectGetWidth(self.indicator.frame),
                                      CGRectGetHeight(self.indicator.frame));
}

#pragma mark - WZCategoriesSelectionDelegate
- (void)didSelectComponentsInCategories:(WZComponents *)selectedComponent type:(WZComponentsType)type selectionIndex:(NSInteger)index
{
    CALayer *layer = [selectedComponent componentLayer];
    layer.zPosition = type;
    layer.contentsScale = self.previewContainerView.bounds.size.width / 500.0f;
    layer.frame = self.previewContainerView.layer.bounds;
    
    if ([self.bodies objectForKey:@(type)]) {
        CALayer *layer = [self.previewContainerView.layer valueForKey:[self stringFromType:type]];
        [layer removeFromSuperlayer];
    }
    
    [self.previewContainerView.layer setValue:layer forKey:[self stringFromType:type]];
    [self.previewContainerView.layer addSublayer:layer];
    [self.bodies setObject:@(index) forKey:@(type)];
    self.currentCategories = type;
}

@end
