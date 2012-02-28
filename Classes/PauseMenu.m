//
//  PauseMenu.m
//  Spring
//
//  Created by Zachary Galant on 8/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PauseMenu.h"


@implementation PauseMenu
@synthesize titleLabel, resumeButton, menuButton;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame view:self])) {
        // Initialization code
		[self designLayout];
    }
    return self;
}

-(void)designLayout {
	
	titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 135, 280, 80)];
	titleLabel.textAlignment = UITextAlignmentCenter;
	titleLabel.font = [UIFont fontWithName:@"VTC ScreamItLoud" size:24];
	titleLabel.text = @"Paused";
	titleLabel.numberOfLines = 3;
	titleLabel.backgroundColor = [UIColor clearColor];
	[self addSubview:titleLabel];
	
	resumeButton = [[ButtonView alloc] initWithFrame:CGRectMake(30, 225, 0, 0) label:@"play" selector:@selector(resume) delegate:self];
	[self addSubview:resumeButton];
	
	menuButton = [[ButtonView alloc] initWithFrame:CGRectMake(190, 225, 0, 0) label:@"menu" selector:@selector(backToMenu) delegate:self];
	[self addSubview:menuButton];

}

-(void)resume {
	[delegate resume];
}


- (void)dealloc {
    [super dealloc];
	[titleLabel release];
	[resumeButton release];
	[menuButton release];
}


@end
