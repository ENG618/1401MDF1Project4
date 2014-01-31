//
//  HomesViewController.h
//  GarciaEric1401MDF1_Project4
//
//  Created by Eric Garcia on 1/28/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLManager.h"
#import "CityInfo.h"

@interface HomesViewController : UITableViewController <NSURLConnectionDataDelegate, NSXMLParserDelegate>
{
    NSURLRequest *request;
    NSURL *url;
    NSURLConnection *connection;
    
    //Data recieved from api
    NSMutableData *listingData;
    //Array of objects after parsing
    NSMutableArray *cities;
}

@end
