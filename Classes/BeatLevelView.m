//
//  BeatLevelView.m
//  Spring
//
//  Created by Zachary Galant on 10/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BeatLevelView.h"


@implementation BeatLevelView
@synthesize titleLabel, timeLabel, recordLabel, nextButton, menuButton;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame view:self])) {
        // Initialization code
		[self designLayout];
    }
    return self;
}

-(void)designLayout {
	
	titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 115, 280, 40)];
	titleLabel.textAlignment = UITextAlignmentCenter;
	titleLabel.font = [UIFont fontWithName:@"VTC ScreamItLoud" size:24];
	titleLabel.backgroundColor = [UIColor clearColor];
	[self addSubview:titleLabel];
	
	timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 190, 280, 30)];
	timeLabel.textAlignment = UITextAlignmentCenter;
	timeLabel.font = [UIFont fontWithName:@"VTC ScreamItLoud" size:20];
	timeLabel.text = @"Your Time";
	timeLabel.backgroundColor = [UIColor clearColor];
	[self addSubview:timeLabel];
	
	//recordLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 210, 280, 30)];
//	recordLabel.textAlignment = UITextAlignmentCenter;
//	recordLabel.font = [UIFont fontWithName:@"VTC ScreamItLoud" size:20];
//	recordLabel.text = @"Record";
//	recordLabel.backgroundColor = [UIColor clearColor];
//	[self addSubview:recordLabel];
	
	nextButton = [[ButtonView alloc] initWithFrame:CGRectMake(30, 255, 0, 0) label:@"next" selector:@selector(resume) delegate:self];
	[self addSubview:nextButton];
	
	menuButton = [[ButtonView alloc] initWithFrame:CGRectMake(190, 255, 0, 0) label:@"menu" selector:@selector(backToMenu) delegate:self];
	[self addSubview:menuButton];
	
}

-(void)setLevel:(int)level {
	titleLabel.text = [NSString stringWithFormat:@"You Beat Level %d", level];
}

-(void)setTime:(NSString *)timeString {
	timeLabel.text = [NSString stringWithFormat:@"Your Time: %@", timeString];
}

-(void)resume {
	[delegate resume];
}

- (void)dealloc {
    [super dealloc];
	[titleLabel release];
	[timeLabel release];
	//[recordLabel release];
	[nextButton release];
	[menuButton release];
}


@end
