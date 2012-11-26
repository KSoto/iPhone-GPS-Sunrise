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
    if(self.myInterface.civil == NULL)
    {
        self.civil.on = TRUE;
    }else if(self.myInterface.civil == FALSE)
    {
        self.civil.on = FALSE;
    }else if(self.myInterface.civil == TRUE)
    {
        self.civil.on = TRUE;
    }
}

- (IBAction) toggleEnabledForCivil: (id) sender
{
    if (civil.on)
    {
        self.myInterface.civil = TRUE;
        NSLog(@"\n setting civil to TRUE");
    }else if(!civil.on)
    {
        self.myInterface.civil = FALSE;
        NSLog(@"\n setting civil to FALSE");
    }
}

- (IBAction) toggleEnabledForOfficial: (id) sender
{
    
}

- (IBAction) toggleEnabledForNautical: (id) sender
{
    
}

- (IBAction) toggleEnabledForAstro: (id) sender
{
    
}

@end
