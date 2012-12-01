//
//  SettingsViewController.h
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
//  File Description: This view controller controlls the "settings" page. Here, the user
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

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
{
    IBOutlet UISwitch* civil;
    IBOutlet UISwitch* official;
    IBOutlet UISwitch* nautical;
    IBOutlet UISwitch* astro;
    
    //http://codeexamples.wordpress.com/2011/02/12/nsuserdefaults-example/
    NSUserDefaults * standardUserDefaults;
}

@property (retain, nonatomic) IBOutlet UISwitch* civil;
@property (retain, nonatomic) IBOutlet UISwitch* official;
@property (retain, nonatomic) IBOutlet UISwitch* nautical;
@property (retain, nonatomic) IBOutlet UISwitch* astro;


- (IBAction) toggleEnabledForCivil: (id) sender;  
- (IBAction) toggleEnabledForOfficial: (id) sender;  
- (IBAction) toggleEnabledForNautical: (id) sender; 
- (IBAction) toggleEnabledForAstro: (id) sender;

@property (retain, nonatomic) NSUserDefaults * standardUserDefaults;

@end
