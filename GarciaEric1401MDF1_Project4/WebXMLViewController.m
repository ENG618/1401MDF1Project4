//
//  WebXMLViewController.m
//  GarciaEric1401MDF1_Project4
//
//  Created by Eric Garcia on 1/30/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

#import "WebXMLViewController.h"

@interface WebXMLViewController ()
//@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@end

@implementation WebXMLViewController
- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

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
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://api.trulia.com/webservices.php?library=LocationInfo&function=getCitiesInState&state=FL&apikey=q948yz3we6b6nbrneghkww55"];
    if (url) {
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        if (request) {
            myWebView.scalesPageToFit = YES;
            [myWebView loadRequest:request];
        }
    }
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
