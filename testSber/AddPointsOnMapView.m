
#import "AddPointsOnMapView.h"
#import <MapKit/MapKit.h>


@implementation AddPointsOnMapView

- (MKPointAnnotation *) addPointsOnMap : (NSString *) orgTitle withLat:(float)lat andLon:(float)lon
{
    CLLocationCoordinate2D coords;
    coords.latitude = lat;
    coords.longitude = lon;
    
    MKPointAnnotation * pointOnMap = [[MKPointAnnotation alloc] init];
    pointOnMap.coordinate = coords;
    pointOnMap.title = orgTitle;
    pointOnMap.subtitle = @"Организация";
    return pointOnMap;
}

@end
