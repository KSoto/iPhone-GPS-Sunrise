//
//  iOSSunrise.h
//  Soto.Katie_asgt6
//
//  Created by Lion User on 13/11/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import <Foundation/Foundation.h>

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

/*
 * Calc civil sunrise and sunset
 *
 * $Id: MacSunrise.h 3876 2012-10-31 21:46:19Z mshafae $
 *
 * Based on Ed Williams' implmentation.
 * See <http://williams.best.vwh.net/sunrise_sunset_example.htm>
 *
 * Source:
 * 	Almanac for Computers, 1990
 * 	published by Nautical Almanac Office
 * 	United States Naval Observatory
 * 	Washington, DC 20392
 *
 * Inputs:
 * 	day, month, year:      date of sunrise/sunset
 * 	latitude, longitude:   location for sunrise/sunset
 * 	zenith:                Sun's zenith for sunrise/sunset
 * 	  offical      = 90 degrees 50'
 * 	  civil        = 96 degrees
 * 	  nautical     = 102 degrees
 * 	  astronomical = 108 degrees
 *
 * NOTE: longitude is positive for East and negative for West
 *
 * Worked example (from book):
 * 	June 25, 1990:	25, 6, 1990
 * 	Wayne, NJ:      40.9, -74.3
 * 	Office zenith:  90 50' cos(zenith) = -0.01454
 *
 * Fullerton, CA 33°52′48″N 117°55′43″W
 * (http://en.wikipedia.org/wiki/Fullerton,_California)
 *
 */

typedef struct dms_t{
    double deg;
    double min;
    double sec;
}dms_t;

// See <http://en.wikipedia.org/wiki/Twilight> for a short description
// of what each of these mean. Generally, you will want to calculate official
// or civil twilight.
typedef enum { OFFICIAL = 0, CIVIL, NAUTICAL, ASTRONOMICAL } twilight_t;

double degrees2radians( double theta );
double radians2degrees( double theta );
void degrees2dms( double theta, dms_t* dms );
double dms2degrees( dms_t* dms );
double sinDeg( double x );
double cosDeg( double x );
double tanDeg( double x );
double asinDeg( double x );
double acosDeg( double x );
double atanDeg( double x );
double lookupZenith( twilight_t twilight );
double calculateSunriseOrSunset( struct tm* date, double latitude, double longitude, twilight_t twilight, BOOL isRising );

