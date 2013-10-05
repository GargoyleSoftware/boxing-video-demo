//
//  HBMainMenuViewController.m
//  Boxing
//
//  Created by David Young-Chan Kay on 10/5/13.
//  Copyright (c) 2013 Chris Jeane. All rights reserved.
//

#import "HBVideoFeedViewController.h"
#import "HBNewsArticleViewController.h"
#import "HBMainMenuViewController.h"

@interface HBMainMenuViewController ()

@end

@implementation HBMainMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"HBO Boxing";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IB Actions

- (IBAction)viewStreamButtonWasPressed:(id)sender
{
    NSLog(@"viewStreamButtonWasPressed");

    HBVideoFeedViewController *vc = [[HBVideoFeedViewController alloc] init];

    [self.navigationController pushViewController: vc
                                         animated: YES];

    //[self presentViewController: vc
                       //animated: YES
                     //completion: ^{}
    //];
}

- (IBAction)newsButtonWasPressed:(id)sender
{

    NSLog(@"newsButtonWasPressed");


    HBNewsArticleViewController *vc = [[HBNewsArticleViewController alloc] init];


    [self.navigationController pushViewController: vc
                                         animated: YES];
//
//    [self presentViewController: vc
//                       animated: YES
//                     completion: ^{}
//    ];

}

@end

