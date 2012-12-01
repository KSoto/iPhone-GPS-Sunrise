//
//  ManualLocatorCITYViewController.m
//  Soto.Katie_asgt6
//
//  Author: Katie Soto
//  Project: iPhone Sunrise / Sunset Application
//  Author's Email: KReneSoto@gmail.com
//  Author's Phone: (714) 213-2228
//  Date Created: 11/2012
//  Class: CSUF CPSC 491T - iPhone Mobile App Development
//  Professor: Michael Shafae
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//  Problem Statement: Write an iPhone application that calculates the Civil, Official,
//      Nautical, and Astronomical Sunrise and Sunset times for a given city. Use the
//      "us_only.sq3" SQLite database to find the latitude and longitude of all cities
//      in united states. Use a table view to display all states / cities for the user
//      to choose their location. Allow the location (and settings) to be saved upon
//      exiting the application.
//  File Description: This is the CITY TABLE VIEW where the user selects which city
//      they would like to know the sunrise and sunset of. Once selected, the city gets
//      stored in the NSUserDefaults dictionary which gets called in MainViewController.
//
//  Copyright note: The behavior of NSUserDefaults *standardUserDefaults has been
//          modeled after:
//      Source: Code by Example
//      Address: http://codeexamples.wordpress.com/2011/02/12/nsuserdefaults-example/
//      Author: Unknown
//      Date Retrieved: 2/2011
//      Copyright: unknown, assuming All Rights Reserved
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
