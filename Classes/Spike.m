//
//  Spike.m
//  Spring
//
//  Created by Zachary Galant on 9/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Spike.h"


@implementation Spike
@synthesize spikeView, x, y, xSpeed, ySpeed, active;


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame timeInterval:0.005])) {
        // Initialization code
		self.frame = CGRectMake(frame.origin.x, frame.origin.y, 20, 20);
		spikeView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"spike.png"]];
		spikeView.frame = CGRectMake(0, 0, 20, 20);
		[self addSubview:spikeView];
		self.x = frame.origin.x;
		self.y = frame.origin.y;
		xSpeed = 6;
		active = NO;
    }
    return self;
}

-(void)move {
	CGRect newFrame = self.frame;
	self.x = self.frame.origin.x + xSpeed;
	if (x > 300) [self bounceLeft];
	if (x < 0) [self bounceRight];
	self.y = self.frame.origin.y + ySpeed;
	newFrame = CGRectMake(x, y, self.frame.size.width, self.frame.size.height);
	self.frame = newFrame;
}

-(void)bounceRight {
	xSpeed = fabs(xSpeed);
}
-(void)bounceLeft {
	xSpeed = -1 * fabs(xSpeed);
}

- (void)dealloc {
    [super dealloc];
	[spikeView dealloc];
}


@end
