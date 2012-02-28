//
//  Donut.m
//  Spring
//
//  Created by Zachary Galant on 9/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Donut.h"

@implementation Donut
@synthesize donutView;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame timeInterval:0.1])) {
        // Initialization code
		self.frame = CGRectMake(frame.origin.x, frame.origin.y, 30, 30);
		donutView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"donut"]];
		donutView.frame = CGRectMake(0,0, 30, 30);
		[self addSubview:donutView];
		
    }
    return self;
}


- (void)dealloc {
    [super dealloc];
	[donutView release];
	
	donutView = nil;
}


@end
