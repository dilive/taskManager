

#import <Foundation/Foundation.h>

@interface loadDate : NSObject

{
    NSURL * tasksURL;
    NSURL * orgsURL;
    NSMutableArray * mutArrayOfEvents;
    NSMutableArray * mutArrayOfEventsOrgs;
    NSMutableArray * mutArrayOfOrgsName;
    NSMutableArray * mutArrayOfOrgsNum;
    NSMutableArray * mutArrayOfOrgsLat;
    NSMutableArray * mutArrayOfOrgsLong;
}

@property (nonatomic, strong) NSString * visitHeader;
@property (nonatomic, strong) NSString * organization;
- (NSString *) stringFormURL: (NSString *) urlFromArray;
- (NSMutableArray *) mutArrayOfEvents;
- (NSMutableArray *) mutArrayOfEventsOrgs;
- (NSMutableArray *)mutArrayOfOrgsNum;
- (NSMutableArray *)mutArrayOfOrgsName;
- (NSMutableArray *)mutArrayOfOrgsLat;
- (NSMutableArray *) mutArrayOfOrgsLong;

- (void) cleaningTheCoreData;


@end
