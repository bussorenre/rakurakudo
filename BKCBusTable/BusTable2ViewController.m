//
//  BusTable2ViewController.m
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/24.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import "BusTable2ViewController.h"

//UIColor定義 RGB(,,);
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]



@interface BusTable2ViewController ()

@end

@implementation BusTable2ViewController
@synthesize dateController;
@synthesize arr;
@synthesize arrForColor;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        dateController = [[DateController alloc]init];
        arr = [[NSMutableArray alloc]initWithArray:[self.dateController returnArrToBusTable:2]];
        arrForColor = [[NSArray alloc]initWithArray:self.dateController.arrForColor];
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //dateController = [[DateController alloc]init];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    int num;
    num = [self.arr count];
    return num;
}
- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch([[self.arrForColor objectAtIndex:indexPath.row] intValue]){
        case 0://笠山
            cell.backgroundColor = RGB(99, 184, 255);
            break;
        case 1://直行
            cell.backgroundColor = RGB(99, 184, 255);
            break;
        case 2://かがやき
            cell.backgroundColor = RGB(99, 184, 255);
            break;
        case 3://パナ
            cell.backgroundColor = RGB(99, 184, 255);
            break;
        case 4://草津
            cell.backgroundColor = RGB(154, 205, 50);
            break;
        case 5://瀬田
            cell.backgroundColor = RGB(205, 205, 0);
            break;
        case 6://衣笠
            cell.backgroundColor = RGB(159,121,238);
            break;
        case 7://中書島
            cell.backgroundColor = RGB(238, 59, 59);
            break;
        default:
            NSLog(@"色の判定ができません");
            break;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"in tableView %@",[self.arr objectAtIndex:0]);
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //新規セル作成
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    for (tableView in [cell.contentView subviews]) {
        [tableView removeFromSuperview];
    }
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(2,2,300,30)];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.arr objectAtIndex:indexPath.row]];
    
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end