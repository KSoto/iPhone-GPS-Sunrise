//
//  USLocationsDatabase.h
//  Soto.Katie_asgt6
//
//  Created by Guest User on 11/26/12.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//
/*
 USLocation... is object that I’m using to represent my database
 --have a pointer to the database
 --methods to query sqlite
 --makes the queries
 --always returns the us location database type of a type string
 --“someLocations” and “allLocations” are QUERIES
 --could have “allLocationsInRegion” that will return an array with all the regions, etc.
 --allLocations is returning around 10MB, the entire thing
 --need a query that will give you information for the next query
 --rename “static USLocationsDatabase* _database;” to be something different than “sqlite3* _database;” to not be confusing
*/

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
