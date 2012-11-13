//
//  iOSSunrise.m
//  Soto.Katie_asgt6
//
//  Created by Lion User on 13/11/2012.
//  Copyright (c) 2012 Katie Soto. All rights reserved.
//

#import "iOSSunrise.h"

/*
 * Calc civil sunrise and sunset
 *
 * $Id: MacSunrise.m 3876 2012-10-31 21:46:19Z mshafae $
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

double degrees2radians( double theta ){
    return( theta * (M_PI/180.0) );
}

double radians2degrees( double theta ){
    return( theta * (180.0/M_PI) );
}

void degrees2dms( double theta, dms_t* dms ){
    double min;
    double deg = floor(theta);
    dms->deg = deg;
    min = floor((theta - deg) * 60.0);
    dms->min = min;
    dms->sec = (theta - deg - (min/60.0)) * 3600.0;
}

double dms2degrees( dms_t* dms ){
    double theta = dms->deg;
    theta += dms->min / 60.0;
    theta += dms->sec / 3600.0;
    return( theta );
}

double sinDeg( double x ){
    return( sin( (x*(M_PI/180.0)) ) );
}

double cosDeg( double x ){
    return( cos( (x*(M_PI/180.0)) ) );
}

double tanDeg( double x ){
    return( tan( (x*(M_PI/180.0)) ) );
}

double asinDeg( double x ){
    return( asin( x ) * (180.0/M_PI) );
}

double acosDeg( double x ){
    return( acos( x ) * (180.0/M_PI) );
}

double atanDeg( double x ){
    return( atan( x ) * (180.0/M_PI) );
}


double lookupZenith( twilight_t twilight ){
    double rv = 0.0;
    switch( twilight ){
        case OFFICIAL:
            // 90 degrees 50 minutes (90.83333)
            rv = 90.0 + (50.0/60.0);
            break;
        case CIVIL:
            rv = 96.0;
            break;
        case NAUTICAL:
            rv = 102.0;
            break;
        case ASTRONOMICAL:
            rv = 108.0;
            break;
        default:
            fprintf( stderr, "shouldn't be here.\n" );
            exit(1);
            break;
    }
    return(rv);
}

// set twilight to Official for actual sunrise/sunset time
// set twilight to anything else to find twilight time for sunrise or sunset
double calculateSunriseOrSunset( struct tm* date, double latitude, double longitude, twilight_t twilight, BOOL isRising ){
    double month = (double)date->tm_mon + 1;
    double day = (double)date->tm_mday;
    double year = (double)date->tm_year + 1900;
    double zenith = lookupZenith( twilight );
    
    // 1. first calculate the day of the year
    double n1 = floor( 275.0 * month / 9.0 );
    double n2 = floor( (month + 9.0) / 12.0 );
    double n3 = (1.0 + floor((year - 4.0 * floor(year / 4.0) + 2.0) / 3.0));
    double dayOfTheYear = n1 - (n2 * n3) + day - 30.0;
    
    // 2. convert the longitude to hour value and calculate an approximate time
    double lngHour = longitude / 15.0;
    double t;
    if( isRising ){
        // time sun is rising
        t = dayOfTheYear + ((6.0 - lngHour) / 24.0);
    }else{
        // time sun is setting
        t = dayOfTheYear + ((18.0 - lngHour) / 24.0);
    }
    
    // 3. calculate the Sun's mean anomaly
    double M = (0.9856 * t) - 3.289;
    
    // 4. calculate the Sun's YES longitude
    double L = M + (1.916 * sinDeg(M)) + (0.020 * sinDeg(2.0 * M)) + 282.634;
    // Wrap L into valid range
    while (L >= 360.0) L -= 360.0;
    while (L <  0.0)   L += 360.0;
    
    // 5a. calculate the Sun's right ascension
    double RA = atanDeg(0.91764 * tanDeg(L));
    // Wrap RA into valid range
    while (RA >= 360) RA -= 360.0;
    while (RA <  0)   RA += 360.0;
    
    // 5b. right ascension value needs to be in the same quadrant as L
    double Lquadrant  = (floor( L/90.0)) * 90.0;
    double RAquadrant = (floor(RA/90.0)) * 90.0;
    RA = RA + (Lquadrant - RAquadrant);
    
    // 5c. right ascension value needs to be converted into hours
    RA = RA / 15.0;
    
    // 6. calculate the Sun's declination
    double sinDec = 0.39782 * sinDeg(L);
    double cosDec = cosDeg(asinDeg(sinDec));
    
    // 7a. calculate the Sun's local hour angle
    double cosH = (cosDeg(zenith) - (sinDec * sinDeg(latitude))) / (cosDec * cosDeg(latitude));
    if( isRising ){
        if (cosH > 1){
            fprintf( stderr, "The sun never rises on this location (on the specified date)\n" );
            exit(1);
        }
    }else{
        if (cosH < -1){
            fprintf( stderr, "The sun never sets on this location (on the specified date)\n" );
            exit(1);
        }
    }
    
	// 7b. finish calculating H and convert into hours
    double H;
	if( isRising ){
        // sun is rising
        H = 360.0 - acosDeg( cosH );
	}else{
        // sun is setting
        H = acosDeg( cosH );
	}
    H = H / 15.0;
    
    // 8. calculate local mean time of rising/setting
    double T = H + RA - (0.06571 * t) - 6.622;
    
    // 9. adjust back to UTC
    double UT = T - lngHour;
    // Wrap UT into valid range
    while (UT >= 24.0) UT -= 24.0;
    while (UT < 0.0)  UT += 24.0;
    //printf( "UT: %g\n", UT );
    // 10. convert UT value to local time zone of latitude/longitude
    UT = UT + (date->tm_gmtoff/3600.0);
    while (UT >= 24.0) UT -= 24.0;
    while (UT < 0.0)  UT += 24.0;
    double h = floor(UT) - ( UT > 12.0 ? 12.0 : 0.0);
    double m = round((UT - floor(UT)) * 60.0 );
    
    isRising ? printf( "Sunrise " ) : printf( "Sunset " );
    printf( "%g:%02g", h, m );
    UT > 12 ? printf( " PM\n") : printf( " AM\n" );
    return(UT);
}

/*
 int main( int argc, char **argv ){
 time_t now;
 struct tm* timeinfo;
 // Fullerton
 double lat = 33.87028;
 double lon = -117.92444;
 time( &now );
 timeinfo = localtime( &now );
 BOOL flag = NO;
 if( flag ){
 // In case you want to check the sunrise and sunset times for
 // 7/25/1990 set flag to YES.
 timeinfo->tm_mon = 6;
 timeinfo->tm_mday = 25;
 timeinfo->tm_year = 90;
 }
 printf ( "Current local time and date: %s", asctime(timeinfo) );
 
 printf( "Sunrise & sunset with official zenith\n" );
 double x = calculateSunriseOrSunset( timeinfo, lat, lon, OFFICIAL, YES );
 x = calculateSunriseOrSunset( timeinfo, lat, lon, OFFICIAL, NO );
 
 printf( "Sunrise & sunset with civil zenith\n" );
 x = calculateSunriseOrSunset( timeinfo, lat, lon, CIVIL, YES );
 x = calculateSunriseOrSunset( timeinfo, lat, lon, CIVIL, NO );
 
 printf( "Sunrise & sunset with nautical zenith\n" );
 x = calculateSunriseOrSunset( timeinfo, lat, lon, NAUTICAL, YES );
 x = calculateSunriseOrSunset( timeinfo, lat, lon, NAUTICAL, NO );
 
 printf( "Sunrise & sunset with astronomical zenith\n" );
 x = calculateSunriseOrSunset( timeinfo, lat, lon, ASTRONOMICAL, YES );
 x = calculateSunriseOrSunset( timeinfo, lat, lon, ASTRONOMICAL, NO );
 
 
 //printf( "%g\n" , x );
 return(0);
 }
 */