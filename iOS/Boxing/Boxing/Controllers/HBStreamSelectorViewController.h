//
//  HBStreamSelectorViewController.h
//  Boxing
//
//  Created by Chris Jeane on 10/5/13.
//  Copyright (c) 2013 Chris Jeane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@protocol HBStreamSelectorViewControllerDelegate <NSObject>

- (void)shouldSwitchToPlayer:(MPMoviePlayerController *)player;

@end

@interface HBStreamSelectorViewController : UIViewController

@property (weak) id<HBStreamSelectorViewControllerDelegate> delegate;

@end
