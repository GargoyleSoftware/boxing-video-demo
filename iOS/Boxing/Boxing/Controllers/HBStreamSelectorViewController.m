//
//  HBStreamSelectorViewController.m
//  Boxing
//
//  Created by Chris Jeane on 10/5/13.
//  Copyright (c) 2013 Chris Jeane. All rights reserved.
//

#import "HBStreamSelectorViewController.h"

@interface HBStreamSelectorViewController ()

@property MPMoviePlayerController *initalPlayer;

@end

@implementation HBStreamSelectorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.translatesAutoresizingMaskIntoConstraints = NO;
        self.view.backgroundColor = [UIColor darkGrayColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *contentUrl = [NSURL URLWithString:@"http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8"];
    self.initalPlayer = [[MPMoviePlayerController alloc] initWithContentURL:contentUrl];
    
    [self.initalPlayer prepareToPlay];
    self.initalPlayer.shouldAutoplay = NO;
    self.initalPlayer.controlStyle = MPMovieControlStyleEmbedded;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.delegate shouldSwitchToPlayer:self.initalPlayer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
