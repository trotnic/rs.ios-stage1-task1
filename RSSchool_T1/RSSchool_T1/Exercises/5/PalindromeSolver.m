#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
  if ([n intValue] % 2 != 0) return @"-1";
  NSMutableString *left = [s substringToIndex:([n intValue] / 2)];
  NSMutableString *right = [s substringFromIndex:([n intValue] / 2)];
  
  char max = '0';
  for(int i = 0; i < [n intValue]; i++) {
    if ([s characterAtIndex:i] > max) {
      max = [s characterAtIndex:i];
    }
  }
  
  int length = [left length];
  int counter = 0;
  
  for (int position = 0; position < length; position++) {
    NSRange leftDig = NSMakeRange(position, 1);
    NSRange rightDig = NSMakeRange(length - 1 - position, 1);
    
    if([left substringWithRange:leftDig] != [right substringWithRange:rightDig]) {
      if([left characterAtIndex:position] < max && [right characterAtIndex:position] < max) {
        left = [left stringByReplacingCharactersInRange:leftDig withString:[NSString stringWithFormat:@"%c", max]];
        right = [right stringByReplacingCharactersInRange:rightDig withString:[NSString stringWithFormat:@"%c", max]];
        counter += 2;
        continue;
      }
      if([left characterAtIndex:position] > [right characterAtIndex:position]) {
        counter++;
        right = [right stringByReplacingCharactersInRange:rightDig withString:[left substringWithRange:leftDig]];
      } else {
        counter++;
        left = [left stringByReplacingCharactersInRange:leftDig withString:[right substringWithRange:rightDig]];
      }
    }
  }
  
  return counter <= [k intValue] ? [left stringByAppendingString:right] : @"-1";
}

@end
