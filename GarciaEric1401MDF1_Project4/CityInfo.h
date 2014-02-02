//
//  CityInfo.h
//  GarciaEric1401MDF1_Project4
//
//  Created by Eric Garcia on 1/31/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityInfo : NSObject
{
    NSString *cityName;
    NSString *cityID;
    NSString *lat;
    NSString *lon;
}

- (id)initWithName:(NSString*)name cityId:(NSString*)cityId cityLat:(NSString*)latitude cityLon:(NSString*)longitude;

@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSString *cityID;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *lon;

@end
