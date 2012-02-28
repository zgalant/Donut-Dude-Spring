//
//  NewLevelAlert.m
//  Spring
//
//  Created by Zachary Galant on 10/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NewLevelAlert.h"


@implementation NewLevelAlert
@synthesize titleLabel, dismissButton;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame view:self])) {
        // Initialization code
		[self designLayout];
    }
    return self;
}

-(void)designLayout {
	
	titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 115, 280, 145)];
	titleLabel.textAlignment = UITextAlignmentCenter;
	titleLabel.font = [UIFont fontWithName:@"VTC ScreamItLoud" size:20];
	titleLabel.numberOfLines = 6;
	titleLabel.backgroundColor = [UIColor clearColor];
	[self addSubview:titleLabel];
	
	dismissButton = [[ButtonView alloc] initWithFrame:CGRectMake(110, 260, 0, 0) label:@"ok" selector:@selector(dismiss) delegate:self];
	[self addSubview:dismissButton];
	
}

-(void)showAlert:(int)numLevels total:(int)totalLevels {
	if (numLevels > 0) {
		titleLabel.text = [NSString stringWithFormat:@"Yay! You Just Got\n\n%d New Level%@\n\nThere Are Now\n%d Total!", numLevels, (numLevels == 1) ? @"" : @"s", totalLevels];
	} else if (numLevels == 0) {
		titleLabel.text = @"No New Levels";
	} else {
		titleLabel.text = @"No Internet Connection";
	}
	self.hidden = NO;
	[delegate hideButtons];
}

-(void)dismiss {
	self.hidden = YES;
	[delegate showButtons];
}


- (void)dealloc {
    [super dealloc];
	[titleLabel release];
	[dismissButton release];
}


@end
