//
//  NSString+Extension.m
//  OC工具类
//
//  Created by 汤圆 on 2018/7/6.
//  Copyright © 2018年 汤圆. All rights reserved.
//

#import "NSString+Extension.h"


#define kScreenWidth  [UIScreen mainScreen].bounds.size.width


@implementation NSString (Extension)


- (NSString *)cutFromString:(NSString *)fromString toString:(NSString *)toString
{
    if ([self containsString:fromString] &&[self containsString:toString])
    {
        return  [[self componentsSeparatedByString:fromString][1] componentsSeparatedByString:toString][0];
    }
    return nil;
}

- (CGFloat)textWidthWithFont:(UIFont *)font
{
    
    CGSize textSize = [self boundingRectWithSize:CGSizeMake(kScreenWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    
    return  textSize.width;
}


- (NSString *)getDifferenceTime
{
    if (self.length == 0) {
        return @"";
    }
    NSDateFormatter * dateF = [[NSDateFormatter alloc] init];
    dateF.timeZone = [NSTimeZone systemTimeZone];
    dateF.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    NSDate *date = [dateF dateFromString:self];
    NSTimeInterval t = [date timeIntervalSinceNow];
    if (t < -72*3600) {
        return [self substringToIndex:10];
    }
    NSDateComponents*compon = [NSString getDateComponentsWith:date];
    NSDateComponents*nowCompon = [NSString getDateComponentsWith:[NSDate new]];
    if (compon.day == nowCompon.day)
    {
        if (compon.hour == nowCompon.hour) {
            if (compon.minute == nowCompon.minute) {
                return @"刚刚";
            }
            return [NSString stringWithFormat:@"%ld分钟前",nowCompon.minute - compon.minute];
        }
        return [NSString stringWithFormat:@"%ld小时前",nowCompon.hour - compon.hour];
    }else{
        if (nowCompon.day>compon.day) {//本月
            if ((compon.day + 1) == nowCompon.day) {
                return @"昨天";
            }
            return @"前天";
        }else{
            if (compon.day == 1) {
                return @"昨天";
            }
            return @"前天";
        }
    }
}


- (BOOL)isEmpty:(NSString *)string
{
	return string == nil || string.length == 0;
}

- (BOOL)isWhitespaceAndNewlines
{
	NSCharacterSet* whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
	for (NSInteger i = 0; i < self.length; ++i)
	{
		unichar c = [self characterAtIndex:i];
		if (![whitespace characterIsMember:c])
		{
			return NO;
		}
	}
	return YES;
}

- (NSString *)trim
{
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)removeWhiteSpace
{
	return [[self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] componentsJoinedByString:@""];
}

- (NSString *)removeNewLine
{
	return [[self componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
}
- (NSString *)stringByUrlEncoding
{
	NSString *url = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,  (CFStringRef)self,  NULL,  (CFStringRef)@"!*'();:@&=+$,/?%#[]",  kCFStringEncodingUTF8));

	return url;
}
- (NSString *)capitalize
{
	if (self == nil || [self length] == 0) return self;
	return [[self substringToIndex:1].uppercaseString stringByAppendingString:[self substringFromIndex:1]];
}
- (BOOL)equalsString:(NSString *)str
{
	return (str != nil) && ([self length] == [str length]) && ([self rangeOfString:str options:NSCaseInsensitiveSearch].location == 0);
}












+ (NSDateComponents*)getDateComponentsWith:(NSDate*)date
{
    NSCalendarUnit falg = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSCalendar * calendar = [NSCalendar currentCalendar];
    calendar.timeZone = [NSTimeZone systemTimeZone];
    return [calendar components:falg fromDate:date];
}

@end
