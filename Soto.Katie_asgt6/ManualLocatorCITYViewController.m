//
//  ManualLocatorCITYViewController.m
//  Soto.Katie_asgt6
//
//  Created by Guest User on 11/26/12.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import "ManualLocatorCITYViewController.h"

@implementation ManualLocatorCITYViewController


@synthesize cities = _cities;
@synthesize tableView;
@synthesize selectedRegion = _selectedRegion;
@synthesize regionString = _regionString;

//***********************************************
//if a null pointer, we need to initalize it
-(Location*) selectedRegion;
{
    if(_selectedRegion == nil)
    {
        _selectedRegion = [[Location alloc] init];
    }
    return _selectedRegion;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    // Uncomment the following line to preserve selection between presentations.
     //self.clearsSelectionOnViewWillAppear = NO;
    
    self.regionString = self.selectedRegion.name;
    self.cities = [[USLocationsDatabase database] allLocationsInRegion:self.regionString];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.cities = nil;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
    }
    
    Location *location = [self.cities objectAtIndex: indexPath.row];
    cell.textLabel.text = location.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%g, %g)", location.region, location.coord->longitude, location.coord->latitude];
    
    return cell;
}

//***********************************************
/* RETRIEVED FROM APPCODA.COM */
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"setCity"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MainViewController *destViewController = segue.destinationViewController;
        destViewController.cityObject = [self.cities objectAtIndex: indexPath.row];
        
        // saving an NSString
        [self.standardUserDefaults setObject:destViewController.cityObject.name forKey:@"cityName"];
        
        // saving a double
        [self.standardUserDefaults setDouble:destViewController.cityObject.coord->latitude forKey:@"cityLat"];
        
        [self.standardUserDefaults setDouble:destViewController.cityObject.coord->longitude forKey:@"cityLon"];
        
        // synchronize the settings
        [self.standardUserDefaults synchronize];
    }
}

@end
