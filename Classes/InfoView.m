//
//  InfoView.m
//  Spring
//
//  Created by Zachary Galant on 10/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "InfoView.h"


@implementation InfoView
@synthesize infoLabel;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame view:self])) {
        infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 120, 280, 180)];
		infoLabel.numberOfLines = 12;
		infoLabel.textAlignment = UITextAlignmentCenter;
		infoLabel.backgroundColor = [UIColor clearColor];
		[infoLabel setFont:[UIFont boldSystemFontOfSize:18]];
		NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
		infoLabel.text = [NSString stringWithFormat:
						  @"Eat All The Donuts To Move On\n"
						  @"Avoid The Spikes\n\n"
						  @"Tilt left and right to move.\n"
						  @"Tap to Pause\n\n"
						  @"Try to beat all %@ Levels!\n"
						  @"Tap D/L to download levels",						  
						  [prefs objectForKey:@"LAST_LEVEL"]];
		[self addSubview:infoLabel];
    }
    return self;
}


-(void)changeNumLevels {
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	infoLabel.text = [NSString stringWithFormat:
					  @"Eat All The Donuts To Move On\n"
					  @"Avoid The Spikes\n\n"
					  @"Tilt left and right to move.\n"
					  @"Tap to Pause\n\n"
					  @"Try to beat all %@ Levels!"
					  @"Tap D/L to download levels",
					  [prefs objectForKey:@"LAST_LEVEL"]];
}


- (void)dealloc {
    [super dealloc];
	[infoLabel release];
}


@end
