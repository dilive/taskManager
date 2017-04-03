

#import "loadDate.h"

@implementation loadDate

- (NSString *) stringFormURL: (NSString *) urlFromArray
{
    
    NSURL *url = [[NSURL alloc] initWithString:urlFromArray];
    NSError *error = nil;
    NSStringEncoding encoding;
    NSString * recievedString = [[NSString alloc] initWithContentsOfURL:url
                                                     encoding:NSUTF8StringEncoding
                                                        error:&error];


    
    if (error)
    {
        recievedString=nil;
    }
    
    return recievedString;
}


#pragma mark -- CONTEXT ARRAYS

- (NSMutableArray *) mutArrayOfEvents
{
    if (mutArrayOfEvents==nil)
    {
        NSArray * array = [[NSUserDefaults standardUserDefaults] valueForKey:@"mutArrayOfEvents"];
        if (array == nil) {
            mutArrayOfEvents = [[NSMutableArray alloc] init];
        }
        else
            mutArrayOfEvents = [array mutableCopy];
    }
    return mutArrayOfEvents;
}


- (NSMutableArray *)mutArrayOfEventsOrgs
{
    if (mutArrayOfEventsOrgs==nil)
    {
        NSArray * array = [[NSUserDefaults standardUserDefaults] valueForKey:@"mutArrayOfEventsOrgs"];
        if (array == nil) {
            mutArrayOfEventsOrgs = [[NSMutableArray alloc] init];
        }
        else
            mutArrayOfEventsOrgs = [array mutableCopy];
    }
    return mutArrayOfEventsOrgs;
}

- (NSMutableArray *)mutArrayOfOrgsName
{
    if (mutArrayOfOrgsName==nil)
    {
        NSArray * array = [[NSUserDefaults standardUserDefaults] valueForKey:@"mutArrayOfOrgsName"];
        if (array == nil) {
            mutArrayOfOrgsName = [[NSMutableArray alloc] init];
        }
        else
            mutArrayOfOrgsName = [array mutableCopy];
    }
    return mutArrayOfOrgsName;
}

- (NSMutableArray *)mutArrayOfOrgsNum
{
    if (mutArrayOfOrgsNum==nil)
    {
        NSArray * array = [[NSUserDefaults standardUserDefaults] valueForKey:@"mutArrayOfOrgsNum"];
        if (array == nil) {
            mutArrayOfOrgsNum = [[NSMutableArray alloc] init];
        }
        else
            mutArrayOfOrgsNum = [array mutableCopy];
    }
    return mutArrayOfOrgsNum;
}

- (NSMutableArray *)mutArrayOfOrgsLat
{
    if (mutArrayOfOrgsLat==nil)
    {
        NSArray * array = [[NSUserDefaults standardUserDefaults] valueForKey:@"mutArrayOfOrgsLat"];
        if (array == nil) {
            mutArrayOfOrgsLat = [[NSMutableArray alloc] init];
        }
        else
            mutArrayOfOrgsLat = [array mutableCopy];
    }
    return mutArrayOfOrgsLat;
}

- (NSMutableArray *)mutArrayOfOrgsLong
{
    if (mutArrayOfOrgsLong==nil)
    {
        NSArray * array = [[NSUserDefaults standardUserDefaults] valueForKey:@"mutArrayOfOrgsLong"];
        if (array == nil) {
            mutArrayOfOrgsLong = [[NSMutableArray alloc] init];
        }
        else
            mutArrayOfOrgsLong = [array mutableCopy];
    }
    return mutArrayOfOrgsLong;
}


- (void) cleaningTheCoreData
{
    NSMutableArray * mutArrEvents = [[loadDate alloc] mutArrayOfEvents];
    [mutArrEvents removeAllObjects];
    [[NSUserDefaults standardUserDefaults] setValue:mutArrEvents forKey:@"mutArrayOfEvents"];
    
    NSMutableArray * mutArrEventsOrgs = [[loadDate alloc] mutArrayOfEventsOrgs];
    [mutArrEventsOrgs removeAllObjects];
    [[NSUserDefaults standardUserDefaults] setValue:mutArrEventsOrgs forKey:@"mutArrayOfEventsOrgs"];

    NSMutableArray * mutArrOrgNum = [[loadDate alloc] mutArrayOfOrgsNum];
    [mutArrOrgNum removeAllObjects];
    [[NSUserDefaults standardUserDefaults] setValue:mutArrOrgNum forKey:@"mutArrayOfOrgsNum"];
    
    NSMutableArray * mutArrOrgName = [[loadDate alloc] mutArrayOfOrgsName];
    [mutArrOrgName removeAllObjects];
    [[NSUserDefaults standardUserDefaults] setValue:mutArrOrgName forKey:@"mutArrayOfOrgsName"];
    
    NSMutableArray * mutArrOrgLat = [[loadDate alloc] mutArrayOfOrgsLat];
    [mutArrOrgLat removeAllObjects];
    [[NSUserDefaults standardUserDefaults] setValue:mutArrOrgLat forKey:@"mutArrayOfOrgsLat"];
    
    NSMutableArray * mutArrOrgLong = [[loadDate alloc] mutArrayOfOrgsLong];
    [mutArrOrgLong removeAllObjects];
    [[NSUserDefaults standardUserDefaults] setValue:mutArrOrgLong forKey:@"mutArrayOfOrgsLong"];

}

@end
