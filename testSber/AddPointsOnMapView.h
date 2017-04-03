
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AddPointsOnMapView : NSObject

- (MKPointAnnotation *) addPointsOnMap : (NSString *) orgTitle withLat:(float)lat andLon:(float)lon;

@end
