//
//  MainViewController.m
//  Soto.Katie_asgt6
//
//  Created by Lion User on 16/11/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    if(self.civil == NULL)
    {
        self.civil = TRUE;
    }
    if(self.official == NULL)
    {
        self.official = TRUE;
    }
    if(self.nautical == NULL)
    {
        self.nautical = TRUE;
    }
    if(self.astro == NULL)
    {
        self.astro = TRUE;
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"\nCity set to: %@", self.cityObject);
    
	// Do any additional setup after loading the view, typically from a nib.
    time_t now;
    struct tm* timeinfo;
    // Fullerton
    double lat = 33.87028;
    double lon = -117.92444;
    time( &now );
    timeinfo = localtime( &now );

    printf ( "\nCurrent local time and date: %s", asctime(timeinfo) );
    
    //if civil is enabled...
    if(civil)
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
    if(official)
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
    if(nautical)
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
    if(astro)
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

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
