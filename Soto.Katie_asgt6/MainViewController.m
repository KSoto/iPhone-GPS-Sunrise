//
//  MainViewController.m
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
//  File Description: This view controller is the first view that the user sees, that
//      displays the calculated sunrise and sunset times. Upon loading, the view first
//      checks if the user has previously set their location (setting is saved via
//      NSUserDefaults). If they have, it calculated the sunrise and sunset times using
//      the included "Sunrise" libraries. If not, it defaults to Fullerton, CA. The view
//      will only show the sunrise/sunset types that the user selects in the "settings"
//      screen, which is controlled by the "SettingsViewController" View Controller.
//
//  Copyright note: The behavior of NSUserDefaults *standardUserDefaults has been
//          modeled after:
//      Source: Code by Example
//      Address: http://codeexamples.wordpress.com/2011/02/12/nsuserdefaults-example/
//      Author: Unknown
//      Date Retrieved: 2/2011
//      Copyright: unknown, assuming All Rights Reserved
//

#import "MainViewController.h"

@implementation MainViewController

@synthesize cityObject = _cityObject;

@synthesize civilSunriseLabel = _civilSunriseLabel;
@synthesize officialSunriseLabel = _officialSunriseLabel;
@synthesize nauticalSunriseLabel = _nauticalSunriseLabel;
@synthesize astroSunriseLabel = _astroSunriseLabel;

@synthesize civilSunsetLabel = _civilSunsetLabel;
@synthesize officialSunsetLabel = _officialSunsetLabel;
@synthesize nauticalSunsetLabel = _nauticalSunsetLabel;
@synthesize astroSunsetLabel = _astroSunsetLabel;

@synthesize civilIcon = _civilIcon;
@synthesize officialIcon = _officialIcon;
@synthesize nauticalIcon = _nauticalIcon;
@synthesize astroIcon = _astroIcon;

@synthesize civil;
@synthesize official;
@synthesize nautical;
@synthesize astro;

@synthesize standardUserDefaults;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        //each setting (civil, nautical, etc.) defaults to TRUE,
        //so it's ON by DEFAULT
        self.civil = TRUE;
        self.official = TRUE;
        self.nautical = TRUE;
        self.astro = TRUE;
    }
    return self;
}

//*********************************************************************
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // create a standardUserDefaults variable
    self.standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
//*******GET SAVED USER PREFERENCES************
    self.civil = [self.standardUserDefaults boolForKey:@"civilBool"];
    self.official = [self.standardUserDefaults boolForKey:@"officialBool"];
    self.nautical = [self.standardUserDefaults boolForKey:@"nauticalBool"];
    self.astro = [self.standardUserDefaults boolForKey:@"astroBool"];
    
//Get current time    
    time_t now;
    struct tm* timeinfo;
    
//***GETS THE CITY NAME SET BY THE USER****
    NSString *cityName = [self.standardUserDefaults stringForKey:@"cityName"];
    
//***GETS THE LAT AND LOG FROM THE SELECTED CITY***
    double lat;
    double lon;
    
    if(cityName==NULL)
    {
        NSLog(@"\nLocation has not been set. Please click settings to set your location");
        //location has NOT been set by the user, using default values...
        lat = 33.87028;
        lon = -117.92444;
    }else{
        NSLog(@"\nLocation set to: %@", cityName);
        //location has been previously set by the user
        //"lat" and "long" are switched, sorry for the confusion
        lat = [self.standardUserDefaults doubleForKey:@"cityLon"];
        NSLog(@"\nLat is: %f", lat);
        lon = [self.standardUserDefaults doubleForKey:@"cityLat"];
        NSLog(@"\nLong is: %f", lon);
    }

    time( &now );
    timeinfo = localtime( &now );

    //printf ( "\nCurrent local time and date: %s", asctime(timeinfo) );
    
//*******PRINT SUNRISE & SUNSET TIMES****************
    //if civil is enabled...
    if(self.civil==TRUE)
    {
        self.civilIcon.hidden = FALSE;
        self.civilSunriseLabel.hidden = FALSE;
        self.civilSunsetLabel.hidden = FALSE;
        
        double sunrise = calculateSunriseOrSunset( timeinfo, lat, lon, CIVIL, YES );
        double sunrise_h = floor(sunrise) - ( sunrise > 12.0 ? 12.0 : 0.0);
        double sunrise_m = round((sunrise - floor(sunrise)) * 60.0 );
    
        double sunset = calculateSunriseOrSunset( timeinfo, lat, lon, CIVIL, NO );
        double sunset_h = floor(sunset) - ( sunset > 12.0 ? 12.0 : 0.0);
        double sunset_m = round((sunset - floor(sunset)) * 60.0 );
    
        self.civilSunriseLabel.text = [NSString stringWithFormat:@"Sunrise: %g:%02g AM", sunrise_h, sunrise_m ];
        self.civilSunsetLabel.text = [NSString stringWithFormat:@"Sunset: %g:%02g PM", sunset_h, sunset_m ];
    }else{
        self.civilIcon.hidden = TRUE;
        self.civilSunriseLabel.hidden = TRUE;
        self.civilSunsetLabel.hidden = TRUE;
    }
    
    if(self.official==TRUE)
    {
        self.officialIcon.hidden = FALSE;
        self.officialSunriseLabel.hidden = FALSE;
        self.officialSunsetLabel.hidden = FALSE;
        
        double sunrise = calculateSunriseOrSunset( timeinfo, lat, lon, OFFICIAL, YES );
        double sunrise_h = floor(sunrise) - ( sunrise > 12.0 ? 12.0 : 0.0);
        double sunrise_m = round((sunrise - floor(sunrise)) * 60.0 );
        
        double sunset = calculateSunriseOrSunset( timeinfo, lat, lon, OFFICIAL, NO );
        double sunset_h = floor(sunset) - ( sunset > 12.0 ? 12.0 : 0.0);
        double sunset_m = round((sunset - floor(sunset)) * 60.0 );
        
        self.officialSunriseLabel.text = [NSString stringWithFormat:@"Sunrise: %g:%02g AM", sunrise_h, sunrise_m ];
        self.officialSunsetLabel.text = [NSString stringWithFormat:@"Sunset: %g:%02g PM", sunset_h, sunset_m ];
    }else{
        self.officialIcon.hidden = TRUE;
        self.officialSunriseLabel.hidden = TRUE;
        self.officialSunsetLabel.hidden = TRUE;
    }
    
    if(self.nautical==TRUE)
    {
        self.nauticalIcon.hidden = FALSE;
        self.nauticalSunriseLabel.hidden = FALSE;
        self.nauticalSunsetLabel.hidden = FALSE;
        
        double sunrise = calculateSunriseOrSunset( timeinfo, lat, lon, NAUTICAL, YES );
        double sunrise_h = floor(sunrise) - ( sunrise > 12.0 ? 12.0 : 0.0);
        double sunrise_m = round((sunrise - floor(sunrise)) * 60.0 );
        
        double sunset = calculateSunriseOrSunset( timeinfo, lat, lon, NAUTICAL, NO );
        double sunset_h = floor(sunset) - ( sunset > 12.0 ? 12.0 : 0.0);
        double sunset_m = round((sunset - floor(sunset)) * 60.0 );
        
        self.nauticalSunriseLabel.text = [NSString stringWithFormat:@"Sunrise: %g:%02g AM", sunrise_h, sunrise_m ];
        self.nauticalSunsetLabel.text = [NSString stringWithFormat:@"Sunset: %g:%02g PM", sunset_h, sunset_m ];
    }else{
        self.nauticalIcon.hidden = TRUE;
        self.nauticalSunriseLabel.hidden = TRUE;
        self.nauticalSunsetLabel.hidden = TRUE;
    }
    
    if(self.astro==TRUE)
    {
        self.astroIcon.hidden = FALSE;
        self.astroSunriseLabel.hidden = FALSE;
        self.astroSunsetLabel.hidden = FALSE;
        
        double sunrise = calculateSunriseOrSunset( timeinfo, lat, lon, ASTRONOMICAL, YES );
        double sunrise_h = floor(sunrise) - ( sunrise > 12.0 ? 12.0 : 0.0);
        double sunrise_m = round((sunrise - floor(sunrise)) * 60.0 );
        
        double sunset = calculateSunriseOrSunset( timeinfo, lat, lon, ASTRONOMICAL, NO );
        double sunset_h = floor(sunset) - ( sunset > 12.0 ? 12.0 : 0.0);
        double sunset_m = round((sunset - floor(sunset)) * 60.0 );
        
        
        self.astroSunriseLabel.text = [NSString stringWithFormat:@"Sunrise: %g:%02g AM", sunrise_h, sunrise_m ];
        self.astroSunsetLabel.text = [NSString stringWithFormat:@"Sunset: %g:%02g PM", sunset_h, sunset_m ];
    }else{
        self.astroIcon.hidden = TRUE;
        self.astroSunriseLabel.hidden = TRUE;
        self.astroSunsetLabel.hidden = TRUE;
    }
    
}

//***********************************************
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

//***********************************************
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
