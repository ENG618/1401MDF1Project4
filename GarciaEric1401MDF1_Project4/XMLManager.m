//
//  XMLManager.m
//  GarciaEric1401MDF1_Project4
//
//  Created by Eric Garcia on 1/31/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import "XMLManager.h"

@implementation XMLManager
@synthesize cityData;
@synthesize cities;

static XMLManager *_sharedData;

+ (XMLManager*)sharedData
{
    if (_sharedData == nil) {
        _sharedData = [[self alloc] init];
    }
    return _sharedData;
}

- (id)init
{
    if ((self = [super init])) {
        cityData = [[NSMutableData alloc] init];
        cities = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
