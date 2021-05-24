#import "LevelOrderTraversal.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    
    NSMutableArray<NSNumber *> *nextDoorway = [NSMutableArray new];
    NSMutableArray *transition = [NSMutableArray new];
    int count = 0;
    
    for (NSObject *obj in tree) {
        if ([transition count] == 0 || [[transition lastObject] boolValue]) {
            if ([obj isKindOfClass: [NSNull class]]) {
                [transition removeLastObject];
                [transition addObject:@NO];
            } else {
                [nextDoorway addObject:[NSNumber numberWithInt:count]];
                count += 1;
                [transition addObject:@YES];
            }
        } else {
            if ([obj isKindOfClass:[NSNull class]]) {
                while (![[transition lastObject] boolValue]) {
                    [transition removeLastObject];
                    count -= 1;
                }
                [transition removeLastObject];
                [transition addObject:@NO];
            } else {
                [nextDoorway addObject:[NSNumber numberWithInt:count]];
                count += 1;
                [transition addObject:@YES];
            }
        }
    }
    
    if ([nextDoorway count] == 0) {
        return @[];
    }
    
    int maxCount = [[nextDoorway valueForKeyPath:@"@max.intValue"] intValue];
    NSMutableArray<NSMutableArray*>* total = [NSMutableArray new];

    for (int i = 0; i <= maxCount; i++) {
        [total addObject:[NSMutableArray new]];
    }
    
    int j = 0;
    for (int i = 0; i < tree.count; i++){
        if (![tree[i] isKindOfClass:NSNull.class]){
            [total[nextDoorway[j].intValue] addObject:[tree objectAtIndex:i]];
            j += 1;
        }
    }

    return total;
}
