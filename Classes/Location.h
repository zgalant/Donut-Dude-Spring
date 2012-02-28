//
//  Point.h
//  Spring
//
//  Created by Zachary Galant on 10/17/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Location : NSObject {
	double x;
	double y;
}

@property(nonatomic) double x;
@property(nonatomic) double y;

-(id)initWithCGPoint:(CGPoint)p;
-(id)initWithX:(double)theX andY:(double)theY;

@end
