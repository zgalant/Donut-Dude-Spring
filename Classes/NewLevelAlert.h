//
//  NewLevelAlert.h
//  Spring
//
//  Created by Zachary Galant on 10/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InGameMenu.h"
#import "ButtonView.h"

@interface NewLevelAlert : InGameMenu {

	UILabel *titleLabel;
	ButtonView *dismissButton;
	
}


@property(nonatomic, retain) UILabel *titleLabel;
@property(nonatomic, retain) ButtonView *dismissButton;

@end
