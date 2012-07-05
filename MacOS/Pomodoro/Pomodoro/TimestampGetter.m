//
//  TimestampGetter.m
//  Pomodoro
//
//  Created by João Sinoti Junior on 04/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TimestampGetter.h"
#import "APXML.h"

#define URL_WEB_SERVICE @"http://developer.yahooapis.com/TimeService/V1/getTime?appid=YahooDemo"

@implementation TimestampGetter


+(double)getTime {
    NSString *xmlContent = [NSString stringWithContentsOfURL:[NSURL URLWithString:URL_WEB_SERVICE] encoding:NSUTF8StringEncoding error:nil];
    APDocument *doc = [APDocument documentWithXMLString:xmlContent];
    NSString *outPut = @"";
    for (APElement *time in [[doc rootElement] childElements])
    {
        outPut = [time value];
    }
    return  [outPut doubleValue];
}

@end
