#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    if (monthNumber == 0 || monthNumber > 12) {
        return nil;
    }
    
    NSArray *monthArray = @[@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December"];
    
    NSString *str = [NSString stringWithString:[monthArray objectAtIndex:monthNumber - 1]].capitalizedString;
    
    return str;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSMutableString *month = [NSMutableString new];
    NSMutableString *day = [NSMutableString new];
    
    for (NSInteger i = 0; i<date.length; i++) {
        char cr = [date characterAtIndex:i];
        if (i == 5 || i == 6) {
            [month appendFormat:@"%c", cr];
        } else if (i == 8 || i == 9) {
            [day appendFormat:@"%c", cr];
        }
    }
    
    if (month.intValue == 0 || month.intValue > 12) {
        return 0;
    }
    
    return [day intValue];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    if (date == nil) {
        return nil;
    }
    
    NSDateFormatter *formateWeek = [[NSDateFormatter alloc] init];
    
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:@"RU_ru"];
    
    [formateWeek setDateFormat:@"EEE"];
    [formateWeek setLocale: locale];
    
    NSString *str = [formateWeek stringFromDate:date];
    
    return str;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSDate *start;
    NSTimeInterval extends;
    NSCalendar *cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDate *today = [NSDate date];
    BOOL seccess = [cal rangeOfUnit: NSWeekCalendarUnit startDate:&start interval:&extends forDate:today];
    
    if (!seccess)
        return NO;
    
    NSTimeInterval dateInSecs = [date timeIntervalSinceReferenceDate];
    NSTimeInterval dayStartInSecs = [start timeIntervalSinceReferenceDate];
    
    if (dateInSecs > dayStartInSecs && dateInSecs < (dayStartInSecs + extends)) {
        return YES;
    } else {
        return NO;
    }
}

@end
