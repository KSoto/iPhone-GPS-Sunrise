//
//  MyLocationManager.h
//  Soto.Katie_asgt6
//
//  Created by cpsc491t on 12/3/12.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface MyLocationManager : NSObject <CLLocationManagerDelegate>
{
    CLLocationManager* _locationManager;
    NSString* _stateString;
    CLLocation *_bestEffortAtLocation;
    NSMutableArray* locationMeasurements;
}
@property (nonatomic, retain) CLLocationManager* locationManager;
@property (nonatomic, retain) NSString* stateString;
@property (nonatomic, retain) CLLocation* bestEffortAtLocation;
- (void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation;
- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;
- (void) startUpdatingLocation:(NSString *)state;
- (void) stopUpdatingLocation:(NSString *)state;
@end