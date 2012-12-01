//
//  Location.m
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
//  File Description: This file represents our data in our database. Our database
//      columns are-
//          "name" - name of city
//          "uc_name" - official name
//          "uc_alt_name" - alternate name
//          "region" - state
//          "coord" - longitude and latitude
//          "timezone" - timezone
//      A sample record is:
//          "Adak","ADAK","","US/AK","51.88","-176.65806","America/Adak"
//      Each variable declared here represents a column in our database and is used
//      to retrieve information in MainViewController.
//
//

#import "Location.h"

@implementation Location

@synthesize name = _name;
@synthesize uc_name = _uc_name;
@synthesize uc_alt_name = _uc_alt_name;
@synthesize region = _region;
@synthesize timezone = _timezone;

- (id) initWithName: (NSString*) aName andUCName: (NSString*) aUCName andUCAltName: (NSString*) aUCAltName andRegion: (NSString*) aRegion andCoordinate: (CLLocationCoordinate2D*) aCoordinate andTimezone: (NSString*) aTimezone;
{
    self = [super init];
    if( self ){
        self.name = aName;
        self.uc_name = aUCName;
        self.uc_alt_name = aUCAltName;
        self.region = aRegion;
        coord = CLLocationCoordinate2DMake(aCoordinate->longitude, aCoordinate->latitude);
        self.timezone = aTimezone;
    }
    return self;
}

- (NSString*) description
{
    return [NSString stringWithFormat:@"%@ %@ %@ %@ %g %g %@", _name, _uc_name, _uc_alt_name, _region, coord.latitude, coord.longitude, _timezone];
}

- (CLLocationCoordinate2D*) coord
{
    return &coord;
}

@end
