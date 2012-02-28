//
//  SpringViewController.m
//  Spring
//
//  Created by Zachary Galant on 9/21/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "SpringViewController.h"

@implementation SpringViewController

@synthesize playButton, infoButton, levelOneViewController, instructions, dim, infoView, alert, dlButton;


-(IBAction) playGame {
	[self presentModalViewController:levelOneViewController animated:YES];
}

#pragma mark -
#pragma mark Info View Stuff
-(void) showInfo {
	infoView.hidden = NO;
	dim.hidden = NO;
	donut.hidden = YES;
	dlButton.hidden = NO;
	[infoButton setText:@"menu"];
}

-(void) hideInfo {
	infoView.hidden = YES;
	dim.hidden = YES;
	donut.hidden = NO;
	dlButton.hidden = YES;
	[infoButton setText:@"info"];
}

-(void) toggleInfo {
	if (instructions) {
		instructions = NO;
		[self hideInfo];
	} else {
		instructions = YES;
		[self showInfo];
	}
}

-(void)showButtons {
	playButton.hidden = NO;
	infoButton.hidden = NO;
}

-(void)hideButtons {
	playButton.hidden = YES;
	infoButton.hidden = YES;
}

#pragma mark -


-(void)checkForNewLevels {
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	
	//Make new (for testing)
	//[prefs setObject:nil forKey:@"firstTime"];
	//[prefs setObject:nil forKey:@"levels"];
	
	
	// Handle First time
	NSString *firstTime = [prefs objectForKey:@"firstTime"];
	if (firstTime == nil || (NSNull *)firstTime == [NSNull null]) {
		NSString *levelString = @"{\"1\":{\"together\":\"YES\",\"spikes\":[{\"x\":\"0\"\"y\":\"390\"}]},\"2\":{\"together\":\"YES\",\"spikes\":[{\"x\":\"0\"\"y\":\"230\"}]},\"3\":{\"together\":\"YES\",\"spikes\":[{\"x\":\"0\"\"y\":\"90\"},{\"x\":\"0\"\"y\":\"230\"}]},\"4\":{\"together\":\"YES\",\"spikes\":[{\"x\":\"0\"\"y\":\"90\"},{\"x\":\"0\"\"y\":\"230\"},{\"x\":\"0\"\"y\":\"390\"}]},\"5\":{\"together\":\"YES\",\"spikes\":[{\"x\":\"0\"\"y\":\"90\"},{\"x\":\"0\"\"y\":\"230\"},{\"x\":\"0\"\"y\":\"390\"},{\"x\":\"0\"\"y\":\"50\"}]}}";
		[prefs setObject:levelString forKey:@"levels"];
		[self getNumLevels];
		[infoView changeNumLevels];
		NSLog(@"First Time:\n%@", levelString);
	}
	
	
	// Download New Levels From Internet
	NSString *newLevelString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.zachgalant.com/springLevels.json"]];
	if (newLevelString != nil && (NSNull *)newLevelString != [NSNull null]) {
		NSString *oldLevels = [prefs objectForKey:@"levels"];
		int numNewLevels = 0;
		if (![newLevelString isEqualToString:oldLevels]) {
			[prefs setObject:newLevelString forKey:@"levels"];
			numNewLevels = [self getNumLevels];
			
			NSLog(@"Added %d Levels", numNewLevels);
		}
		if ([[prefs objectForKey:@"firstTime"] isEqualToString:@"NO"]) {
			[alert showAlert:numNewLevels total:[[prefs objectForKey:@"LAST_LEVEL"] intValue]];
		}
	} else if ([[prefs objectForKey:@"firstTime"] isEqualToString:@"NO"]) {
		[alert showAlert:-1 total:[[prefs objectForKey:@"LAST_LEVEL"] intValue]];
	}
	[prefs setObject:@"NO" forKey:@"firstTime"];
}


-(int)getNumLevels {
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	NSString *levels = [prefs objectForKey:@"levels"];
	NSString * prevNumLevelsString = [prefs objectForKey:@"LAST_LEVEL"];
	int prevNumLevels;
	if (prevNumLevelsString != nil && (NSNull *)prevNumLevelsString != [NSNull null]) {
		prevNumLevels = [prevNumLevelsString intValue];
	}
	int i = 1;
	while (YES) {
		NSString *thisLevel = [NSString stringWithFormat:@"\"%d\":", i];
		NSRange r = [levels rangeOfString:thisLevel];
		if (r.location == NSNotFound) {
			[prefs setObject:[NSString stringWithFormat:@"%d", i-1] forKey:@"LAST_LEVEL"];
			[infoView changeNumLevels];
			break;
		}
		i++;
	}
	return i - 1 - prevNumLevels;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if (infoView.hidden == NO) {
		[self toggleInfo];
	}
}

-(void)loadLevels {
	//dlButton.hidden = YES;
	[self checkForNewLevels];
	//dlButton.hidden = NO;
}


#pragma mark -
#pragma mark View Controller Delegate Methods

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	instructions = NO;
	
	dim = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
	dim.backgroundColor = [UIColor blackColor];
	dim.alpha = 0.5;
	[self.view addSubview:dim];
	
	
	playButton = [[ButtonView alloc] initWithFrame:CGRectMake(10, 400, 0, 0) label:@"play" selector:@selector(playGame) delegate:self];
	[self.view addSubview:playButton];
	
	infoButton = [[ButtonView alloc] initWithFrame:CGRectMake(200, 400, 0, 0) label:@"info" selector:@selector(toggleInfo) delegate:self];
	[self.view addSubview:infoButton];
	
	donut = [[BigDonut alloc] initWithFrame:CGRectMake(41, 155, 228, 228)];
	[self.view addSubview:donut];
	
	infoView = [[InfoView alloc] initWithFrame:CGRectMake(0, 0, 320, 420)];
	infoView.dimmedBackground.hidden = YES;
	[self.view addSubview:infoView];
	
	dlButton = [[ButtonView alloc] initWithFrame:CGRectMake(110, 320, 0, 0) label:@"d/l" selector:@selector(loadLevels) delegate:self];
	[self.view addSubview:dlButton];
	
	[self hideInfo];
	
	alert = [[NewLevelAlert alloc] initWithFrame:CGRectMake(0, 0, 320, 420)];
	alert.delegate = self;
	alert.hidden = YES;
	[self.view addSubview:alert];
	
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	NSString *firstTime = [prefs objectForKey:@"firstTime"];
	if (firstTime == nil || (NSNull *)firstTime == [NSNull null]) {
		[self checkForNewLevels];
	}
    [super viewDidLoad];
}


- (void)dealloc {
    [super dealloc];
	[infoView release];
	[playButton release];
	[infoButton release];
	[donut release];
	[dim release];
	[alert release];
}

@end
