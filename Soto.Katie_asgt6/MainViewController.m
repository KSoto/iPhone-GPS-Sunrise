//
//  MainViewController.m
//  Soto.Katie_asgt6
//
//  Created by Lion User on 16/11/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

//*****NOTE TO SELF: USE NSUSERDEFAULTS TO SET USER PREFERENCES EVEN AFTER YOU CLOSE THE APP********//

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

@synthesize civil;
@synthesize official;
@synthesize nautical;
@synthesize astro;

@synthesize userDefaults = _userDefaults;

//********PROBLEM: INIT WITH NIB IS NOT EVER RUNNING*******************
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        // Custom initialization
        self.userDefaults = [NSUserDefaults standardUserDefaults];
        
        //each setting (civil, nautical, etc.) defaults to TRUE,
        //so it's ON by DEFAULT
        self.civil = TRUE;
        self.official = TRUE;
        self.nautical = TRUE;
        self.astro = TRUE;
        NSLog(@"HELLO");
    }
    return self;
}

//*********************************************************************
- (void)viewDidLoad
{
    [super viewDidLoad];
    
//*******GET SAVED USER DATA************
    NSLog(@"\n self.civil = %@", self.civil);
    self.civil = [self.userDefaults boolForKey:@"civilBool"];
    NSLog(@"\n self.civil = %@", self.civil);

//*******TESTING PURPOSES ONLY**********    
    if(self.civil==TRUE)
    {
        NSLog(@"\nMAIN: self.civil set to true");
    }else if(self.civil==FALSE)
    {
        NSLog(@"\nMAIN: self.civil set to false");
    }
    
//////////////////////////////////////////////////DONE FROM HERE DOWN/////////////////////////////////////////////////
    
//***GETS THE CITY NAME SET BY THE USER****    
    NSLog(@"\nLocation set to: %@", self.cityObject.name);
    
//Get current time    
    time_t now;
    struct tm* timeinfo;
    
//***GETS THE LAT AND LOG FROM THE SELECTED CITY***
    double lat;
    double lon;
    if(self.cityObject.name==NULL)
    {
        //location has NOT been set by the user, using default values...
        lat = 33.87028;
        lon = -117.92444;
    }else{
        //location has been previously set by the user
        //"lat" and "long" are switched, sorry for the confusion
        lat = self.cityObject.coord->longitude;
        lon = self.cityObject.coord->latitude;
    }

    time( &now );
    timeinfo = localtime( &now );

    //printf ( "\nCurrent local time and date: %s", asctime(timeinfo) );
    
    //if civil is enabled...
    if(self.civil==TRUE)
    {
        double sunrise = calculateSunriseOrSunset( timeinfo, lat, lon, CIVIL, YES );
        double sunrise_h = floor(sunrise) - ( sunrise > 12.0 ? 12.0 : 0.0);
        double sunrise_m = round((sunrise - floor(sunrise)) * 60.0 );
    
        double sunset = calculateSunriseOrSunset( timeinfo, lat, lon, CIVIL, NO );
        double sunset_h = floor(sunset) - ( sunset > 12.0 ? 12.0 : 0.0);
        double sunset_m = round((sunset - floor(sunset)) * 60.0 );
    
        self.civilSunriseLabel.text = [NSString stringWithFormat:@"Sunrise: %g:%02g AM", sunrise_h, sunrise_m ];
        self.civilSunsetLabel.text = [NSString stringWithFormat:@"Sunset: %g:%02g PM", sunset_h, sunset_m ];
    }
    if(self.official==TRUE)
    {
        double sunrise = calculateSunriseOrSunset( timeinfo, lat, lon, OFFICIAL, YES );
        double sunrise_h = floor(sunrise) - ( sunrise > 12.0 ? 12.0 : 0.0);
        double sunrise_m = round((sunrise - floor(sunrise)) * 60.0 );
        
        double sunset = calculateSunriseOrSunset( timeinfo, lat, lon, OFFICIAL, NO );
        double sunset_h = floor(sunset) - ( sunset > 12.0 ? 12.0 : 0.0);
        double sunset_m = round((sunset - floor(sunset)) * 60.0 );
        
        self.officialSunriseLabel.text = [NSString stringWithFormat:@"Sunrise: %g:%02g AM", sunrise_h, sunrise_m ];
        self.officialSunsetLabel.text = [NSString stringWithFormat:@"Sunset: %g:%02g PM", sunset_h, sunset_m ];
    }
    if(self.nautical==TRUE)
    {
        double sunrise = calculateSunriseOrSunset( timeinfo, lat, lon, NAUTICAL, YES );
        double sunrise_h = floor(sunrise) - ( sunrise > 12.0 ? 12.0 : 0.0);
        double sunrise_m = round((sunrise - floor(sunrise)) * 60.0 );
        
        double sunset = calculateSunriseOrSunset( timeinfo, lat, lon, NAUTICAL, NO );
        double sunset_h = floor(sunset) - ( sunset > 12.0 ? 12.0 : 0.0);
        double sunset_m = round((sunset - floor(sunset)) * 60.0 );
        
        self.nauticalSunriseLabel.text = [NSString stringWithFormat:@"Sunrise: %g:%02g AM", sunrise_h, sunrise_m ];
        self.nauticalSunsetLabel.text = [NSString stringWithFormat:@"Sunset: %g:%02g PM", sunset_h, sunset_m ];
    }
    if(self.astro==TRUE)
    {
        double sunrise = calculateSunriseOrSunset( timeinfo, lat, lon, ASTRONOMICAL, YES );
        double sunrise_h = floor(sunrise) - ( sunrise > 12.0 ? 12.0 : 0.0);
        double sunrise_m = round((sunrise - floor(sunrise)) * 60.0 );
        
        double sunset = calculateSunriseOrSunset( timeinfo, lat, lon, ASTRONOMICAL, NO );
        double sunset_h = floor(sunset) - ( sunset > 12.0 ? 12.0 : 0.0);
        double sunset_m = round((sunset - floor(sunset)) * 60.0 );
        
        self.astroSunriseLabel.text = [NSString stringWithFormat:@"Sunrise: %g:%02g AM", sunrise_h, sunrise_m ];
        self.astroSunsetLabel.text = [NSString stringWithFormat:@"Sunset: %g:%02g PM", sunset_h, sunset_m ];
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
