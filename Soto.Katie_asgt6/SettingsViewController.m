//
//  SettingsViewController.m
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
//  File Description:This view controller controlls the "settings" page. Here, the user
//      can select their location, and also turn the different sunrise and sunset types
//      on or off. When a switch is set, it saves the preference in an NSUserDefaults, a
//      dictionary that gets called and loaded in MainViewController.
//
//  Copyright note: The behavior of NSUserDefaults *standardUserDefaults has been
//          modeled after:
//      Source: Code by Example
//      Address: http://codeexamples.wordpress.com/2011/02/12/nsuserdefaults-example/
//      Author: Unknown
//      Date Retrieved: 2/2011
//      Copyright: unknown, assuming All Rights Reserved
//

#import "SettingsViewController.h"

@implementation SettingsViewController

@synthesize civil;
@synthesize official;
@synthesize nautical;
@synthesize astro;
@synthesize standardUserDefaults;

//***********************************************
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    //set the switch status (on/off) to whatever the user set it to be:
    self.civil.on = [self.standardUserDefaults boolForKey:@"civilBool"];
    self.official.on = [self.standardUserDefaults boolForKey:@"officialBool"];
    self.nautical.on = [self.standardUserDefaults boolForKey:@"nauticalBool"];
    self.astro.on = [self.standardUserDefaults boolForKey:@"astroBool"];
}

//***********************************************
- (IBAction) toggleEnabledForCivil: (id) sender
{
    if (civil.on==TRUE)
    {
        //set/save the UserDefaults
        [self.standardUserDefaults setBool:TRUE forKey:@"civilBool"];
        [self.standardUserDefaults synchronize];
    }else if(civil.on==FALSE)
    {
        //set/save the UserDefaults
        [self.standardUserDefaults setBool:FALSE forKey:@"civilBool"];
        [self.standardUserDefaults synchronize];
    }
}

- (IBAction) toggleEnabledForOfficial: (id) sender
{
    if (official.on==TRUE)
    {
        //set/save the UserDefaults
        [self.standardUserDefaults setBool:TRUE forKey:@"officialBool"];
        [self.standardUserDefaults synchronize];
    }else if(official.on==FALSE)
    {
        //set/save the UserDefaults
        [self.standardUserDefaults setBool:FALSE forKey:@"officialBool"];
        [self.standardUserDefaults synchronize];
    }
}

- (IBAction) toggleEnabledForNautical: (id) sender
{
    if (nautical.on==TRUE)
    {
        //set/save the UserDefaults
        [self.standardUserDefaults setBool:TRUE forKey:@"nauticalBool"];
        [self.standardUserDefaults synchronize];
    }else if(nautical.on==FALSE)
    {
        //set/save the UserDefaults
        [self.standardUserDefaults setBool:FALSE forKey:@"nauticalBool"];
        [self.standardUserDefaults synchronize];
    }
}

- (IBAction) toggleEnabledForAstro: (id) sender
{
    if (astro.on==TRUE)
    {
        //set/save the UserDefaults
        [self.standardUserDefaults setBool:TRUE forKey:@"astroBool"];
        [self.standardUserDefaults synchronize];
    }else if(astro.on==FALSE)
    {
        //set/save the UserDefaults
        [self.standardUserDefaults setBool:FALSE forKey:@"astroBool"];
        [self.standardUserDefaults synchronize];
    }
}

@end
