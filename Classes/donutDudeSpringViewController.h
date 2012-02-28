//
//  donutDudeSpringViewController.h
//  donutDudeSpring
//
//  Created by Zachary Galant on 8/24/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PauseMenu.h"
#import "Donut.h"
#import "Spike.h"
#import "YouWinView.h"
#import "LevelView.h"
#import "Level.h"
#import "BeatLevelView.h"

@interface donutDudeSpringViewController : UIViewController <UIAccelerometerDelegate> {
	
	IBOutlet UIViewController *menuViewController;
	
	IBOutlet UIImageView *dude;
	IBOutlet UIImageView *spring;
	UILabel *tapToPlay;
	IBOutlet UILabel *levelLabel;
	IBOutlet UILabel *timeLabel;
	IBOutlet UILabel *winLabel;
	
	NSInteger gameState;
	
	CGPoint dudeVelocity;
	
	NSMutableArray *spikes;
	NSMutableArray *donuts;
	
	BOOL moveRight;
	BOOL moveLeft;
	BOOL spikeMoveRight;
	
	UIAccelerationValue xValue;
	double moveSpeed;
	int curLevel;
	double time;
	
	PauseMenu *pauseMenu;
	YouWinView *youWin;
	BeatLevelView *beatLevelMenu;
	
	LevelView *level;
	
	
}

@property(nonatomic, retain) IBOutlet UIViewController *menuViewController;
@property(nonatomic, retain) IBOutlet UIImageView *dude;
@property(nonatomic, retain) IBOutlet UIImageView *spring;
@property(nonatomic, retain) UILabel *tapToPlay;
@property(nonatomic, retain) IBOutlet UILabel *levelLabel;
@property(nonatomic, retain) IBOutlet UILabel *timeLabel;
@property(nonatomic, retain) IBOutlet UILabel *winLabel;
@property(nonatomic) CGPoint dudeVelocity;
@property(nonatomic) NSInteger gameState;
@property(nonatomic) BOOL moveLeft;
@property(nonatomic) BOOL moveRight;
@property(nonatomic) BOOL spikeMoveRight;
@property(nonatomic) UIAccelerationValue xValue;
@property(nonatomic) double moveSpeed;
@property(nonatomic) int curLevel;
@property(nonatomic) double time;
@property(nonatomic, retain) PauseMenu *pauseMenu;
@property(nonatomic, retain) YouWinView *youWin;
@property(nonatomic, retain) LevelView *level;
@property(nonatomic, retain) BeatLevelView *beatLevelMenu;


@end

