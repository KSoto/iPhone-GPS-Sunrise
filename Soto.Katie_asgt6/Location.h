//
//  Location.h
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

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Location : NSObject
{
    NSString* _name;
    NSString* _uc_name;
    NSString* _uc_alt_name;
    NSString* _region;
    CLLocationCoordinate2D coord;
    NSString* _timezone;
}

@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* uc_name;
@property (nonatomic, retain) NSString* uc_alt_name;
@property (nonatomic, retain) NSString* region;
@property (nonatomic, retain) NSString* timezone;
@property (readonly) CLLocationCoordinate2D* coord;

- (id) initWithName: (NSString*) aName andUCName: (NSString*) aUCName andUCAltName: (NSString*) aUCAltName andRegion: (NSString*) aRegion andCoordinate: (CLLocationCoordinate2D*) aCoordinate andTimezone: (NSString*) aTimezone;

- (id) initWithName: (NSString*) aName;

- (NSString*) description;

- (CLLocationCoordinate2D*) coord;

@end
