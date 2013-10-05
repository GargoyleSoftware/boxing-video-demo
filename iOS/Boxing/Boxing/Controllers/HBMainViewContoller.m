//
//  HBMainViewContoller.m
//  Boxing
//
//  Created by Chris Jeane on 10/4/13.
//  Copyright (c) 2013 Chris Jeane. All rights reserved.
//

#import "HBMainViewContoller.h"
#import "UIView+Autolayout.h"

@interface HBMainViewContoller ()

@property UIImageView *posterImageView;
@property MPMoviePlayerController *moviePlayer;
@property UIView *playerView;
@property bool isRotated;

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
    [self setupPlayerView];
}

- (void)setupPoster
{
    self.posterImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"poster"]];
    self.posterImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.posterImageView.userInteractionEnabled = YES;
    [self.view addSubview:self.posterImageView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.posterImageView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.f
                                                           constant:0.f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.posterImageView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.f
                                                           constant:0.f]];
    
    [self.posterImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(rotate)]];
    
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

- (void)viewDidAppear:(BOOL)animated {
    NSURL *contentUrl = [NSURL URLWithString:@"http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8"];
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:contentUrl];
    [self.moviePlayer prepareToPlay];
    self.moviePlayer.controlStyle = MPMovieControlStyleEmbedded;
    [self.moviePlayer.view setFrame:self.playerView.bounds];
    [self.playerView addSubview:self.moviePlayer.view];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
