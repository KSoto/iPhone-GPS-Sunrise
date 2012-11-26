//
//  SettingsViewController.h
//  Soto.Katie_asgt6
//
//  Created by Lion User on 16/11/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface SettingsViewController : UIViewController
{
    IBOutlet UISwitch* civil;
    IBOutlet UISwitch* official;
    IBOutlet UISwitch* nautical;
    IBOutlet UISwitch* astro;
    MainViewController* _myInterface;
}

@property (retain, nonatomic) MainViewController* myInterface;
@property (retain, nonatomic) IBOutlet UISwitch* civil;
@property (retain, nonatomic) IBOutlet UISwitch* official;
@property (retain, nonatomic) IBOutlet UISwitch* nautical;
@property (retain, nonatomic) IBOutlet UISwitch* astro;

- (IBAction) toggleEnabledForCivil: (id) sender;  
- (IBAction) toggleEnabledForOfficial: (id) sender;  
- (IBAction) toggleEnabledForNautical: (id) sender; 
- (IBAction) toggleEnabledForAstro: (id) sender; 

@end
