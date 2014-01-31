//
//  RawXMLViewController.h
//  GarciaEric1401MDF1_Project4
//
//  Created by Eric Garcia on 1/28/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RawXMLViewController : UIViewController
{
    IBOutlet UITextView *myTextView;
    //Data recieved from api
    NSMutableData *listingData;
}

@end
