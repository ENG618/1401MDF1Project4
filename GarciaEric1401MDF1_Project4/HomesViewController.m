//
//  HomesViewController.m
//  GarciaEric1401MDF1_Project4
//
//  Created by Eric Garcia on 1/28/14.
//  Copyright (c) 2014 Full Sail. All rights reserved.
//

/*
 API Key:
 q948yz3we6b6nbrneghkww55
 Static url:
 http://api.trulia.com/webservices.php?library=LocationInfo&function=getCitiesInState&state=FL&apikey=q948yz3we6b6nbrneghkww55
 */

#import "HomesViewController.h"

@interface HomesViewController ()

@end

@implementation HomesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Creating Array
    cities = [[NSMutableArray alloc] init];
    
    
    
    //Create URL
    url = [[NSURL alloc] initWithString:@"http://api.trulia.com/webservices.php?library=LocationInfo&function=getCitiesInState&state=FL&apikey=q948yz3we6b6nbrneghkww55"];
    
    //Request data from page
    request = [[NSURLRequest alloc] initWithURL:url];
    if (request != nil) {
        
        //Reciving responce from server
        connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        //Create mutableData object
        listingData = [NSMutableData data];
    }
    
    //Creating the parser
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:listingData];
    if (parser) {
        
        [parser setDelegate:self];
        [parser parse];
    }
    
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (data != nil) {
        
        // Append data to existing listingData
        [listingData appendData:data];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //Obtaining documents directory›
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *docsDirectory = [paths objectAtIndex:0];
    if (docsDirectory != nil) {
        NSString *fullpath = [[NSString alloc] initWithFormat:@"%@/%@", docsDirectory, @"cities.xml"];
        if (fullpath != nil) {
            [listingData writeToFile:fullpath atomically:YES];
        }
    }
    
    //Casting XML data to a string
    NSString *requestString = [[NSString alloc] initWithData:listingData encoding:NSASCIIStringEncoding];
    if (requestString != nil) {
        //Write XML string to console
        NSLog(@"The XML data is %@", requestString);
    }
    
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [cities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

@end
