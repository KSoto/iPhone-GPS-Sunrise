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

@synthesize myInterface = _myInterface;

//***********************************************
//if a null pointer, we need to initalize it
-(MainViewController*) myInterface;
{
    if(_myInterface == nil)
    {
        _myInterface = [[MainViewController alloc] init];
    }
    return _myInterface;
}

//***********************************************
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //if the setting (from "MainViewController") is set to FALSE, 
    //then set the switch to be FALSE to match
    if(self.myInterface.civil == FALSE)
    {
        self.civil.on = FALSE;
    }else if(self.myInterface.civil == TRUE)
    {
        self.civil.on = TRUE;
    }
    
    //TODO add the rest
}

//***********************************************
- (IBAction) toggleEnabledForCivil: (id) sender
{
    if (civil.on==TRUE)
    {
        //tell MainViewController that the user has selected it to be TRUE
        self.myInterface.civil = TRUE;
        
        //set/save the UserDefaults
        [self.myInterface.userDefaults setBool:TRUE forKey:@"civilBool"];
        [self.myInterface.userDefaults synchronize];
        
    }else if(civil.on==FALSE)
    {
        //tell MainViewController that the user has selected it to be FALSE
        self.myInterface.civil = FALSE;
        
        //set/save the UserDefaults
        [self.myInterface.userDefaults setBool:FALSE forKey:@"civilBool"];
        [self.myInterface.userDefaults synchronize];
        
    }
}

///////////////////////////////////////////////////////////////////////////////////////
//TODO finish the rest
- (IBAction) toggleEnabledForOfficial: (id) sender
{
    if (official.on)
    {
        self.myInterface.official = TRUE;
    }else if(!civil.on)
    {
        self.myInterface.official = FALSE;
    }
}

- (IBAction) toggleEnabledForNautical: (id) sender
{
    if (nautical.on)
    {
        self.myInterface.nautical = TRUE;
    }else if(!nautical.on)
    {
        self.myInterface.nautical = FALSE;
    }
}

- (IBAction) toggleEnabledForAstro: (id) sender
{
    if (astro.on)
    {
        self.myInterface.astro = TRUE;
    }else if(!astro.on)
    {
        self.myInterface.astro = FALSE;
    }
}

@end
