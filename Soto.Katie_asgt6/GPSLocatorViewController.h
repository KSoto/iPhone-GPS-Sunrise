//
//  GPSLocatorViewController.h
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
//  File Description: This controller WILL control the GPS detection routine, but
//      has not yet been implemented.
//

#import <UIKit/UIKit.h>

@interface GPSLocatorViewController : UIViewController
{
    IBOutlet UILabel* _coordLabel;
    
    //http://codeexamples.wordpress.com/2011/02/12/nsuserdefaults-example/
    NSUserDefaults * standardUserDefaults;
}

@property (retain, nonatomic) IBOutlet UILabel* coordLabel;
@property (nonatomic, retain) NSUserDefaults * standardUserDefaults;

@end
