//
//  donutDudeSpringViewController.m
//  donutDudeSpring
//
//  Created by Zachary Galant on 8/24/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "donutDudeSpringViewController.h"


#define kGameStateRunning 1
#define kGameStatePaused 2
#define kGameStateOver 3
#define kGravity 5
#define kMoveSpeed 5
#define kJumpStrength -60
#define kMaxGravity 30
#define kSpikeSpeed 6
#define kAccelerometerFrequency 30
#define ktiltWeight 12
#define kDudeWidth 21
#define kDudeHeight 39
#define kSpringHeight 400
#define kMoveThreshold 0.1



@implementation donutDudeSpringViewController

@synthesize menuViewController, dude, spring, gameState, dudeVelocity, tapToPlay, moveLeft, moveRight, spikeMoveRight, 
xValue, moveSpeed, curLevel, timeLabel, levelLabel, time, winLabel, youWin, level, beatLevelMenu;


#pragma mark -
#pragma mark Moving Methods
-(void)moveDudeLeft {

	moveLeft = YES;
	moveRight = NO;
	[dude setImage:[UIImage imageNamed:@"dudeLeft"]];
}
-(void)moveDudeRight {
	
	moveLeft = NO;
	moveRight = YES;
	[dude setImage:[UIImage imageNamed:@"dudeRight"]];
}

-(void)stopMoving {
	moveLeft = NO;
	moveRight = NO;
	dudeVelocity.x = 0;
}

-(void)rightMove {
	if (dude.center.x + kDudeWidth/2 >= self.view.bounds.size.width) {
		[self stopMoving];
		return;
	}
	dudeVelocity.x = moveSpeed;
}
-(void)leftMove {
	if (dude.center.x - kDudeWidth/2 <= 0) {
		[self stopMoving];
		return;
	}
	dudeVelocity.x = moveSpeed;
}

-(void)moveSpikes {
	Spike *theSpike;
	for (int i=0; i<[level.spikes count]; i++) {
		theSpike = [level.spikes objectAtIndex:i];
		if (!theSpike.active) continue;
		if (theSpike.center.x <= 0) {
			spikeMoveRight = YES;
			theSpike.xSpeed = fabs(theSpike.xSpeed);
		} else if (theSpike.center.x >= self.view.bounds.size.width) {
			spikeMoveRight = NO;
			theSpike.xSpeed = -1 * fabs(theSpike.xSpeed);
		}
		if (!level.spikesMoveTogether) {
			theSpike.center = CGPointMake(theSpike.center.x + theSpike.xSpeed, theSpike.center.y);
		} else if (spikeMoveRight) {
			theSpike.center = CGPointMake(theSpike.center.x + fabs(theSpike.xSpeed), theSpike.center.y);
		} else {
			theSpike.center = CGPointMake(theSpike.center.x - fabs(theSpike.xSpeed), theSpike.center.y);
		}
	}
}

#pragma mark -

-(BOOL)inAir {
	if (CGRectIntersectsRect(dude.frame, spring.frame) || dude.center.y > kSpringHeight - kDudeHeight/2){
		dudeVelocity.y = kJumpStrength;
		return NO;
	}
	dudeVelocity.y += kGravity;
	if (dudeVelocity.y > kMaxGravity) {
		dudeVelocity.y = kMaxGravity;
	}
	// Test if dude will go through springs and adjust velocity accordingly
	if (dude.center.y + dudeVelocity.y > kSpringHeight - kDudeHeight/2) {
		dudeVelocity.y = kSpringHeight - dude.center.y - kDudeHeight/2;
	}
	return YES;
}

-(BOOL)donutCollision {
	Donut *d;
	BOOL collision = NO;
	for (int i=0; i< [level.donuts count]; i++) {
		d = [level.donuts objectAtIndex:i];
		if (CGRectIntersectsRect(dude.frame, d.frame) && d.hidden == NO){
			level.numDonutsLeft--;
			d.hidden = YES;
			collision = YES;
		}
	}
	return collision;
}

-(BOOL)spikeCollision {
	Spike *theSpike;
	for (int i=0; i< [level.spikes count]; i++) {
		theSpike = [level.spikes objectAtIndex:i];
		if (theSpike.active && CGRectIntersectsRect(dude.frame, theSpike.frame)){
			dude.center = theSpike.center;
			return YES;
		}
	}
	return NO;
}


#pragma mark -
#pragma mark Update Methods

-(void)updateTime {
	timeLabel.text = [NSString stringWithFormat:@"Total Time: %@",[self getTimeString]];
	time += 0.05;
}

-(NSString *)getTimeString {
	NSString *timeString = [NSString stringWithFormat:@"%d:%d", (int)time/60, (int)time % 60];
	if ((int)time % 60 < 10) timeString = [NSString stringWithFormat:@"%d:0%d", (int)time/60, (int)time % 60];
	return timeString;
}

-(void)updateDefaults {
	//NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	//[prefs setInteger:curLevel forKey:@"curLevel"];
	//[prefs setObject:[NSNumber numberWithDouble:time] forKey:@"time"];
}

#pragma mark -
#pragma mark Create Object Methods

-(void)createLevel {
	if (gameState == kGameStateOver) {
		NSString *levelLabelText = [NSString stringWithFormat:@"You Win"];
		levelLabel.text = levelLabelText;
	} else {
		//level.levelDescription = [Level levelWithID:[NSString stringWithFormat:@"%d", curLevel]];
		level.ID = [NSString stringWithFormat:@"%d", curLevel];
		[level setUp];
		NSString *levelLabelText = [NSString stringWithFormat:@"%d", curLevel];
		levelLabel.text = levelLabelText;
	}
}

#pragma mark -

-(void)resetLevel:(int)levelNumber {
	curLevel = levelNumber;
	dude.center = CGPointMake(self.view.bounds.size.width/2, kSpringHeight - kDudeHeight);
	[self createLevel];
	dudeVelocity = CGPointMake(0, kGravity);
	[self stopMoving];
	tapToPlay.hidden = NO;
}

-(void)setUpAccelerometer {
	UIAccelerometer *acc = [UIAccelerometer sharedAccelerometer];
	acc.delegate = self;
	acc.updateInterval = 1 / kAccelerometerFrequency;
}
#pragma mark -
#pragma mark View Controller Delegate Methods


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	
	curLevel = 1;
	time = 0;
	self.gameState = kGameStatePaused;

	dudeVelocity = CGPointMake(0, kGravity);
	[self stopMoving];
	moveSpeed = 0;
	
	[self designLayout];
	[self createLevel];
	[self setUpAccelerometer];
	[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
    
}

-(void)designLayout {
	level = [[LevelView alloc] initWithID:[NSString stringWithFormat:@"%d", curLevel]];
	[self.view addSubview:level];
	
	pauseMenu = [[PauseMenu alloc] initWithFrame:CGRectMake(0, 0, 320, 420)];
	pauseMenu.delegate = self;
	pauseMenu.hidden = YES;
	[self.view addSubview:pauseMenu];
	
	
	tapToPlay = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 280, 50)];
	tapToPlay.textAlignment = UITextAlignmentCenter;
	tapToPlay.font = [UIFont fontWithName:@"VTC ScreamItLoud" size:24];
	tapToPlay.text = @"Tap To Play";
	tapToPlay.backgroundColor = [UIColor clearColor];
	[self.view addSubview:tapToPlay];
	
	youWin = [[YouWinView alloc] initWithFrame:CGRectMake(0, 0, 320, 420)];
	youWin.del = self;
	youWin.hidden = YES;
	[self.view addSubview:youWin];

	beatLevelMenu = [[BeatLevelView alloc] initWithFrame:CGRectMake(0, 0, 320, 420)];
	beatLevelMenu.hidden = YES;
	beatLevelMenu.delegate = self;
	[self.view addSubview:beatLevelMenu];
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	[prefs setInteger:1 forKey:@"curLevel"];
	[prefs setDouble:0 forKey:@"time"];
}

#pragma mark -
#pragma mark User Interaction Delegate Methods

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
	if (gameState != kGameStateRunning) {
		moveSpeed = 0;
		return;
	}
	xValue = acceleration.x;
	if (xValue < -kMoveThreshold) {
		moveSpeed = -kMoveSpeed + ktiltWeight*xValue;
		[self moveDudeLeft];
	}
	else if (xValue > kMoveThreshold) {
		moveSpeed = kMoveSpeed + ktiltWeight*xValue;
		[self moveDudeRight];
	}
	else [self stopMoving];
}

// Returns NO if a menu is up. Returns YES if the menus are all not being displayed
-(BOOL)noMenusShowing {
	if (!pauseMenu.hidden) return NO;
	if (!beatLevelMenu.hidden) return NO;
	if (!youWin.hidden) return NO;
	
	return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if (gameState == kGameStatePaused && [self noMenusShowing]) {
		tapToPlay.hidden = YES;
		gameState = kGameStateRunning;
		if ([self spikeCollision]) {
			gameState = kGameStatePaused;
			tapToPlay.text = @"Tap To Play.";
			[self resetLevel:curLevel];
		}
	} else if (gameState == kGameStateRunning) {
		gameState = kGameStatePaused;
		pauseMenu.titleLabel.text = @"Paused";
		[pauseMenu.resumeButton setText:@"play"];
		pauseMenu.hidden = NO;
		[self.view bringSubviewToFront:pauseMenu];
	}
}

-(void)resume {
	gameState = kGameStatePaused;
	tapToPlay.hidden = NO;
	pauseMenu.hidden = YES;
	beatLevelMenu.hidden = YES;
	
	if (level.numDonutsLeft == 0) {
		gameState = kGameStatePaused;
		[self resetLevel:curLevel+1];
	}
	if ([self spikeCollision]) {
		gameState = kGameStatePaused;
		tapToPlay.text = @"Tap To Play.";
		[self resetLevel:curLevel];
	}
}

-(void)backToMenu {
	gameState = kGameStateOver;
	curLevel = 1;
	time = 0;
	[self presentModalViewController:menuViewController animated:YES];
	
}

#pragma mark -

-(void)gameLoop {
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	if (gameState == kGameStateRunning) {
		[self inAir];
		if(moveLeft) [self leftMove];
		if(moveRight) [self rightMove];
		dude.center = CGPointMake(dude.center.x + dudeVelocity.x, dude.center.y + dudeVelocity.y);
		if ([self donutCollision] && level.numDonutsLeft == 0) {
			gameState = kGameStatePaused;
			
			if (curLevel == [[prefs objectForKey:@"LAST_LEVEL"] intValue]) {
				gameState = kGameStateOver;
				youWin.timeLabel.text = [NSString stringWithFormat:@"It Took You: %@", [self getTimeString]];
				youWin.hidden = NO;
				[self.view bringSubviewToFront:youWin];
			} else {
				[beatLevelMenu setLevel:curLevel];
				beatLevelMenu.hidden = NO;
				[beatLevelMenu setTime:[self getTimeString]];
				[self.view bringSubviewToFront:beatLevelMenu];
			}
		}
		[self moveSpikes];
		if ([self spikeCollision]) {
			gameState = kGameStatePaused;
			tapToPlay.hidden = YES;
			pauseMenu.titleLabel.text = @"Ouch. That Hurt!\n\n Try Again.";
			pauseMenu.hidden = NO;
			[self.view bringSubviewToFront:pauseMenu];
		}
		[self updateTime];
		[self updateDefaults];
	}
}


- (void)dealloc {
    [dude release];
	[spring release];
	[tapToPlay release];
	int count = [donuts count];
	for (int i=0; i<count; i++) {
		[[donuts objectAtIndex:i] release];
	}
	[donuts release];
	count = [spikes count];
	for (int i=0; i<count; i++) {
		[[spikes objectAtIndex:i] release];
	}
	[spikes release];
	
	[pauseMenu release];
	[level release];
	[beatLevelMenu release];
	[super dealloc];
	
}

@end
