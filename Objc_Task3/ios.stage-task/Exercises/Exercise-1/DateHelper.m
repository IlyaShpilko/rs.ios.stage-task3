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
    
    NSString *dateString = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:dateString];
    
    NSDate *newDate = [formatter dateFromString:date];
    
    NSCalendar *calendar =[NSCalendar currentCalendar];
    
    return [calendar component:NSCalendarUnitDay fromDate:newDate];
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
