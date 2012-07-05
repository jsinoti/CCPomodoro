//
//  AppDelegate.h
//  Pomodoro
//
//  Created by João Sinoti Junior on 04/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (unsafe_unretained) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *label;

-(void)looping;
@end
