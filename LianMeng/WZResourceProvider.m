//
//  WZResourceProvider.m
//  LianMeng
//
//  Created by satanwoo on 14-7-28.
//  Copyright (c) 2014年 Ziqi Wu. All rights reserved.
//

#import "WZResourceProvider.h"
static NSArray *resources = nil;
@implementation WZResourceProvider

+ (NSArray *)resourceArray
{
    if (!resources) {
        resources = [NSArray arrayWithObjects:
                     [NSArray arrayWithObjects:@"o1", @"o2", @"o3", @"o4", @"o5", @"o6", @"o7", @"o8", @"o9", nil],
                     [NSArray arrayWithObjects:@"l1", @"l2", @"l3", nil],
                     [NSArray arrayWithObjects:@"a1", @"a2", @"a3", nil],
                     [NSArray arrayWithObjects:@"b1", @"b2", @"b3", nil],
                     [NSArray arrayWithObjects:@"c1", @"c2", @"c3", nil],
                     [NSArray arrayWithObjects:@"d1", @"d2", @"d3", nil],
                     [NSArray arrayWithObjects:@"e1", @"e2", @"e3", nil],
                     [NSArray arrayWithObjects:@"f1", @"f2", @"f3", nil],
                     [NSArray arrayWithObjects:@"g1", @"g2", @"g3", @"g4", @"g5", @"g6", nil],
                     [NSArray arrayWithObjects:@"h1", @"h2", @"h3", @"h4", nil],
                     [NSArray arrayWithObjects:@"i1", @"i2", @"i3", nil],
                     [NSArray arrayWithObjects:@"j1", @"j2", @"j3", @"j4", nil],
                     [NSArray arrayWithObjects:@"k1", @"k2", @"k3", @"k4", nil],
                     [NSArray arrayWithObjects:@"m1", @"m2", @"m3", nil],
                     [NSArray arrayWithObjects:@"n1", @"n2", @"n3", @"n4", @"n5", @"n6", nil],
                     nil];
    }
    return resources;
}

@end
