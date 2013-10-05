//
//  HBNewsArticleViewController.m
//  Boxing
//
//  Created by David Young-Chan Kay on 10/5/13.
//  Copyright (c) 2013 Chris Jeane. All rights reserved.
//

#import "HBNewsArticleViewController.h"

@interface HBNewsArticleViewController ()

@end

@implementation HBNewsArticleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"News Article";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
