#import "Parser.h"

@implementation Parser
- (NSArray <NSString*>*)parseString:(NSString*)string {
  self.result = [NSMutableArray new];
  for (int i = 0; i < [string length]; i++) {
    if([[string substringWithRange:NSMakeRange(i, 1)]  isEqual: @"["]) {
      [self handleCase:string position:i bracket:@"["];
    } else if ([[string substringWithRange:NSMakeRange(i, 1)]  isEqual: @"("]) {
      [self handleCase:string position:i bracket:@"("];
    } else if ([[string substringWithRange:NSMakeRange(i, 1)]  isEqual: @"<"]) {
      [self handleCase:string position:i bracket:@"<"];
    }
  }
  return self.result;
}

-(void)handleCase:(NSString *)string position:(int)i bracket:(NSString *)openBracket {
  NSString *closeBracket;
  if([openBracket isEqual:@"<"]) closeBracket = @">";
  if([openBracket isEqual:@"("]) closeBracket = @")";
  if([openBracket isEqual:@"["]) closeBracket = @"]";
  int currentOpenBracketPosition = i;
  int openingAmount = 1;
  int pos = currentOpenBracketPosition + 1;
  while(openingAmount) {
    if([[string substringWithRange:NSMakeRange(pos, 1)] isEqual:closeBracket]) {
      openingAmount--;
    } else if([[string substringWithRange:NSMakeRange(pos, 1)] isEqual:openBracket]) {
      openingAmount++;
    }
    pos++;
    if(openingAmount && pos == [string length]) {
      break;
    }
    if(!openingAmount) {
      [self.result addObject:[string substringWithRange:NSMakeRange(currentOpenBracketPosition + 1, pos - currentOpenBracketPosition - 2)]];
    }
  }
}
@end
