#import <Foundation/Foundation.h>

@interface Parser : NSObject

@property (nonatomic, retain) NSMutableArray *result;

- (NSArray <NSString*>*)parseString: (NSString*)string;
- (void)handleCase: (NSString *)string position:(int)i bracket:(NSString *)openBracket;
@end

