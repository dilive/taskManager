
#import "ViewController.h"
#import "loadDate.h"
#import <Mapkit/Mapkit.h>
#import "AddPointsOnMapView.h"

@interface ViewController () <MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource>
{
    
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

            //NSLog(@"mutArrayOfOrgsName COUNT: %lu", (unsigned long)[[[loadDate alloc] mutArrayOfOrgsName] count]);
            //NSLog(@"mutArrayOfEvents COUNT: %lu", (unsigned long)[[[loadDate alloc] mutArrayOfEvents] count]);

    [self createTableView];
    self.view.backgroundColor = [UIColor grayColor];
    [self createMapView];
    [self addPointsOnMap];
}


#pragma mark - Table View Datasource 

- (void) createTableView
{
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 300, -20+self.view.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.delegate=self;
    tableView.dataSource=self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[loadDate alloc] mutArrayOfEvents] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyCell"];
    }
    
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor greenColor];
    [cell setSelectedBackgroundView:bgColorView];

    cell.detailTextLabel.text=[[[loadDate alloc] mutArrayOfEvents] objectAtIndex:indexPath.row];
    
    NSMutableArray * mutArr1 = [[loadDate alloc] mutArrayOfEventsOrgs];
    NSObject * strEvOrg = [mutArr1 objectAtIndex:indexPath.row];
    
    for (NSObject * obj in [[loadDate alloc] mutArrayOfOrgsNum]) {
        if (strEvOrg == obj) {
            cell.textLabel.text = [[[loadDate alloc] mutArrayOfOrgsName] objectAtIndex:[mutArr1 indexOfObject:obj]];
        }
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.allowsMultipleSelection = NO;
    cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString * orgFromCell = cell.textLabel.text;
    
    for (MKPointAnnotation * obj in mapView.annotations)
    
        if ([obj.title isEqualToString:orgFromCell]) {
            [mapView selectAnnotation:[[mapView annotations] objectAtIndex:[mapView.annotations indexOfObject:obj]] animated:YES];
        }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (cell.isSelected == YES)
    {
        [cell setBackgroundColor:[UIColor greenColor]];
    }
    else
    {
        [cell setBackgroundColor:[UIColor whiteColor]];
    }
}

# pragma mark - Map

- (void) createMapView
{
    mapView = [[MKMapView alloc] initWithFrame:CGRectMake(300, 20, self.view.frame.size.width-300, self.view.frame.size.height - 20)];
    [self.view addSubview:mapView];
    mapView.delegate=self;
    
    MKCoordinateRegion mapRegion;
    mapRegion.center.latitude = 55.696494;
    mapRegion.center.longitude = 37.625472;
    mapRegion.span.latitudeDelta = 0.5;
    mapRegion.span.longitudeDelta = 0.5;
    mapView.region = mapRegion;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *) userLocation
{
    mapView.centerCoordinate = userLocation.location.coordinate;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    
    for (int y; y<[[[loadDate alloc] mutArrayOfEventsOrgs] count]; y++)
    {
        NSIndexPath * indexPathDeSel = [NSIndexPath indexPathForRow:y inSection:0];
        [self.tableView deselectRowAtIndexPath:indexPathDeSel animated:YES];
    }
    [tableView reloadData];
    tableView.allowsMultipleSelection=YES;

    MKPointAnnotation * selAnnot = view.annotation;
    NSString * pointTitle = selAnnot.title;

    unsigned long idr = [[[loadDate alloc] mutArrayOfOrgsName] indexOfObject:pointTitle];
    
    NSObject * num = [[[loadDate alloc] mutArrayOfOrgsNum] objectAtIndex:idr];
    
    NSMutableArray * mutArr2 = [[loadDate alloc] mutArrayOfEventsOrgs];

    int i=0;
    
        for (NSObject * orgNum in mutArr2)
        {
        if (orgNum == num) {
         
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            
                cell = [tableView cellForRowAtIndexPath:indexPath];
            //    cell.backgroundColor = [UIColor greenColor];
            
            UIView *bgColorView = [[UIView alloc] init];
            bgColorView.backgroundColor = [UIColor greenColor];
            [cell setSelectedBackgroundView:bgColorView];
            
            
            [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
            [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
            [tableView reloadData];

        }
            i++;
        }

    
//
}

- (void) addPointsOnMap
{
    NSMutableArray * mutArr = [[loadDate alloc] mutArrayOfOrgsNum];
    NSMutableArray * mutArr2 = [[loadDate alloc] mutArrayOfOrgsName];
    
    for (NSObject * obj in mutArr) {
        
        unsigned long ind = [mutArr indexOfObject:obj];
        NSString * orgNm = [mutArr2 objectAtIndex:ind];
        
        
        MKPointAnnotation * point = [[AddPointsOnMapView alloc] addPointsOnMap:orgNm withLat:[[[[loadDate alloc] mutArrayOfOrgsLat] objectAtIndex:ind] floatValue] andLon:[[[[loadDate alloc] mutArrayOfOrgsLong]objectAtIndex:ind] floatValue]];
        
        [mapView addAnnotation:point];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
