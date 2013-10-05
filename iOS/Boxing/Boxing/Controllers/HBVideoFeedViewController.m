//
//  HBMainViewContoller.m
//  Boxing
//
//  Created by Chris Jeane on 10/4/13.
//  Copyright (c) 2013 Chris Jeane. All rights reserved.
//

#import "HBVideoFeedViewController.h"
#import "UIView+Autolayout.h"

@interface HBVideoFeedViewController ()

@property UIImageView *posterImageView;
@property MPMoviePlayerController *moviePlayer;
@property HBStreamSelectorViewController *streamSelector;
@property UIView *playerView;
@property bool isRotated;

@end

@implementation HBVideoFeedViewController

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
    [self setupPlayerView];
    [self setupStreamSelector];
}

- (void)setupPoster
{
    self.posterImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"poster"]];
    self.posterImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.posterImageView.userInteractionEnabled = YES;
    [self.view addSubview:self.posterImageView];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_posterImageView]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_posterImageView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-44-[_posterImageView]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_posterImageView)]];
}

- (void)setupPlayerView
{
    self.playerView = [[UIView alloc] init];
    self.playerView.translatesAutoresizingMaskIntoConstraints = NO;
    self.playerView.backgroundColor = [UIColor blackColor];

    [self.posterImageView addSubview:self.playerView];
    [self.posterImageView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[_playerView]-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_playerView)]];
    [self.posterImageView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_playerView]-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_playerView)]];
    self.playerView.hidden = YES;
}

- (void)setupStreamSelector
{
    self.streamSelector = [[HBStreamSelectorViewController alloc] init];
    self.streamSelector.delegate = self;
    [self addChildViewController:self.streamSelector];
    [self.view addSubview:self.streamSelector.view];
    UIView *streamSelectorView = self.streamSelector.view;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_posterImageView, streamSelectorView);
    NSString *visualFormat = @"V:[_posterImageView][streamSelectorView]-10-|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:visualFormat
                                                                     options:NSLayoutFormatAlignAllLeft
                                                                     metrics:nil
                                                                       views:views]];
    visualFormat = @"[streamSelectorView(_posterImageView)]";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:visualFormat
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self rotate];
    });
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.moviePlayer stop];
}

- (void)rotate
{
    self.isRotated = !self.isRotated;

    [UIView beginAnimations:@"PosterRotate" context:nil];

    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.posterImageView cache:YES];

    if (self.isRotated) {
        self.playerView.hidden = NO;
        [self.moviePlayer play];
    } else {
        self.playerView.hidden = YES;
        [self.moviePlayer pause];
    }

    [UIView commitAnimations];

}

#pragma mark HBStreamSelectorViewController Delegate

- (void)shouldSwitchToPlayer:(MPMoviePlayerController *)player
{
    self.moviePlayer = player;
    
    [self.moviePlayer.view setFrame:self.playerView.bounds];
    [self.playerView addSubview:self.moviePlayer.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
