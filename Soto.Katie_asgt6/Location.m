//
//  Location.m
//  Soto.Katie_asgt6
//
//  Created by Guest User on 11/26/12.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
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
