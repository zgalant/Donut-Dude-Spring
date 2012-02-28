//
//  SpinningDonut.m
//  Spring
//
//  Created by Zachary Galant on 10/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BigDonut.h"


@implementation BigDonut
@synthesize donut;


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame timeInterval:0.05])) {
        // Initialization code
		self.frame = CGRectMake(frame.origin.x, frame.origin.y, 228, 228);
		donut = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bigDonut.png"]];
		donut.frame = CGRectMake(0,0, 228, 228);
		[self addSubview:donut];
		self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
	[donut release];
}


@end
