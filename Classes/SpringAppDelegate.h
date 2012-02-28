//
//  SpringAppDelegate.h
//  Spring
//
//  Created by Zachary Galant on 9/21/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SpringViewController;

@interface SpringAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SpringViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SpringViewController *viewController;

@end

