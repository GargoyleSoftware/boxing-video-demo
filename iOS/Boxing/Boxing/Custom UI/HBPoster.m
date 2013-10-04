//
//  HBPoster.m
//  Boxing
//
//  Created by Chris Jeane on 10/4/13.
//  Copyright (c) 2013 Chris Jeane. All rights reserved.
//

#import "HBPoster.h"
#import "UIView+Autolayout.h"

@interface HBPoster ()

@property UIView *coverView;
@property bool isRotated;

@end

@implementation HBPoster

- (id)initWithImage:(UIImage *)image
{
    self = [super initWithImage:image];
    if (self) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.userInteractionEnabled = YES;
        self.isRotated = NO;
        [self setupCoverView];
    }
    
    return self;
}

- (void)setupCoverView
{
    self.coverView = [UIView autolayoutView];
    
    [self.coverView setBackgroundColor:[UIColor whiteColor]];
    self.coverView.hidden = YES;
    [self addSubview:self.coverView];
    self.coverView.userInteractionEnabled = YES;
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[_coverView]-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:NSDictionaryOfVariableBindings(_coverView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_coverView]-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:NSDictionaryOfVariableBindings(_coverView)]];
}

- (void)rotate
{
    self.isRotated = !self.isRotated;
    
    [UIView beginAnimations:@"PosterRotate" context:nil];
    
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self cache:YES];
    
    if (self.isRotated) {
        self.coverView.hidden = NO;
    } else {
        self.coverView.hidden = YES;
    }
    
    [UIView commitAnimations];

}



@end
