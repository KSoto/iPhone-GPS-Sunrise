//
//  CLLocation (Strings).m
//  Soto.Katie_asgt6
//
//  Created by cpsc491t on 12/3/12.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

//***********FROM http://gamble.ecs.fullerton.edu/teaching/fall12/cs491t/sample-code/corelocation.m/view **************//

#import "CLLocation (Strings).h"

@implementation CLLocation (Strings)
- (NSString *)localizedCoordinateString {
    if (self.horizontalAccuracy < 0) {
        return NSLocalizedString(@"DataUnavailable", @"DataUnavailable");
    }
    NSString *latString = (self.coordinate.latitude < 0) ? NSLocalizedString(@"South", @"South") : NSLocalizedString(@"North", @"North");
    NSString *lonString = (self.coordinate.longitude < 0) ? NSLocalizedString(@"West", @"West") : NSLocalizedString(@"East", @"East");
    return [NSString stringWithFormat:NSLocalizedString(@"LatLongFormat", @"LatLongFormat"), fabs(self.coordinate.latitude), latString, fabs(self.coordinate.longitude), lonString];
}
- (NSString *)localizedAltitudeString {
    if (self.verticalAccuracy < 0) {
        return NSLocalizedString(@"DataUnavailable", @"DataUnavailable");
    }
    NSString *seaLevelString = (self.altitude < 0) ? NSLocalizedString(@"BelowSeaLevel", @"BelowSeaLevel") : NSLocalizedString(@"AboveSeaLevel", @"AboveSeaLevel");
    return [NSString stringWithFormat:NSLocalizedString(@"AltitudeFormat", @"AltitudeFormat"), fabs(self.altitude), seaLevelString];
}
- (NSString *)localizedHorizontalAccuracyString {
    if (self.horizontalAccuracy < 0) {
        return NSLocalizedString(@"DataUnavailable", @"DataUnavailable");
    }
    return [NSString stringWithFormat:NSLocalizedString(@"AccuracyFormat", @"AccuracyFormat"), self.horizontalAccuracy];
}
- (NSString *)localizedVerticalAccuracyString {
    if (self.verticalAccuracy < 0) {
        return NSLocalizedString(@"DataUnavailable", @"DataUnavailable");
    }
    return [NSString stringWithFormat:NSLocalizedString(@"AccuracyFormat", @"AccuracyFormat"), self.verticalAccuracy];
}
@end
