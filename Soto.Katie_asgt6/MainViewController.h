//
//  MainViewController.h
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


#import <UIKit/UIKit.h>
#import "iOSSunrise.h"
#import "Sunrise.h" //doesn't have anything in it, but I want to include it anyway...
#import "Location.h"
#import "Nova.h" //doesn't have anything in it, but I want to include it anyway...

@interface MainViewController : UIViewController
{
    Location* _cityObject;
    
    IBOutlet UILabel* _civilSunriseLabel;
    IBOutlet UILabel* _officialSunriseLabel;
    IBOutlet UILabel* _nauticalSunriseLabel;
    IBOutlet UILabel* _astroSunriseLabel;
    
    IBOutlet UILabel* _civilSunsetLabel;
    IBOutlet UILabel* _officialSunsetLabel;
    IBOutlet UILabel* _nauticalSunsetLabel;
    IBOutlet UILabel* _astroSunsetLabel;
    
    IBOutlet UIImageView* _civilIcon;
    IBOutlet UIImageView* _officialIcon;
    IBOutlet UIImageView* _nauticalIcon;
    IBOutlet UIImageView* _astroIcon;
    
    BOOL civil;
    BOOL official;
    BOOL nautical;
    BOOL astro;
    
    //http://codeexamples.wordpress.com/2011/02/12/nsuserdefaults-example/
    NSUserDefaults *standardUserDefaults;

}

@property (nonatomic, retain) Location* cityObject;

@property (retain, nonatomic) IBOutlet UILabel* civilSunriseLabel;
@property (retain, nonatomic) IBOutlet UILabel* officialSunriseLabel;
@property (retain, nonatomic) IBOutlet UILabel* nauticalSunriseLabel;
@property (retain, nonatomic) IBOutlet UILabel* astroSunriseLabel;

@property (retain, nonatomic) IBOutlet UILabel* civilSunsetLabel;
@property (retain, nonatomic) IBOutlet UILabel* officialSunsetLabel;
@property (retain, nonatomic) IBOutlet UILabel* nauticalSunsetLabel;
@property (retain, nonatomic) IBOutlet UILabel* astroSunsetLabel;

@property (retain, nonatomic) IBOutlet UIImageView* civilIcon;
@property (retain, nonatomic) IBOutlet UIImageView* officialIcon;
@property (retain, nonatomic) IBOutlet UIImageView* nauticalIcon;
@property (retain, nonatomic) IBOutlet UIImageView* astroIcon;

@property (assign) BOOL civil;
@property (assign) BOOL official;
@property (assign) BOOL nautical;
@property (assign) BOOL astro;

@property (retain, nonatomic) NSUserDefaults *standardUserDefaults;

@end
