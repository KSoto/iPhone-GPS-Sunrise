//
//  GPSLocatorViewController.m
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
//  File Description: This controller WILL control the GPS detection routine, but
//      has not yet been implemented.
//

#import "GPSLocatorViewController.h"

@interface GPSLocatorViewController ()

@end

@implementation GPSLocatorViewController
{
    CLLocationManager *locationManager;
}

@synthesize latLabel = _latLabel;
@synthesize longLabel = _longLabel;
@synthesize standardUserDefaults = standardUserDefaults;
@synthesize successLabel = _successLabel;

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
    
    self.longLabel.hidden = TRUE;
    self.latLabel.hidden = TRUE;
    self.successLabel.hidden = TRUE;
    
    locationManager = [[CLLocationManager alloc] init];
    
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
    
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        self.longLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        self.latLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        self.successLabel.text = @"Success!";
        
        //save coordinates
        [self.standardUserDefaults setObject:@"GPS Retrieved" forKey:@"cityName"];
        [self.standardUserDefaults setDouble:currentLocation.coordinate.latitude forKey:@"cityLat"];
        [self.standardUserDefaults setDouble:currentLocation.coordinate.longitude forKey:@"cityLon"];
        
        // synchronize the settings
        [self.standardUserDefaults synchronize];
    }
    
    // Stop Location Manager, we have a coordinate; just run once
    [locationManager stopUpdatingLocation];
}

@end
