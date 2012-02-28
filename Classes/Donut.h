//
//  Donut.h
//  Spring
//
//  Created by Zachary Galant on 9/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RotatableView.h"


@interface Donut : RotatableView {
	UIImageView *donutView;
}

@property(nonatomic, retain) UIImageView *donutView;

@end
