#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
  
  NSMutableArray *tmp = [[NSMutableArray alloc] initWithArray:bill];
  [tmp removeObjectAtIndex:index];
  
  
  if ([[tmp valueForKeyPath:@"@sum.self"] doubleValue] / 2 == [sum doubleValue]) {
    return @"Bon Appetit";
  } else {
    return [[NSString alloc] initWithFormat:@"%d", [sum intValue] - [[tmp valueForKeyPath:@"@sum.self"] intValue] / 2];
  }
}

@end
