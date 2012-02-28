//
//  Level.h
//  Spring
//
//  Created by Zachary Galant on 10/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Donut.h"
#import "Spike.h"
#import "Level.h"
#import "Location.h"


@interface LevelView : UIView {
	NSMutableArray *spikes;
	NSMutableArray *donuts;
	BOOL spikeMoveRight;
	BOOL spikesMoveTogether;
	NSString *ID;
	Level *levelDescription;
	int numDonutsLeft;
	NSString *theLevels;
}

@property(nonatomic, retain) NSMutableArray *spikes;
@property(nonatomic, retain) NSMutableArray *donuts;
@property(nonatomic) BOOL spikeMoveRight;
@property(nonatomic) BOOL spikesMoveTogether;
@property(nonatomic, retain) NSString *ID;
@property(nonatomic, retain) Level *levelDescription;
@property(nonatomic) int numDonutsLeft;
@property(nonatomic, retain) NSString *theLevels;

@end
