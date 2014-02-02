//
//  CityInfo.m
//  GarciaEric1401MDF1_Project4
//
//  Created by Eric Garcia on 1/31/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import "CityInfo.h"

@implementation CityInfo
@synthesize cityID;
@synthesize cityName;
@synthesize lat;
@synthesize lon;

- (id)initWithName:(NSString*)name cityId:(NSString*)cityId cityLat:(NSString*)latitude cityLon:(NSString*)longitude
{
    if ((self = [super init])){
        cityID = cityId;
        cityName = name;
        lat = latitude;
        lon = longitude;
    }
    return self;
}

@end
