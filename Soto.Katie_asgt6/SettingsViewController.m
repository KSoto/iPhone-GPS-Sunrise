//
//  SettingsViewController.m
//  Soto.Katie_asgt6
//
//  Created by Lion User on 16/11/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController

@synthesize civil;
@synthesize official;
@synthesize nautical;
@synthesize astro;

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
