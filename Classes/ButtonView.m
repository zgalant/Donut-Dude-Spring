//
//  ButtonView.m
//  Spring
//
//  Created by Zachary Galant on 10/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ButtonView.h"


@implementation ButtonView
@synthesize button, label;


- (id)initWithFrame:(CGRect)frame label:(NSString *)text selector:(SEL)selector delegate:(id)del {
	if ((self = [super initWithFrame:frame])) {
		// Initialization code
		if (self.frame.size.width == 0 && self.frame.size.height == 0) {
			// default size for button
			self.frame = CGRectMake(frame.origin.x, frame.origin.y, 100, 40);
		}

		
		button = [UIButton buttonWithType:UIButtonTypeCustom];
		button.frame = CGRectMake(0, 0, 100, 40);
		[button setImage:[UIImage imageNamed:@"button.png"] forState: UIControlStateNormal];
		[button setImage:[UIImage imageNamed:@"buttonPressed.png"] forState: UIControlStateHighlighted];
		[button addTarget:del action:selector forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:button];
		
		label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
		label.textAlignment = UITextAlignmentCenter;
		label.font = [UIFont fontWithName:@"VTC ScreamItLoud" size:20];
		label.text = text;
		label.backgroundColor = [UIColor clearColor];
		[self addSubview:label];
		
	}
	return self;
}

-(void)setText:(NSString *)text {
	label.text = text;
}

-(void)setTextSize:(int)size {
	label.font = [UIFont fontWithName:@"VTC ScreamItLoud" size:size];
}


- (void)dealloc {
    [super dealloc];
	[label release];
	[button release];
}


@end
