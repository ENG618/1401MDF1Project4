//
//  HomesViewController.h
//  GarciaEric1401MDF1_Project4
//
//  Created by Eric Garcia on 1/28/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "CityInfo.h"
#import "XMLManager.h"

@interface HomesViewController : UITableViewController <NSURLConnectionDataDelegate, NSXMLParserDelegate>
{
    NSURLRequest *request;
    NSURL *url;
    NSURLConnection *connection;
    
    NSMutableString *currentTagStr;
    NSString *tempID;
    NSString *tempName;
    NSString *tempLon;
    NSString *tempLat;
}

@end
