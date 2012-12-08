//
//  GPSLocatorViewController.h
//  Soto.Katie_asgt6
//
//  Author: Katie Soto
//  Project: iPhone GPS Sunrise / Sunset Application
//  Author's Email: KReneSoto@gmail.com
//  Author's Phone: (714) 213-2228
//  Date Created: 12/2012
//  Class: CSUF CPSC 491T - iPhone Mobile App Development
//  Professor: Michael Shafae
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//  Problem Statement: Write an iPhone application that calculates the Civil, Official,
//      Nautical, and Astronomical Sunrise and Sunset times for a given city. Use the
//      "us_only.sq3" SQLite database to find the latitude and longitude of all cities
//      in united states. Use a table view to display all states / cities for the user
//      to choose their location. Allow the location (and settings) to be saved upon
//      exiting the application.
//  File Description: This controller controls the GPS detection routine.
//
//  Copyright note: The behavior of my GPS routine has been modeled by:
//      Source: App Coda
//      Address: http://www.appcoda.com/how-to-get-current-location-iphone-user/
//      Author: Simon Ng
//      Date Written: 9/2012
//      Copyright: © Copyright 2012 AppCoda · All Rights Reserved
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface GPSLocatorViewController : UIViewController <CLLocationManagerDelegate>
{
    //http://www.appcoda.com/how-to-get-current-location-iphone-user/
    IBOutlet UILabel* _latLabel;
    IBOutlet UILabel* _longLabel;
    IBOutlet UILabel* _successLabel;
    IBOutlet UILabel* _addressLabel;
    
    //http://codeexamples.wordpress.com/2011/02/12/nsuserdefaults-example/
    NSUserDefaults * standardUserDefaults;
}

@property (retain, nonatomic) IBOutlet UILabel *latLabel;
@property (retain, nonatomic) IBOutlet UILabel *longLabel;
@property (retain, nonatomic) IBOutlet UILabel *successLabel;
@property (retain, nonatomic) IBOutlet UILabel *addressLabel;
@property (nonatomic, retain) NSUserDefaults * standardUserDefaults;

@end
