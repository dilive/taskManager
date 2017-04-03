
#import <UIKit/UIKit.h>
#import <Mapkit/Mapkit.h>

@interface ViewController : UIViewController

{
    UITableView * tableView;
    MKMapView * mapView;
    UITableViewCell *cell;
    
}

@property  (nonatomic)  IBOutlet UITableView * tableView;
@property (nonatomic) IBOutlet MKMapView * mapView;

@end

