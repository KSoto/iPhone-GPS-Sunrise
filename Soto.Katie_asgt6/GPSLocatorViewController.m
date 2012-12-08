//
//  GPSLocatorViewController.m
//  Soto.Katie_asgt6
//
//  Author: Katie Soto
//  Project: iPhone GPS Sunrise / Sunset Application
//  Author's Email: KReneSoto@gmail.com
//  Author's Phone: (714) 213-2228
//  Date Created: 12/2012
//  Class: CSUF CPSC 491T - iPhone Mobile App Development
//  Professor: Michael Shafae
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//  Problem Statement: Write an iPhone application that calculates the Civil, Official,
//      Nautical, and Astronomical Sunrise and Sunset times for a given city. Use the
//      "us_only.sq3" SQLite database to find the latitude and longitude of all cities
//      in united states. Use a table view to display all states / cities for the user
//      to choose their location. Allow the location (and settings) to be saved upon
//      exiting the application.
//  File Description: This controller controls the GPS detection routine.
//
//  Copyright note: The behavior of my GPS routine has been modeled by:
//      Source: App Coda
//      Address: http://www.appcoda.com/how-to-get-current-location-iphone-user/
//      Author: Simon Ng
//      Date Written: 9/2012
//      Copyright: © Copyright 2012 AppCoda · All Rights Reserved
//

#import "GPSLocatorViewController.h"

@interface GPSLocatorViewController ()

@end

//http://www.appcoda.com/how-to-get-current-location-iphone-user/
@implementation GPSLocatorViewController
{
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}

@synthesize latLabel = _latLabel;
@synthesize longLabel = _longLabel;
@synthesize standardUserDefaults = standardUserDefaults;
@synthesize successLabel = _successLabel;
@synthesize addressLabel = _addressLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//http://www.appcoda.com/how-to-get-current-location-iphone-user/
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    self.longLabel.hidden = TRUE;
    self.latLabel.hidden = TRUE;
    self.successLabel.hidden = TRUE;
    
    //initialize
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    
    //GET CURRENT LOCATION:
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//GET CURRENT LOCATION EVENTS:
//http://www.appcoda.com/how-to-get-current-location-iphone-user/
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    self.longLabel.hidden = TRUE;
    self.latLabel.hidden = TRUE;
    self.successLabel.hidden = FALSE;
    
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
    self.successLabel.text = @"Failure!";
}

//http://www.appcoda.com/how-to-get-current-location-iphone-user/
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    self.longLabel.hidden = FALSE;
    self.latLabel.hidden = FALSE;
    self.successLabel.hidden = FALSE;
    
    //NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        self.longLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        self.latLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        self.successLabel.text = @"Success!";
        
        //save coordinates
        [self.standardUserDefaults setObject:@"GPS Retrieved" forKey:@"cityName"];
        [self.standardUserDefaults setDouble:currentLocation.coordinate.latitude forKey:@"cityLon"];
        [self.standardUserDefaults setDouble:currentLocation.coordinate.longitude forKey:@"cityLat"];
        
        // synchronize the settings
        [self.standardUserDefaults synchronize];
    }
    
    // TRY TO find the address based on lat & long
    //NSLog(@"Resolving the Address");
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        //NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            self.addressLabel.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                 placemark.subThoroughfare, placemark.thoroughfare,
                                 placemark.postalCode, placemark.locality,
                                 placemark.administrativeArea,
                                 placemark.country];
        }
    } ];
    
    
    // Stop Location Manager, we have a coordinate; just run once
    [locationManager stopUpdatingLocation];
}

@end
