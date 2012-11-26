//
//  ManualLocatorCITYViewController.h
//  Soto.Katie_asgt6
//
//  Created by Guest User on 11/26/12.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"
#import "USLocationsDatabase.h"
#import "MainViewController.h"
#import "Location.h"

@interface ManualLocatorCITYViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray* _cities;
    IBOutlet UITableView *tableView;
    Location* _selectedRegion;
    NSString* _regionString;
}

@property (nonatomic, retain) NSArray* cities;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) Location* selectedRegion;
@property (nonatomic, retain) NSString* regionString;

@end
