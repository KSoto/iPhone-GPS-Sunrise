//
//  ManualLocatorCITYViewController.m
//  Soto.Katie_asgt6
//
//  Author: Katie Soto
//  Project: iPhone GPS Sunrise / Sunset Application
//  Author's Email: KReneSoto@gmail.com
//  Author's Phone: (714) 213-2228
//  Date Created: 12/2012
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
//      As of the new release, the cities are not INDEXED alphabeticly. 
//
//  Copyright note: The behavior of NSUserDefaults *standardUserDefaults has been
//          modeled after:
//      Source: Code by Example
//      Address: http://codeexamples.wordpress.com/2011/02/12/nsuserdefaults-example/
//      Author: Unknown
//      Date Retrieved: 2/2011
//      Copyright: unknown, assuming All Rights Reserved
//
//  Copyright note: Indexing the table view alphabetically has been taken from:
//      Source: Apple Developer - SimpleIndexedTableView
//      Address: http://developer.apple.com/library/ios/#samplecode/TableViewSuite/Introduction/Intro.html
//      Author: Unknown
//      Date Updated: 6/2012
//      Copyright: © 2010 Apple Inc. All Rights Reserved.

#import "ManualLocatorCITYViewController.h"
#import "Location.h"

@implementation ManualLocatorCITYViewController

@synthesize cities = _cities;
@synthesize tableView;
@synthesize selectedRegion = _selectedRegion;
@synthesize regionString = _regionString;
@synthesize standardUserDefaults;

//*****using "Location" instead of "TimeZoneWrapper"
//timeZonesArray -> cities
//timeZonesInSection -> citiesInSection
//timeZone -> cityName
//sectionTimeZones -> sectionCityNames
//timeZonesArrayForSection -> citiesForSection
//sortedTimeZonesArrayForSection -> sortedCitiesForSection

@synthesize sectionsArray;
@synthesize collation;

@synthesize citiesInSection;

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

//***********************************************
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Cities";
    
    self.standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    // Uncomment the following line to preserve selection between presentations.
     //self.clearsSelectionOnViewWillAppear = NO;
    
//****Get the state and fill the cities array with all cities in that state****
    //GET THE REGION from ManualLocatorViewController
    self.regionString = self.selectedRegion.name;
    //FILL the cities array with the names of all cities in 
    //the region (that was retrieved from the last table view)
    self.cities = [[USLocationsDatabase database] allLocationsInRegion:self.regionString];
}

//***********************************************
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// The number of sections is the same as the number of titles in the collation.
    return [[collation sectionTitles] count];
}

//***********************************************
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // The number of cities in the section is the count of the array
    //associated with the section in the sections array.
	self.citiesInSection = [sectionsArray objectAtIndex:section];
    return [self.citiesInSection count];
}

//***********************************************
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
    }
    
    // Get the city from the array associated with the section index in the sections arra
    self.citiesInSection = [sectionsArray objectAtIndex:indexPath.section];
    
    
    // Configure the cell with the city's name.
    Location *cityName = [self.citiesInSection objectAtIndex: indexPath.row];
    
    cell.textLabel.text = cityName.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%g, %g)", cityName.region, cityName.coord->longitude, cityName.coord->latitude];
    
    return cell;
}

//***********************************************
/*
 Section-related methods: Retrieve the section titles and section index titles from the collation.
 */

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[collation sectionTitles] objectAtIndex:section];
}


- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [collation sectionIndexTitles];
}


- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [collation sectionForSectionIndexTitleAtIndex:index];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//***********************************************
- (void)setCities:(NSMutableArray *)newDataArray {
	if (newDataArray != _cities) {
		//[_cities release];
		_cities = newDataArray;
	}
	if (_cities == nil) {
		self.sectionsArray = nil;
	}
	else {
		[self configureSections];
	}
}

//***********************************************
- (void)configureSections {
	
	// Get the current collation and keep a reference to it.
	self.collation = [UILocalizedIndexedCollation currentCollation];
	
	NSInteger index, sectionTitlesCount = [[collation sectionTitles] count];
	
	NSMutableArray *newSectionsArray = [[NSMutableArray alloc] initWithCapacity:sectionTitlesCount];
	
	// Set up the sections array: elements are mutable arrays that will contain the cities for that section.
	for (index = 0; index < sectionTitlesCount; index++) {
		NSMutableArray *array = [[NSMutableArray alloc] init];
		[newSectionsArray addObject:array];
	}
	
	// Segregate the cities into the appropriate arrays.
	for (Location* cityName in self.cities) {
		
		// Ask the collation which section number the city belongs in, based on its locale name.
		NSInteger sectionNumber = [collation sectionForObject:cityName collationStringSelector:@selector(name)];
		
		// Get the array for the section.
		NSMutableArray *sectionCityNames = [newSectionsArray objectAtIndex:sectionNumber];
		
		//  Add the city to the section.
		[sectionCityNames addObject:cityName];
	}
	
	// Now that all the data's in place, each section array needs to be sorted.
	for (index = 0; index < sectionTitlesCount; index++) {
		
		NSMutableArray *citiesForSection = [newSectionsArray objectAtIndex:index];
		
		// If the table view or its contents were editable, you would make a mutable copy here.
		NSArray *sortedCitiesForSection = [collation sortedArrayFromArray:citiesForSection collationStringSelector:@selector(name)];
		
		// Replace the existing array with the sorted array.
		[newSectionsArray replaceObjectAtIndex:index withObject:sortedCitiesForSection];
	}
	
	self.sectionsArray = newSectionsArray;
}

//***********************************************
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.cities = nil;
}


//***********************************************
/* RETRIEVED FROM APPCODA.COM */
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"setCity"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        //get the sections information again
        self.citiesInSection = [sectionsArray objectAtIndex:indexPath.section];
        
        //give the information to MainViewController
        MainViewController *destViewController = segue.destinationViewController;
        destViewController.cityObject = [self.citiesInSection objectAtIndex: indexPath.row];
        
        //save the information to NSUserDefaults
        [self.standardUserDefaults setObject:destViewController.cityObject.name forKey:@"cityName"];
        [self.standardUserDefaults setDouble:destViewController.cityObject.coord->latitude forKey:@"cityLat"];
        [self.standardUserDefaults setDouble:destViewController.cityObject.coord->longitude forKey:@"cityLon"];
        [self.standardUserDefaults synchronize];
    }
}

@end
