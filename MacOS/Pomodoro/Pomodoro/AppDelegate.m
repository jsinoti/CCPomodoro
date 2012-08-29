//
//  AppDelegate.m
//  Pomodoro
//
//  Created by João Sinoti Junior on 04/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "TimestampGetter.h"




@implementation AppDelegate {
    int minute;
    int second;
}

@synthesize window = _window;
@synthesize label;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self appStart];
    
    NSApplication *thisApp = [NSApplication sharedApplication];
    [thisApp activateIgnoringOtherApps:YES];
    [_window setLevel:NSScreenSaverWindowLevel + 1];
    [_window orderFront:nil];
}

-(void)appStart {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[TimestampGetter getTime]];
    NSDateComponents *minutesComponents = [[NSCalendar currentCalendar] components:(NSMinuteCalendarUnit|NSSecondCalendarUnit) fromDate:date];
    minute = [minutesComponents minute];
    second = [minutesComponents second];
    if(minute > 60) {
        minute = minute - 60;
    }
    [self.window setBackgroundColor:[NSColor greenColor]];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(looping) userInfo:nil repeats:YES];
}

-(void)looping {
    second++;
    if(second > 59) {
        second = 0;
        minute++;
    } else if (second == 0) {

    }
    
    if(minute > 59) {
        minute = 0;
    }
    
    int outPutMinute = minute;
    if(outPutMinute >= 50) {
        outPutMinute = outPutMinute - 50;
        [self.window setBackgroundColor:[NSColor greenColor]];
    } else {
        [self.window setBackgroundColor:[NSColor redColor]];
    }
    [label setStringValue:[NSString stringWithFormat:@"%02d:%02d", outPutMinute,second]];
}

@end
