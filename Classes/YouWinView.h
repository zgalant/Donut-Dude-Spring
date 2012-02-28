//
//  YouWinView.h
//  Spring
//
//  Created by Zachary Galant on 10/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonView.h"
#import "BigDonut.h"


@interface YouWinView : UIView {
	ButtonView *menuButton;
	UILabel *timeLabel;
	
	UIImageView *background;
	
	NSString *timeString;
	id del;
	
	BigDonut *donut;
	
	UIImageView *winImage;
}

@property(nonatomic, retain) ButtonView *menuButton;
@property(nonatomic, retain) UILabel *timeLabel;
@property(nonatomic, retain) UIImageView *background;
@property(nonatomic, retain) NSString *timeString;
@property(nonatomic, retain) id del;
@property(nonatomic, retain) BigDonut *donut;
@property(nonatomic, retain) UIImageView *winImage;

@end
