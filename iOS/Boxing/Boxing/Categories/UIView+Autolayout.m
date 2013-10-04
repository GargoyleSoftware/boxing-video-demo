//
//  UIView+UIView_Autolayout.m
//  Boxing
//
//  Created by Chris Jeane on 10/4/13.
//  Copyright (c) 2013 Chris Jeane. All rights reserved.
//

#import "UIView+Autolayout.h"

@implementation UIView (Autolayout)

+ (id)autolayoutView
{
    UIView *view = [self new];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}

@end
