//
//  ManualLocatorCITYViewController.h
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

#import <UIKit/UIKit.h>
#import "Location.h"
#import "USLocationsDatabase.h"
#import "MainViewController.h"
#import "Location.h"

@interface ManualLocatorCITYViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    
    IBOutlet UITableView *tableView;
    Location* _selectedRegion;
    NSString* _regionString;
    
    //http://codeexamples.wordpress.com/2011/02/12/nsuserdefaults-example/
    NSUserDefaults * standardUserDefaults;
    
    //http://developer.apple.com/library/ios/#samplecode/TableViewSuite/Introduction/Intro.html
    NSMutableArray* _cities;
    NSMutableArray *sectionsArray; //this will create an array with A-Z for the sections
    UILocalizedIndexedCollation *collation;
}

@property (nonatomic, retain) NSMutableArray* cities;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) Location* selectedRegion;
@property (nonatomic, retain) NSString* regionString;
@property (nonatomic, retain) NSUserDefaults * standardUserDefaults;

@property (nonatomic, retain) NSMutableArray *sectionsArray;
@property (nonatomic, retain) UILocalizedIndexedCollation *collation;
- (void)configureSections;
- (void)setTimeZonesArray:(NSMutableArray *)newDataArray;

@end
