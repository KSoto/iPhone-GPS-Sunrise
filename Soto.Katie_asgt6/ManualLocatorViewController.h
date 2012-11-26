//
//  ManualLocatorViewController.h
//  Soto.Katie_asgt6
//
//  Created by Lion User on 16/11/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"
#import "USLocationsDatabase.h"

@interface ManualLocatorViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray* _locations;
    IBOutlet UITableView *tableView;
}

@property (nonatomic, retain) NSArray* locations;
@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end