#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    if (ratingArray.count == 0 || ratingArray.count < 3U) {
        return 0;
    }
    
    
    return @[@1, @2, @3];
}

@end
