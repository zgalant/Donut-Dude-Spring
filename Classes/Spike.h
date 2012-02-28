//
//  Spike.h
//  Spring
//
//  Created by Zachary Galant on 9/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RotatableView.h"

@interface Spike : RotatableView {
	UIImageView *spikeView;
	double xSpeed;
	double ySpeed;
	double x;
	double y;
	BOOL active;
}

@property(nonatomic, retain) UIImageView *spikeView;
@property(nonatomic) double xSpeed;
@property(nonatomic) double ySpeed;
@property(nonatomic) double x;
@property(nonatomic) double y;
@property(nonatomic) BOOL active;

@end
