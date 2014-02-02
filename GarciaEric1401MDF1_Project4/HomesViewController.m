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
    
    //Create URL
    url = [[NSURL alloc] initWithString:@"http://api.trulia.com/webservices.php?library=LocationInfo&function=getCitiesInState&state=FL&apikey=q948yz3we6b6nbrneghkww55"];
    
    //Request data from page
    request = [[NSURLRequest alloc] initWithURL:url];
    if (request != nil) {
        
        //Reciving responce from server
        connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (data) {
        //Create instance of XMLManager
        XMLManager *manager = [XMLManager sharedData];
        
        //Check Validity
        if (manager){
            //Create MutableData object or a reference to it
            NSMutableData *cityData = [manager cityData];
            //Check Validity
            if (cityData) {
                //Append incoming data to MutableData object
                [cityData appendData:data];
            }
        }
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    /*
     //This code is not fuctioning proporlly and does not save to file
     //Save to file is not nessisary for project4
     
     //Obtaining documents directory›
     NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
     NSString *docsDirectory = [paths objectAtIndex:0];
     if (docsDirectory != nil) {
     NSString *fullpath = [[NSString alloc] initWithFormat:@"%@/%@", docsDirectory, @"cities.xml"];
     if (fullpath != nil) {
     [listingData writeToFile:fullpath atomically:YES];
     }
     }
     */
    
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
                //Write XML string to console
                NSLog(@"The XML data is %@", requestString);
            }
            //Creating the parser
            NSXMLParser *parser = [[NSXMLParser alloc] initWithData:cityData];
            if (parser) {
                
                [parser setDelegate:self];
                [parser parse];
            }
        }
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    currentTagStr = (NSMutableString*) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSLog(@"found Characters...parsing string %@", currentTagStr);
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    //Chreating instance of XMLManager
    XMLManager *manager = [XMLManager sharedData];
    //Checking validity
    if (manager) {
        if ([elementName isEqualToString:@"cityId"]) {
            NSLog(@"The cities id is %@", currentTagStr);
            tempID = currentTagStr;
            return;
        }
        else if ([elementName isEqualToString:@"name"]) {
            NSLog(@"The city name is %@", currentTagStr);
            tempName = currentTagStr;
            return;
        }
        else if ([elementName isEqualToString:@"longitude"]) {
            NSLog(@"The longitude is %@", currentTagStr);
            tempLon = currentTagStr;
            return;
        }
        else if ([elementName isEqualToString:@"latitude"]) {
            NSLog(@"The Latitude is %@", currentTagStr);
            tempLat = currentTagStr;
            return;
        }
        else if ([elementName isEqualToString:@"city"]){
        //Create custum object
        CityInfo *city = [[CityInfo alloc] initWithName:tempName cityId:tempID cityLat:tempLat cityLon:tempLon];
        [manager.cities addObject:city];
            [self.tableView reloadData];
        }
    }
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
    
    int rows = 0;
    //Create instance of XMLManager
    XMLManager *manager = [XMLManager sharedData];
    // Check validity
    if (manager) {
        NSMutableArray *cities = manager.cities;
        rows = cities.count;
    }
    // Return the number of rows in the section.
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    //Create instance of singleton
    XMLManager *manager = [XMLManager sharedData];
    //Check validity
    if (manager) {
        NSMutableArray *cities = [manager cities];
        if (cities) {
            CityInfo *current = [cities objectAtIndex:indexPath.row];
            cell.textLabel.text = [current cityName];
            cell.detailTextLabel.text = [current cityID];
        }
    }
    
    
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
