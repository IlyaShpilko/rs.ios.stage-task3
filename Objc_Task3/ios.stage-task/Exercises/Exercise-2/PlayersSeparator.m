#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    if ([ratingArray count] < 3) {
        return 0;
    }
    
    NSMutableSet *result = [NSMutableSet new];
    
    for (int i = 0; i < [ratingArray count] - 2; i++) {
        
        NSMutableArray *first = [NSMutableArray arrayWithObjects: ratingArray[i], nil];
        NSMutableArray *second = [NSMutableArray arrayWithObjects:ratingArray[i], nil];
        
        for (int j = i+1; j < [ratingArray count] - 1; j++) {
            if ([first count] > 1) {
                [first removeLastObject];
            }
            
            if ([second count] > 1) {
                [second removeLastObject];
            }
            
            if ([ratingArray[j] intValue] > [[first lastObject] intValue]) {
                [first addObject:[ratingArray objectAtIndex:j]];
            } else if ([[ratingArray objectAtIndex:j] intValue] < [[second lastObject] intValue]) {
                [second addObject:[ratingArray objectAtIndex:j]];
            }
            
            for (int k = j+1; k < [ratingArray count]; k++) {
                
                if ([ratingArray[k] intValue] > [[first lastObject] intValue]) {
                    [first addObject:[ratingArray objectAtIndex:k]];
                } else if ([[ratingArray objectAtIndex:k] intValue] < [[second lastObject] intValue]) {
                    [second addObject:[ratingArray objectAtIndex:k]];
                }
                
                if ([first count] > 2) {
                    [result addObject: [[first valueForKey:@"description"] componentsJoinedByString:@""]];
                    [first removeLastObject];
                }
                
                if ([second count] > 2) {
                    [result addObject: [[second valueForKey:@"description"] componentsJoinedByString:@""]];
                    [second removeLastObject];
                }
            }
        }
    }
    return [result count];
}

@end
