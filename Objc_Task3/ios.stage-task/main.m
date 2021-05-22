#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
        NSString *dateString = @"19-May-2021";
        
        NSDateFormatter *formateStart = [[NSDateFormatter alloc] init];
        [formateStart setDateFormat:@"dd-MMMM-yyyy"];
        
        NSDate *date = [formateStart dateFromString:dateString];
        
        NSDateFormatter *formateWeek = [[NSDateFormatter alloc] init];
        [formateWeek setDateFormat:@"EEE"];
        NSLocale *locale = [NSLocale localeWithLocaleIdentifier:@"RU_ru"];
        [formateWeek setLocale: locale];

        
        NSLog(@"%@", [formateWeek stringFromDate:date]);
        
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
