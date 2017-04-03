

#import "parseString.h"
#import "loadDate.h"

@implementation parseString


- (void) parseLoadedString
{
    NSString * stringForParse = [[loadDate alloc] stringFormURL:@"http://demo3526062.mockable.io/getVisitsListTest"];
    
    NSArray * array = [stringForParse componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"{"]];
    
    NSMutableArray * mArray = [array mutableCopy];
    [mArray removeObjectAtIndex:0];

    for (NSString * object in mArray)
    {
            NSRange r1 = [object rangeOfString:@"tle\":\""];
        
            NSRange r2 = [object rangeOfString:@"\","];
        
            NSRange rSub = NSMakeRange(r1.location + r1.length, r2.location - r1.location - r1.length);
        
            NSString *sub = [object substringWithRange:rSub];
        
        NSRange r3 = [object rangeOfString:@"tionId\":\""];
        
        NSRange rSub2 = NSMakeRange(r3.location + r3.length, 3);
        
        NSString *sub2 = [object substringWithRange:rSub2];
        
        
        NSMutableArray * mutArrEvents = [[loadDate alloc] mutArrayOfEvents];
        [mutArrEvents addObject:sub];
        [[NSUserDefaults standardUserDefaults] setValue:mutArrEvents forKey:@"mutArrayOfEvents"];

        NSMutableArray * mutArrEventsOrgs = [[loadDate alloc] mutArrayOfEventsOrgs];
        [mutArrEventsOrgs addObject:sub2];
        [[NSUserDefaults standardUserDefaults] setValue:mutArrEventsOrgs forKey:@"mutArrayOfEventsOrgs"];
    }
    
}


@end
