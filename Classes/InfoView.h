//
//  InfoView.h
//  Spring
//
//  Created by Zachary Galant on 10/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InGameMenu.h"

@interface InfoView : InGameMenu {
	UILabel *infoLabel;
}

@property(nonatomic, retain) UILabel *infoLabel;

@end
