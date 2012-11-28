//
//  MainViewController.h
//  Soto.Katie_asgt6
//
//  Created by Lion User on 16/11/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iOSSunrise.h"
#import "Sunrise.h" //doesn't have anything in it, but I want to include it anyway...
#import "Location.h"

//*****CURRENT PROBLEM: the booleans in the setting view controller are being saved, but
//when I open MainViewController, they get reinitialized back to nothing.

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
    
    BOOL civil;
    BOOL official;
    BOOL nautical;
    BOOL astro;

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

@property (assign) BOOL civil;
@property (assign) BOOL official;
@property (assign) BOOL nautical;
@property (assign) BOOL astro;

@end
