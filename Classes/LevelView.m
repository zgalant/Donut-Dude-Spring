//
//  Level.m
//  Spring
//
//  Created by Zachary Galant on 10/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LevelView.h"
#import "donutDudeSpringViewController.h"

#define kSpringHeight 400

@implementation LevelView
@synthesize spikes, donuts, spikeMoveRight, spikesMoveTogether, ID, numDonutsLeft, theLevels;


-(id)initWithID:(NSString *)levelID {
	if (self = [super initWithFrame:CGRectMake(0, 0, 320, 420)]) {
		//levelDescription = [Level levelWithID:levelID];
		self.ID = levelID;
		[self createDonuts];
		[self initSpikes];
		
		
		NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
		theLevels = [prefs objectForKey:@"levels"];
	}
	return self;
}

-(void)destroyObject:(id)object {
	[object removeFromSuperview];
	[object release];
}

-(void)deactivateSpikes {
	Spike *s;
	for (s in spikes) {
		s.active = NO;
		s.hidden = YES;
	}
}

-(void)setUp {
	[self deactivateSpikes];
	[self showDonuts];
	[self createSpikes];
}

// Shows the hidden donuts (when the level is reset
-(void)showDonuts {
	Donut *d;
	for (d in donuts) {
		d.hidden = NO;
	}
	numDonutsLeft = 20;
}


// Creates donuts (when the LevelView is initialized
-(void)createDonuts {
	donuts = [[NSMutableArray alloc] initWithCapacity:20];
	for (int i=0; i<10; i++) {
		Donut *d = [[Donut alloc] initWithFrame:CGRectMake(self.frame.size.width*i/10, 40*i, 1, 1)];
		[self addSubview:d];
		[donuts addObject:d];
	}
	for (int i=0; i<10; i++) {
		Donut *d = [[Donut alloc] initWithFrame:CGRectMake(self.frame.size.width*i/10, kSpringHeight - 40 - 40*i, 1, 1)];
		[self addSubview:d];
		[donuts addObject:d];
	}
	numDonutsLeft = [donuts count];
}

-(void)initSpikes {
	self.spikes = [[NSMutableArray alloc] initWithCapacity:5];
	for (int i=0; i < 5; i++) {
		[self initOneSpike];
	}
}

-(void)initOneSpike {
	Spike *s = [[Spike alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
	[self addSubview:s];
	[self.spikes addObject:s];
	s.hidden = YES;
}

-(void)putSpikeNumber:(int)index at:(CGPoint)loc {
	if (index >= [spikes count]) {
		[self initOneSpike];
	}
	Spike *s = [self.spikes objectAtIndex:index];
	s.center = CGPointMake(loc.x, loc.y);
	s.hidden = NO;
	s.active = YES;
}

/*
 * Main method with differences between levels.
 * Creates the spikes on the level based on which level it currently is.
 * to create a new level, add a case to the switch
 */
-(void)createSpikes {
	int curLevel = [ID intValue];
	int i = 0;
	
	NSDictionary *levels = [theLevels JSONValue];
	
	NSString *levelString = [NSString stringWithFormat:@"%d", curLevel];
	
	NSDictionary *ld = [levels objectForKey:levelString];
	NSString *together = [ld objectForKey:@"together"];
	if ([together isEqualToString:@"NO"]) {
		spikesMoveTogether = NO;
	} else {
		spikesMoveTogether = YES;
	}
	NSArray *sa = [ld objectForKey:@"spikes"];
	for (int s = 0; s < [sa count]; s++) {
		NSDictionary *sd = [sa objectAtIndex:s];
		NSString *x = [sd objectForKey:@"x"];
		NSString *y = [sd objectForKey:@"y"];
		[self putSpikeNumber:s at:CGPointMake([x intValue], [y intValue])];
	}
}


- (void)dealloc {
    [super dealloc];
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
}


@end
