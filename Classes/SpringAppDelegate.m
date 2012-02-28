//
//  SpringAppDelegate.m
//  Spring
//
//  Created by Zachary Galant on 9/21/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "SpringAppDelegate.h"
#import "SpringViewController.h"

@implementation SpringAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
