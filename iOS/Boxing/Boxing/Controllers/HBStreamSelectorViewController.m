//
//  HBStreamSelectorViewController.m
//  Boxing
//
//  Created by Chris Jeane on 10/5/13.
//  Copyright (c) 2013 Chris Jeane. All rights reserved.
//

#import "HBStreamSelectorViewController.h"

@interface HBStreamSelectorViewController ()

@property NSMutableArray *streamPlayers;
@property NSMutableArray *streamPreviews;

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
    _streamPlayers = [NSMutableArray array];
    _streamPreviews = [NSMutableArray array];
    
    [self setupStreamPlayers];
    [self setupStreamPreviews];
}

- (void)setupStreamPlayers
{
    for (int i = 0; i < 4; i++) {
        MPMoviePlayerController *player = [self createStreamPlayerWithFilename:[NSString stringWithFormat:@"CamVideo%i", i]];
        [self.streamPlayers addObject:player];
    }
}

- (MPMoviePlayerController *)createStreamPlayerWithFilename:(NSString *)fileName
{
    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:fileName withExtension:@"m4v"];
    MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:fileUrl];
    player.shouldAutoplay = NO;
    
    return player;
}

- (void)setupStreamPreviews
{
    NSMutableDictionary *views = [NSMutableDictionary dictionary];
    for (int i = 0; i < 4; i++) {
        UIImage *previewImage = [UIImage imageNamed:[NSString stringWithFormat:@"preview%i", i]];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:previewImage];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(switchPlayer:)]];
        
        [self.view addSubview:imageView];
        [views setObject:imageView forKey:[NSString stringWithFormat:@"imageView%i", i]];
        
        [self.streamPreviews addObject:imageView];
    }
    
    NSDictionary *metrics = @{@"height": @70.0, @"width": @150.0};
    NSString *visualFormat = @"|-[imageView0(width)]-[imageView1(width)]-[imageView2(width)]-[imageView3(width)]";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:visualFormat
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    
    for (int i = 0; i < 4; i++) {
        NSString *verticalVisualFormat = [NSString stringWithFormat:@"V:|[imageView%i(height)]|", i ];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:verticalVisualFormat
                                                                          options:0
                                                                          metrics:metrics
                                                                            views:views]];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    MPMoviePlayerController *player = [self.streamPlayers objectAtIndex:0];
    [self.delegate shouldSwitchToPlayer:player];
}

- (void)switchPlayer:(UIGestureRecognizer *) sender
{
    int index = [self.streamPreviews indexOfObject:sender.view];
    if (index != -1) {
        [self.delegate shouldSwitchToPlayer:[self.streamPlayers objectAtIndex:index]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
