//
//  SpringViewController.h
//  Spring
//
//  Created by Zachary Galant on 9/21/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "donutDudeSpringViewController.h"
#import "ButtonView.h"
#import "BigDonut.h"
#import "InfoView.h"
#import "NewLevelAlert.h"

@interface SpringViewController : UIViewController {

	IBOutlet UIViewController *levelOneViewController;
	BOOL instructions;
	UIView *dim;
	
	ButtonView *playButton;
	ButtonView *infoButton;
	ButtonView *dlButton;
	BigDonut *donut;
	
	InfoView *infoView;
	
	NewLevelAlert *alert;
	
}


@property(nonatomic, retain) IBOutlet UIViewController *levelOneViewController;
@property(nonatomic) BOOL instructions;
@property(nonatomic, retain) UIView *dim;
@property(nonatomic, retain) ButtonView *playButton;
@property(nonatomic, retain) ButtonView *infoButton;
@property(nonatomic, retain) ButtonView *dlButton;
@property(nonatomic, retain) BigDonut *donut;
@property(nonatomic, retain) InfoView *infoView;
@property(nonatomic, retain) NewLevelAlert *alert;

-(IBAction) playGame;
-(IBAction) toggleInfo;

@end

