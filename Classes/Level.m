//
//  Level.m
//  Spring
//
//  Created by Zachary Galant on 10/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Level.h"

#define kSpringHeight 400

static NSMutableDictionary *levelDict = nil;

@implementation Level
@synthesize spikes, ID, spikeMoveRight, spikesMoveTogether;



+(id)levelWithID:(NSString *)levelID {
	if (levelDict == nil) {
		levelDict = [[NSMutableDictionary alloc] initWithCapacity:15];
	}
	Level *l = [levelDict objectForKey:levelID];
	if (l != nil && (NSNull *)l != [NSNull null]) {
		return l;
	}
	
	self = [[super alloc] init];
	ID = levelID;
	//[self setUpSpikes];
	[levelDict setValue:self forKey:ID];
	
	return self;
}


-(void)setUpSpikes {
	spikeMoveRight = YES;
	spikesMoveTogether = YES;
	spikes = [[NSMutableArray alloc] initWithCapacity:5];
	[self createSpikes];
}

/*
 * Main method with differences between levels.
 * Creates the spikes on the level based on which level it currently is.
 * to create a new level, add a case to the switch
 */
-(void)createSpikes {
	switch ([ID intValue]) {
		case 1:
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(0, kSpringHeight-10)]];
			break;
		case 2:
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(0, 420/2 + 10)]];
			break;
		case 3:
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(0, 420/2 - 120)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(0, 420/2 + 10)]];
			break;
		case 4:
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(0, 420/2 - 120)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(0, 420/2 + 10)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(0, kSpringHeight - 10)]];
			break;
		case 5:			
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(0, 420/2 - 120)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(0, 420/2 + 10)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(0, kSpringHeight-10)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(0, 420/2 - 160)]];
			break;
		case 6:
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(0, kSpringHeight-10)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(320/2 + 40,kSpringHeight-10)]];
			break;
		case 7:
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(0, 420/2 - 170)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(320/2 + 40,420/2 - 170)]];
			break;
		case 8:
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(0, 420/2 - 120)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(320/2 + 40, 420/2 + 10)]];
			break;
		case 9:
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(0, 420/2 - 120)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(320/2 + 40, 420/2 + 10)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(320/2 - 60, kSpringHeight-10)]];
			break;
		case 10:
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(0, 420/2 - 170)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(320/2 + 40, 420/2 - 120)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(320/2 - 60, kSpringHeight-10)]];
			break;
		case 11:
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(0, kSpringHeight-10)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(320/2 + 40, kSpringHeight-10)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(320/2 - 60, 420/2 - 90)]];
			break;
		case 12:
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(0, 420/2 + 10)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(320/2 + 40, 420/2 + 10)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(320/2 - 60, 420/2 - 170)]];
			break;
		case 13:
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(0, 420/2 + 10)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(320/2 + 40, kSpringHeight-10)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(320/2 + 40, 420/2 - 170)]];
			break;
		case 14:
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(0, 420/2 + 10)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(320/2 + 40, 420/2 + 10)]];
			[spikes addObject:[[Location alloc] initWithCGPoint:CGPointMake(320/2 - 60, 420/2 - 90)]];
			break;
	}
	
}

-(void)dealloc {
	[super dealloc];
	[ID release];
	//for (int i=0; i < [spikes count]; i++) {
//		[[spikes objectAtIndex:i] release];
//	}
//	[spikes release];
	
}



@end
