//
//  RawXMLViewController.m
//  GarciaEric1401MDF1_Project4
//
//  Created by Eric Garcia on 1/28/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import "RawXMLViewController.h"

@interface RawXMLViewController ()

@end

@implementation RawXMLViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    //Create instance of XMLManager
    XMLManager *manager = [XMLManager sharedData];
    //Checking validity
    if (manager) {
        //Creating instance of MutableData
        NSMutableData *cityData = [manager cityData];
        //Checking validity
        if (cityData) {
            //Casting XML data to a string
            NSString *requestString = [[NSString alloc] initWithData:cityData encoding:NSASCIIStringEncoding];
            //Checking validity
            if (requestString) {
                myTextView.text = requestString;
                //Write XML string to console
                NSLog(@"The XML data is %@", requestString);
            }
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
