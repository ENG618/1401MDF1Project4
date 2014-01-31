//
//  XMLManager.h
//  GarciaEric1401MDF1_Project4
//
//  Created by Eric Garcia on 1/31/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLManager : NSObject
{
    NSMutableData *cityData;
}

+ (XMLManager*)sharedData;

@property (nonatomic, strong)NSMutableData *cityData;

@end
