//
//  SpinningDonut.h
//  Spring
//
//  Created by Zachary Galant on 10/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RotatableView.h"

@interface BigDonut : RotatableView {
	UIImageView *donut;
}

@property(nonatomic, retain) UIImageView *donut;

@end
