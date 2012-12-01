//
//  USLocationsDatabase.m
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
//  File Description:  This file includes METHODS that we use to RETRIEVE information
//      from our database (using SQL statements). For example, "allRegions" returns
//      all states which is the product of the SQL statement ran. See each method
//      for a detailed associated SQL statement. Not all are used.
//

#import "USLocationsDatabase.h"

@implementation USLocationsDatabase

static USLocationsDatabase* _database;

+ (USLocationsDatabase*) database
{
    if (_database == nil) {
        _database = [[USLocationsDatabase alloc] init];
    }
    return _database;
}

- (id) init{
    self = [super init];
    if (self) {
        NSString* dbpath = [[NSBundle mainBundle] pathForResource:@"us_only" ofType:@"sq3"];
        if (sqlite3_open([dbpath UTF8String], &_database) != SQLITE_OK) {
            NSLog(@"Failed to open database.");
        }
    }
    return self;
}

- (void) dealloc
{
    sqlite3_close(_database);
}
- (NSArray*) allRegions
{
    NSMutableArray* rv = [[NSMutableArray alloc] init];
    NSString* query = @"SELECT DISTINCT region FROM sol_places";
    sqlite3_stmt *stmt;
    const unsigned char* text;
    NSString *name, *uc_name, *uc_alt_name, *region, *timezone;
    double longitude, latitude;
    if( sqlite3_prepare_v2(_database, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK){
        while( sqlite3_step(stmt) == SQLITE_ROW){
            text = sqlite3_column_text(stmt, 0);
            if( text )
                name = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                name = nil;
            text = sqlite3_column_text(stmt, 1);
            if(text)
                uc_name = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                uc_name = nil;
            text = sqlite3_column_text(stmt, 2);
            if(text)
                uc_alt_name = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                uc_alt_name = nil;
            text = sqlite3_column_text(stmt, 3);
            if(text)
                region = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                region = nil;
            text = sqlite3_column_text(stmt, 6);
            if(text)
                timezone = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                timezone = nil;
            
            longitude = sqlite3_column_double(stmt, 4);
            latitude = sqlite3_column_double(stmt, 5);
            CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(longitude, latitude);
            Location *thisLocation = [[Location alloc] initWithName:name andUCName:uc_name andUCAltName:uc_alt_name andRegion:region andCoordinate:&coord andTimezone:timezone];
            [rv addObject: thisLocation];
        }
        sqlite3_finalize(stmt);
    }
    return rv;    
}

- (NSArray*) allLocationsInRegion: (NSString*) selectedRegion
{
    NSMutableArray* rv = [[NSMutableArray alloc] init];
    NSString* query = [NSString stringWithFormat: @"SELECT * FROM sol_places where region='%@'", selectedRegion];
    sqlite3_stmt *stmt;
    const unsigned char* text;
    NSString *name, *uc_name, *uc_alt_name, *region, *timezone;
    double longitude, latitude;
    if( sqlite3_prepare_v2(_database, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK){
        while( sqlite3_step(stmt) == SQLITE_ROW){
            text = sqlite3_column_text(stmt, 0);
            if( text )
                name = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                name = nil;
            text = sqlite3_column_text(stmt, 1);
            if(text)
                uc_name = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                uc_name = nil;
            text = sqlite3_column_text(stmt, 2);
            if(text)
                uc_alt_name = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                uc_alt_name = nil;
            text = sqlite3_column_text(stmt, 3);
            if(text)
                region = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                region = nil;
            text = sqlite3_column_text(stmt, 6);
            if(text)
                timezone = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                timezone = nil;
            
            longitude = sqlite3_column_double(stmt, 4);
            latitude = sqlite3_column_double(stmt, 5);
            CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(longitude, latitude);
            Location *thisLocation = [[Location alloc] initWithName:name andUCName:uc_name andUCAltName:uc_alt_name andRegion:region andCoordinate:&coord andTimezone:timezone];
            [rv addObject: thisLocation];
        }
        sqlite3_finalize(stmt);
    }
    return rv;
    
}

- (NSArray*) someLocations
{
    NSMutableArray* rv = [[NSMutableArray alloc] init];
    NSString* query = @"SELECT * FROM sol_places where region='US/CA'";
    sqlite3_stmt *stmt;
    const unsigned char* text;
    NSString *name, *uc_name, *uc_alt_name, *region, *timezone;
    double longitude, latitude;
    if( sqlite3_prepare_v2(_database, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK){
        while( sqlite3_step(stmt) == SQLITE_ROW){
            text = sqlite3_column_text(stmt, 0);
            if( text )
                name = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                name = nil;
            text = sqlite3_column_text(stmt, 1);
            if(text)
                uc_name = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                uc_name = nil;
            text = sqlite3_column_text(stmt, 2);
            if(text)
                uc_alt_name = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                uc_alt_name = nil;
            text = sqlite3_column_text(stmt, 3);
            if(text)
                region = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                region = nil;
            text = sqlite3_column_text(stmt, 6);
            if(text)
                timezone = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                timezone = nil;
            
            longitude = sqlite3_column_double(stmt, 4);
            latitude = sqlite3_column_double(stmt, 5);
            CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(longitude, latitude);
            Location *thisLocation = [[Location alloc] initWithName:name andUCName:uc_name andUCAltName:uc_alt_name andRegion:region andCoordinate:&coord andTimezone:timezone];
            [rv addObject: thisLocation];
        }
        sqlite3_finalize(stmt);
    }
    return rv;
}

- (NSArray*) allLocations
{
    NSMutableArray* rv = [[NSMutableArray alloc] init];
    NSString* query = @"SELECT * FROM sol_places";
    sqlite3_stmt *stmt;
    const unsigned char* text;
    NSString *name, *uc_name, *uc_alt_name, *region, *timezone;
    double longitude, latitude;
    if( sqlite3_prepare_v2(_database, [query UTF8String], [query length], &stmt, nil) == SQLITE_OK){
        while( sqlite3_step(stmt) == SQLITE_ROW){
            text = sqlite3_column_text(stmt, 0);
            if( text )
                name = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                name = nil;
            text = sqlite3_column_text(stmt, 1);
            if(text)
                uc_name = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                uc_name = nil;
            text = sqlite3_column_text(stmt, 2);
            if(text)
                uc_alt_name = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                uc_alt_name = nil;
            text = sqlite3_column_text(stmt, 3);
            if(text)
                region = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                region = nil;
            text = sqlite3_column_text(stmt, 6);
            if(text)
                timezone = [NSString stringWithCString: (const char*)text encoding:NSUTF8StringEncoding];
            else
                timezone = nil;
            
            longitude = sqlite3_column_double(stmt, 4);
            latitude = sqlite3_column_double(stmt, 5);
            CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(longitude, latitude);
            Location *thisLocation = [[Location alloc] initWithName:name andUCName:uc_name andUCAltName:uc_alt_name andRegion:region andCoordinate:&coord andTimezone:timezone];
            [rv addObject: thisLocation];
        }
        sqlite3_finalize(stmt);
    }
    return rv;
}

@end
