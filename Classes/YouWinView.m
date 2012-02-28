//
//  YouWinView.m
//  Spring
//
//  Created by Zachary Galant on 10/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "YouWinView.h"


@implementation YouWinView
@synthesize menuButton, timeLabel, timeString, del, background, donut, winImage;


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		[self designLayout];
    }
    return self;
}

-(void)designLayout {
	
	
	background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
	background.frame = CGRectMake(0, 0, 320, 460);
	[self addSubview:background];
	
	
	timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 90, 240, 40)];
	timeLabel.textAlignment = UITextAlignmentCenter;
	timeLabel.font = [UIFont fontWithName:@"VTC ScreamItLoud" size:22];
	timeLabel.backgroundColor = [UIColor clearColor];
	[self addSubview:timeLabel];
	
	winImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"winText"]];
	winImage.frame = CGRectMake(0, 30, 320, 56);
	[self addSubview:winImage];
	
	donut = [[BigDonut alloc] initWithFrame:CGRectMake(41, 135, 228, 228)];
	[self addSubview:donut];
	
	menuButton = [[ButtonView alloc] initWithFrame:CGRectMake(110, 370, 100, 40) label:@"menu" selector:@selector(backToMenu) delegate:self];
	[self addSubview:menuButton];
	
}

-(void)backToMenu {
	[del backToMenu];
}



- (void)dealloc {
    [super dealloc];
	[background release];
	[timeLabel release];
	[menuButton release];
	[donut release];
	[winImage release];
}


@end
