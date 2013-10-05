//
//  HBMainViewContoller.h
//  Boxing
//
//  Created by Chris Jeane on 10/4/13.
//  Copyright (c) 2013 Chris Jeane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

#import "HBStreamSelectorViewController.h"

@interface HBVideoFeedViewController : UIViewController<HBStreamSelectorViewControllerDelegate>

- (void)shouldSwitchToPlayer:(MPMoviePlayerController *)player;

@end
