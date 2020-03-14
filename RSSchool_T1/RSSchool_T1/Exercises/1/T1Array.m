#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
  if (![sadArray count]) {
    return sadArray;
  }
  
  NSMutableArray *tmp = [[NSMutableArray alloc] initWithArray:sadArray];
  for (NSInteger index = 1; index < [tmp count] - 1; index++) {
    while([[tmp objectAtIndex:index - 1] floatValue] + [[tmp objectAtIndex:index + 1] floatValue] < [[tmp objectAtIndex:index] floatValue]) {
      [tmp removeObjectAtIndex:index];
      index = index == 1 ? index : index - 1;
      if ([tmp count] == 2) break;
    }
  }
  return tmp;
}

@end
