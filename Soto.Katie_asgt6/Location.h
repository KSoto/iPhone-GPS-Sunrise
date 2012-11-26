//
//  Location.h
//  Soto.Katie_asgt6
//
//  Created by Guest User on 11/26/12.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
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

- (NSString*) description;

- (CLLocationCoordinate2D*) coord;

@end
