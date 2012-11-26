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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.cities = [[USLocationsDatabase database] allLocationsInRegion:@"US/CA"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.cities = nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.cities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"Cell";
    static NSString *MyIdentifier = @"MyIdentifier";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
		// Use the default cell style.
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
        destViewController.cityName = [self.cities objectAtIndex: indexPath.row];
    }
}

@end
