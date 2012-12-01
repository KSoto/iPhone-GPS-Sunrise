//
//  USLocationsDatabase.h
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
//  File Description: This file includes METHODS that we use to RETRIEVE information
//      from our database (using SQL statements). For example, "allRegions" returns
//      all states which is the product of the SQL statement ran. See each method
//      for a detailed associated SQL statement. Not all are used.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Location.h"

@interface USLocationsDatabase : NSObject
{
    sqlite3* _database;
}

+ (USLocationsDatabase*) database;
- (NSArray*) someLocations;
- (NSArray*) allLocations;
- (NSArray*) allRegions;
- (NSArray*) allLocationsInRegion: (NSString*) selectedRegion;

@end
