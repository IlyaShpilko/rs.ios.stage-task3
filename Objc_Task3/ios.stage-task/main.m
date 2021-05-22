#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        NSArray *array = @[@"January", @"February"];
        int num = 1;
        
        NSLog(@"%@", [array objectAtIndex:num-1]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
