//
//  InGameMenu.m
//  Spring
//
//  Created by Zachary Galant on 10/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "InGameMenu.h"


@implementation InGameMenu
@synthesize dimmedBackground, background, delegate;


- (id)initWithFrame:(CGRect)frame view:(id)menu {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		dimmedBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
		dimmedBackground.backgroundColor = [UIColor blackColor];
		dimmedBackground.alpha = 0.6;
		[menu addSubview:dimmedBackground];
		
		background = [[UIImageView alloc] initWithFrame:CGRectMake(20, 115, 280, 190)];
		[background setImage:[UIImage imageNamed:@"menuBackground"]];
		[menu addSubview:background];
    }
    return self;
}


-(void)backToMenu {
	[delegate backToMenu];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
    [super dealloc];
	[dimmedBackground release];
	[background release];
}


@end
