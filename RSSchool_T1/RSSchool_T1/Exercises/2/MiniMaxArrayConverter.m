#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
  NSMutableArray *tmp = [[[NSMutableArray alloc] initWithArray:array] sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
    return [a compare:b];
  }];
  NSNumber * sum = [array valueForKeyPath:@"@sum.self"];
  
  NSMutableArray *result = [[NSMutableArray alloc] init];
  
  [result addObject:[NSNumber numberWithInt:( [sum intValue] - [[tmp lastObject] intValue])]];
  [result addObject:[NSNumber numberWithInt:( [sum intValue] - [[tmp objectAtIndex:0] intValue])]];
  
  return result;
  
}

@end
