//
//  CLLocation (Strings).h
//  Soto.Katie_asgt6
//
//  Created by cpsc491t on 12/3/12.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>


@interface CLLocation (Strings)

- (NSString *)localizedCoordinateString;

- (NSString *)localizedAltitudeString;

- (NSString *)localizedHorizontalAccuracyString;

- (NSString *)localizedVerticalAccuracyString;

- (NSString *)localizedCourseString;

- (NSString *)localizedSpeedString;

@end