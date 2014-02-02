//
//  DetailViewController.h
//  GarciaEric1401MDF1_Project4
//
//  Created by Eric Garcia on 1/28/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomesViewController.h"
#import "XMLManager.h"

@interface DetailViewController : UIViewController


@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSString *cityId;
@property (nonatomic, strong) NSString *cityLat;
@property (nonatomic, strong) NSString *cityLon;

@end
