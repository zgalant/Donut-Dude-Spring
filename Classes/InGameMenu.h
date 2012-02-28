//
//  InGameMenu.h
//  Spring
//
//  Created by Zachary Galant on 10/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface InGameMenu : UIView {
	
	UIView *dimmedBackground;
	UIImageView *background;
	
	id delegate;
	
}

@property(nonatomic, retain) UIView *dimmedBackground;
@property(nonatomic, retain) UIImageView *background;
@property(nonatomic, retain) id delegate;

@end
