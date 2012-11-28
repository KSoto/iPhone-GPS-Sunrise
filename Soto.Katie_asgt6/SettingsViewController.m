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

- (void)viewDidLoad
{
    //each setting (civil, nautical, etc.) defaults to TRUE,
    //so it's ON by DEFAULT
    if((self.myInterface.civil == NULL)||(self.myInterface.civil == nil))
    {
        self.civil.on = TRUE;
    }else if(self.myInterface.civil == FALSE)
    {
        self.civil.on = FALSE;
    }else if(self.myInterface.civil == TRUE)
    {
        self.civil.on = TRUE;
    }
    
    //TODO add the rest
}

- (IBAction) toggleEnabledForCivil: (id) sender
{
    if (civil.on)
    {
        self.myInterface.civil = TRUE;
    }else if(!civil.on)
    {
        self.myInterface.civil = FALSE;
    }
}

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
