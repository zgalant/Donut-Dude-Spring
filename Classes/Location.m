//
//  Point.m
//  Spring
//
//  Created by Zachary Galant on 10/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Location.h"


@implementation Location
@synthesize x, y;

-(id)initWithCGPoint:(CGPoint)p {
	x = p.x;
	y = p.y;
	return self;
}

-(id)initWithX:(double)theX andY:(double)theY {
	x = theX;
	y = theY;
	return self;
}

@end
