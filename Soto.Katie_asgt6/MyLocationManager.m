//
//  MyLocationManager.m
//  Soto.Katie_asgt6
//
//  Created by cpsc491t on 12/3/12.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

//***********FROM http://gamble.ecs.fullerton.edu/teaching/fall12/cs491t/sample-code/corelocation.m/view **************//

#import "MyLocationManager.h"
#import "CLLocation (Strings).h"


@implementation MyLocationManager

@synthesize locationManager = _locationManager;
@synthesize stateString = _stateString;
@synthesize bestEffortAtLocation = _bestEffortAtLocation;
@synthesize gpsCoordinates = _gpsCoordinates;

- (void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [locationMeasurements addObject:newLocation];
    NSTimeInterval locationAge = -[newLocation.timestamp timeIntervalSinceNow];
    if (locationAge > 5.0) return;
    if (newLocation.horizontalAccuracy < 0) return;
    if (self.bestEffortAtLocation == nil || self.bestEffortAtLocation.horizontalAccuracy > newLocation.horizontalAccuracy) {
        self.bestEffortAtLocation = newLocation;
        if (newLocation.horizontalAccuracy <= self.locationManager.desiredAccuracy) {
            [self stopUpdatingLocation:NSLocalizedString(@"Acquired Location", @"Acquired Location")];
            [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(stopUpdatingLocation:) object:nil];
        }
    }
}
- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if ([error code] != kCLErrorLocationUnknown) {
        [self stopUpdatingLocation:@"Error"];
    }
}
- (void) startUpdatingLocation:(NSString *)state
{
    NSLog(@"Starting.");
    self.stateString = state;
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = 100.0;
    [self.locationManager startUpdatingLocation];
    [self performSelector:@selector(stopUpdatingLocation:) withObject:@"Timed Out" afterDelay:20.0];
    self.stateString = NSLocalizedString(@"Updating", @"Updating");
}
- (void) stopUpdatingLocation:(NSString *)state
{
    self.stateString = state;
    [self.locationManager stopUpdatingLocation];
    self.locationManager.delegate = nil;
    NSLog(@"The state is %@", self.stateString);
    NSLog(@"The coordinates %@", self.bestEffortAtLocation.localizedCoordinateString);
    
    self.standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    // saving an NSString
    [self.standardUserDefaults setObject:self.bestEffortAtLocation.localizedCoordinateString forKey:@"localizedCoordinateString"];
    
    // synchronize the settings
    [self.standardUserDefaults synchronize];

}
@end