//
//  PauseMenu.h
//  Spring
//
//  Created by Zachary Galant on 8/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonView.h"
#import "InGameMenu.h"

@interface PauseMenu : InGameMenu {
	UILabel *titleLabel;
	ButtonView *resumeButton;
	ButtonView *menuButton;
	
}


@property(nonatomic, retain) UILabel *titleLabel;
@property(nonatomic, retain) ButtonView *resumeButton;
@property(nonatomic, retain) ButtonView *menuButton;

@end
