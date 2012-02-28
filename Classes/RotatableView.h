//
//  RotatableView.h
//  Spring
//
//  Created by Zachary Galant on 10/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RotatableView : UIView {
	double angle;
	double interval;
	CGPoint gestureStartPoint;
}

@property(nonatomic) double angle;
@property(nonatomic) double interval;
@property(nonatomic) CGPoint gestureStartPoint;

- (id)initWithFrame:(CGRect)frame timeInterval:(double)interv;

@end
