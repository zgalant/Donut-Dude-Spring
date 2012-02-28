//
//  BeatLevelView.h
//  Spring
//
//  Created by Zachary Galant on 10/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InGameMenu.h"
#import "ButtonView.h"

@interface BeatLevelView : InGameMenu {
	UILabel *titleLabel;
	UILabel *timeLabel;
	UILabel *recordLabel;
	ButtonView *nextButton;
	ButtonView *menuButton;
	
}


@property(nonatomic, retain) UILabel *titleLabel;
@property(nonatomic, retain) UILabel *timeLabel;
@property(nonatomic, retain) UILabel *recordLabel;
@property(nonatomic, retain) ButtonView *nextButton;
@property(nonatomic, retain) ButtonView *menuButton;


-(void)setLevel:(int)level;
-(void)setTime:(NSString *)timeString;

@end
