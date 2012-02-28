//
//  ButtonView.h
//  Spring
//
//  Created by Zachary Galant on 10/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ButtonView : UIView {
	UIButton *button;
	UILabel *label;
}

@property(nonatomic, retain) UIButton *button;
@property(nonatomic, retain) UILabel *label;


- (id)initWithFrame:(CGRect)frame label:(NSString *)text selector:(SEL)selector delegate:(id)del;
-(void)setText:(NSString *)text;
-(void)setTextSize:(int)size;

@end
