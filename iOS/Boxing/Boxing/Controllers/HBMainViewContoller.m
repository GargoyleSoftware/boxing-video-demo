//
//  HBMainViewContoller.m
//  Boxing
//
//  Created by Chris Jeane on 10/4/13.
//  Copyright (c) 2013 Chris Jeane. All rights reserved.
//

#import "HBMainViewContoller.h"
#import "HBPoster.h"

@interface HBMainViewContoller ()

@property HBPoster *poster;

@end

@implementation HBMainViewContoller

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view setBackgroundColor:[UIColor blackColor]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setupPoster];
}

- (void)setupPoster
{
    self.poster = [[HBPoster alloc] initWithImage:[UIImage imageNamed:@"poster"]];
    [self.view addSubview:self.poster];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.poster
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.poster.superview
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.f
                                                           constant:0.f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.poster
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.poster.superview
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.f
                                                           constant:0.f]];
    [self.poster addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self.poster
                                                                              action:@selector(rotate)]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
