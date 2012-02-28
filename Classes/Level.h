//
//  Level.h
//  Spring
//
//  Created by Zachary Galant on 10/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"

@interface Level : NSObject {
	NSMutableArray *spikes;
	BOOL spikeMoveRight;
	BOOL spikesMoveTogether;
	NSString *ID;
}

@property(nonatomic, retain) NSMutableArray *spikes;
@property(nonatomic) BOOL spikeMoveRight;
@property(nonatomic) BOOL spikesMoveTogether;
@property(nonatomic, retain) NSString *ID;

+(id)levelWithID:(NSString *)levelID;

@end
