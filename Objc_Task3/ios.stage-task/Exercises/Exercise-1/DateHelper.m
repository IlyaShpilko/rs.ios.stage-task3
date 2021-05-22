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
    return 0;
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
    return NO;
}

@end
