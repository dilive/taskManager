
#import "parseOrgs.h"
#import "loadDate.h"



@implementation parseOrgs

- (void) parseLoadedListOrgs
{
    NSString * stringForParse = [[loadDate alloc] stringFormURL:@"http://demo3526062.mockable.io/getOrganizationListTest"];

    NSArray * array = [stringForParse componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"{"]];
    
    NSMutableArray * mArray = [array mutableCopy];
    [mArray removeObjectAtIndex:0];
    
    for (NSString * object in mArray)
    {
        NSRange r3 = [object rangeOfString:@"tionId\":\""];
        NSRange rSub2 = NSMakeRange(r3.location + r3.length, 3);
        NSString *sub2 = [object substringWithRange:rSub2];

        NSRange r1 = [object rangeOfString:@"title\":\""];
        NSRange rSub = NSMakeRange(r1.location + r1.length, 21);
        NSString *sub = [object substringWithRange:rSub];
        
        sub = [NSString stringWithFormat:@"T:%@", sub];
        r1 = [sub rangeOfString:@"T:"];
        NSRange r2 = [sub rangeOfString:@"\","];
        rSub = NSMakeRange(r1.location + r1.length, r2.location - r1.location - r1.length);
        sub = [sub substringWithRange:rSub];
        
        NSRange r5 = [object rangeOfString:@"titude\":"];
        NSRange rSub3 = NSMakeRange(r5.location + r5.length, 9);
        NSString *sub3 = [object substringWithRange:rSub3];
        
        NSRange r7 = [object rangeOfString:@"gitude\":"];
        NSRange rSub4 = NSMakeRange(r7.location + r7.length, 9);
        NSString *sub4 = [object substringWithRange:rSub4];
        
        NSMutableArray * mutArrOrgNum = [[loadDate alloc] mutArrayOfOrgsNum];
        [mutArrOrgNum addObject:sub2];
        [[NSUserDefaults standardUserDefaults] setValue:mutArrOrgNum forKey:@"mutArrayOfOrgsNum"];
        
        NSMutableArray * mutArrOrgName = [[loadDate alloc] mutArrayOfOrgsName];
        [mutArrOrgName addObject:sub];
        [[NSUserDefaults standardUserDefaults] setValue:mutArrOrgName forKey:@"mutArrayOfOrgsName"];

        NSMutableArray * mutArrOrgLat = [[loadDate alloc] mutArrayOfOrgsLat];
        [mutArrOrgLat addObject:sub3];
        [[NSUserDefaults standardUserDefaults] setValue:mutArrOrgLat forKey:@"mutArrayOfOrgsLat"];
        
        NSMutableArray * mutArrOrgLong = [[loadDate alloc] mutArrayOfOrgsLong];
        [mutArrOrgLong addObject:sub4];
        [[NSUserDefaults standardUserDefaults] setValue:mutArrOrgLong forKey:@"mutArrayOfOrgsLong"];


    }
}

@end
