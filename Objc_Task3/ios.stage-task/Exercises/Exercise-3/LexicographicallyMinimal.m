#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSMutableString *stringMutab1 = [NSMutableString stringWithString: string1];
    NSMutableString *stringMutab2 = [NSMutableString stringWithString: string2];
    NSMutableString *mutableTotal = [NSMutableString new];
    
    while ([stringMutab1 length] != 0 && [stringMutab2 length] != 0) {
        if ([stringMutab1 UTF8String][0] <= [stringMutab2 UTF8String][0]) {
            [mutableTotal appendFormat:@"%c", [stringMutab1 characterAtIndex:0]];
            [stringMutab1 deleteCharactersInRange:NSMakeRange(0, 1)];
        } else {
            [mutableTotal appendFormat:@"%c", [stringMutab2 characterAtIndex:0]];
            [stringMutab2 deleteCharactersInRange:NSMakeRange(0, 1)];
        }
    }
    
    if ([stringMutab1 length] == 0) {
        [mutableTotal appendString: stringMutab2];
    } else {
        [mutableTotal appendString: stringMutab1];
    }
    
    return mutableTotal;
}

@end
