//
//  SettingsViewController.h
//  Soto.Katie_asgt6
//
//  Created by Lion User on 16/11/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
{
    IBOutlet UISwitch* civil;
    IBOutlet UISwitch* official;
    IBOutlet UISwitch* nautical;
    IBOutlet UISwitch* astro;
}

@property (retain, nonatomic) IBOutlet UISwitch* civil;
@property (retain, nonatomic) IBOutlet UISwitch* official;
@property (retain, nonatomic) IBOutlet UISwitch* nautical;
@property (retain, nonatomic) IBOutlet UISwitch* astro;

@end
