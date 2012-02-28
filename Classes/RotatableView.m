//
//  RotatableView.m
//  Spring
//
//  Created by Zachary Galant on 10/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RotatableView.h"


@implementation RotatableView
@synthesize gestureStartPoint;

#define degreesToRadians(x) (M_PI * x / 180.0)
#define kMinimumGestureLength  5
#define kMaximumVariance   20


- (id)initWithFrame:(CGRect)frame timeInterval:(double)interv {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		interval = interv;
		angle = degreesToRadians(1);
		self.userInteractionEnabled = NO; // Default no user spinning
		[NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(rotate) userInfo:nil repeats:YES];
    }
    return self;
}


-(void)rotate {	
	self.transform = CGAffineTransformRotate(self.transform, angle);

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	gestureStartPoint = [touch locationInView:self];
	angle = 0;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [touches anyObject];
	CGPoint currentPosition = [touch locationInView:self];    
	
	CGFloat dx = gestureStartPoint.x - currentPosition.x;
	CGFloat dy = gestureStartPoint.y - currentPosition.y;
	
	double theta = atan(dy/dx);
	angle = theta;

}






- (void)dealloc {
    [super dealloc];
}


@end
