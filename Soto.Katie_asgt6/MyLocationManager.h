//
//  MyLocationManager.h
//  Soto.Katie_asgt6
//
//  Created by cpsc491t on 12/3/12.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

//***********FROM http://gamble.ecs.fullerton.edu/teaching/fall12/cs491t/sample-code/corelocation.m/view **************//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Location.h"

@interface MyLocationManager : NSObject <CLLocationManagerDelegate>
{
    CLLocationManager* _locationManager;
    NSString* _stateString;
    CLLocation *_bestEffortAtLocation;
    NSMutableArray* locationMeasurements;
    
    Location* _gpsCoordinates;
    //http://codeexamples.wordpress.com/2011/02/12/nsuserdefaults-example/
    NSUserDefaults * standardUserDefaults;
}
@property (nonatomic, retain) CLLocationManager* locationManager;
@property (nonatomic, retain) NSString* stateString;
@property (nonatomic, retain) CLLocation* bestEffortAtLocation;
@property (nonatomic, retain) Location* gpsCoordinates;
@property (nonatomic, retain) NSUserDefaults * standardUserDefaults;

- (void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation;
- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;
- (void) startUpdatingLocation:(NSString *)state;
- (void) stopUpdatingLocation:(NSString *)state;
@end