//
//  AddCellsBetweenCellsController.m
//  AddCellsBetweenCellsController
//
//  Created by sato daisuke on 13/05/13.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import "AddCellsBetweenCellsController.h"

//UIColor定義 RGB(,,);
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


@interface AddCellsBetweenCellsController ()
@property(nonatomic,retain,readwrite)NSMutableArray *dataSource;


@end

@implementation AddCellsBetweenCellsController
{
@private
    NSMutableArray *_dataSource;
    BOOL isTouched;
    NSMutableArray *additionalData1,*additionalData2,*additionalData3; //will be added
    int tmp;
    NSMutableArray *nameArr;
}
@synthesize table;
@synthesize dateController;
@synthesize dataSource = _dataSource;

-(id)init{
    NSLog(@"in init");
    //dataController init
    self.dateController = [[DateController alloc]init];
    //nameArr init
    nameArr = [[NSMutableArray alloc]initWithObjects:@"南草津→立命館大学(笠山経由)",@"南草津→立命館大学(直行)",@"南草津→立命館大学(かがやき通り経由)",@"南草津→立命館大学(パナ経由)",@"草津→立命館大学",@"瀬田→立命館大学",@"衣笠→立命館大学",@"中書島→立命館大学", nil];
    return self;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //deselect cell
    [self.table deselectRowAtIndexPath:[self.table indexPathForSelectedRow] animated:YES];
    //upadte dataSource
    [self updateDataSource];
    //update visible cells
    [self updateVisibleCells];
}
-(void)updateDataSource{
    
    //dataSource
    if(self.dataSource != nil){
        self.dataSource = nil;
    }
    self.dataSource = [[NSMutableArray alloc]init];
    
    //additionalData1 For subtitle
    if(additionalData1 != nil){
        additionalData1 = nil;
    }
    additionalData1 = [[NSMutableArray alloc]init];
    
    //additionalData2 For subtitle
    if(additionalData2 != nil){
        additionalData2 = nil;
    }
    additionalData2 = [[NSMutableArray alloc]init];
    
    for(int i = 1;i<+9;i++){
        //dataSource
        [self.dataSource addObject:[NSString stringWithFormat:@"%d%@",[self.dateController returnMin:i],self.dateController.remStr1]];
        //additionalData1
        [additionalData1 addObject:[NSString stringWithFormat:@"%d%@",[self.dateController returnMin:i+1],self.dateController.remStr2]];
        //additionalData2
        [additionalData2 addObject:[NSString stringWithFormat:@"%d%@",[self.dateController returnMin:1+2],self.dateController.remStr1]];
        
    }
    //NSString *str = [NSString stringWithFormat:@"%d%@",[self.dateController returnMin:2],self.dateController.minStr];
    //self.dataSource = [NSMutableArray arrayWithObjects:str, nil];
    
}

//reload the visible cells
-(void)updateVisibleCells{
    for(UITableViewCell * cell in [self.table visibleCells]){
        [self updateCell:cell atIndexPath:[self.table indexPathForCell:cell]];
    }
}
//Update Cells
-(void)updateCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    //Title
    NSString *text = [nameArr objectAtIndex:(NSUInteger) indexPath.row];
    cell.textLabel.text = text;
    cell.textLabel.font = [UIFont fontWithName:@"Marker Felt" size:15];
    //subtitle
    NSString *detailText = [self.dataSource objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = detailText;
    
    NSLog(@"arrForColor %d",[[[self.dateController outputArrForColor] objectAtIndex:indexPath.row ] intValue]);
    
    switch([[self.dateController.arrForColor objectAtIndex:indexPath.row] intValue]){
            NSLog(@"color = %d",[[self.dateController.arrForColor objectAtIndex:indexPath.row] intValue]);
        case 0://笠山
            cell.backgroundColor = RGB(99, 184, 255);
            break;
        case 1://直行
            cell.backgroundColor = RGB(99, 184, 255);
            break;
        case 2://かがやき（直行）
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
            cell.backgroundColor = RGB(238, 59, 59);
            break;
        case 7://中書島238, 59, 59
            cell.backgroundColor = RGB(159,121,238);
            break;
        default:
            NSLog(@"色の判定ができません");
            break;
    }

 

}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource count];
    
}


-(void)loadView{
    
    UIView *view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    
    table = [[UITableView alloc]initWithFrame:view.bounds style:UITableViewStyleGrouped];
    table.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    table.dataSource = self;
    table.delegate = self;
    [view addSubview:table];
    
    //isTouchedAt1 = NO;
    
    //An element of this array will be added in between the cells
    //additionalData1 = [[NSArray alloc]initWithObjects:@"Added cell1-1",@"Added cell1-2",@"Added cell1-3",@"Added cell1-4",@"Added cell1-5", nil];
    //additionalData2 = [[NSArray alloc]initWithObjects:@"Added cell2-1",@"Added cell2-2",@"Added cell2-3",@"Added cell2-4",@"Added cell2-5", nil];
    
    self.view = view;
    [view release];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //return the number of sections.
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier]autorelease];
    }
    for (tableView in [cell.contentView subviews]) {
        [tableView removeFromSuperview];
    }
    
    //Update cell
    [self updateCell:cell atIndexPath:indexPath];
    
        
    return cell;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//set the height of a cell
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if(isTouched == NO){
        //add two elements between the cells
        //For last element
        if([self.dataSource count] == indexPath.row){
            [nameArr addObject:[nameArr objectAtIndex:indexPath.row]];
            [nameArr addObject:[nameArr objectAtIndex:indexPath.row]];
            
            [self.dataSource addObject:[additionalData1 objectAtIndex:indexPath.row]];
            [self.dataSource addObject:[additionalData2 objectAtIndex:indexPath.row]];

        }
        //For the others except a last one
        else{
            [nameArr insertObject:[nameArr objectAtIndex:indexPath.row] atIndex:indexPath.row+1];
            [nameArr insertObject:[nameArr objectAtIndex:indexPath.row] atIndex:indexPath.row+2];

            [self.dataSource insertObject:[additionalData1 objectAtIndex:indexPath.row] atIndex:indexPath.row+1];
            [self.dataSource insertObject:[additionalData2 objectAtIndex:indexPath.row] atIndex:indexPath.row+2];

        }
        isTouched = YES;
        tmp = indexPath.row;
        
    }
    
    else if(isTouched == YES){
        
        //when tap the same cell in a second time.
        if(tmp == indexPath.row){
            
            //remove the added elements
            [nameArr removeObjectAtIndex:indexPath.row+1];
            [nameArr removeObjectAtIndex:indexPath.row+1];
            [self.dataSource removeObjectAtIndex:indexPath.row+1];
            [self.dataSource removeObjectAtIndex:indexPath.row+1];
            
            isTouched = NO;
        }
        //when tap other cell in a second time
        //doesn't do this process if tap the added cell like the elements of both additionalData1 and additionalData2.
        else if(tmp != indexPath.row && tmp+1 != indexPath.row && tmp+2 != indexPath.row){
            //remove the added elements
            [nameArr removeObjectAtIndex:tmp+1];
            [nameArr removeObjectAtIndex:tmp+1];
            [self.dataSource removeObjectAtIndex:tmp+1];
            [self.dataSource removeObjectAtIndex:tmp+1];
            
            //For the last cell.
            if([self.dataSource count] == indexPath.row-2){
                [nameArr addObject:[nameArr objectAtIndex:indexPath.row-2]];
                [nameArr addObject:[nameArr objectAtIndex:indexPath.row-2]];
                
                
                [self.dataSource addObject:[additionalData1 objectAtIndex:indexPath.row-2]];
                [self.dataSource addObject:[additionalData2 objectAtIndex:indexPath.row-2]];

                tmp = indexPath.row -2;
            }
            //For others
            else{
                
                if(indexPath.row == 0){
                    [nameArr insertObject:[nameArr objectAtIndex:0] atIndex:1];
                    [nameArr insertObject:[nameArr objectAtIndex:0] atIndex:2];
                    
                    [self.dataSource insertObject:[additionalData1 objectAtIndex:indexPath.row] atIndex:1];
                    [self.dataSource insertObject:[additionalData2 objectAtIndex:indexPath.row] atIndex:2];

                    tmp = indexPath.row;
                }
                else if(tmp < indexPath.row){
                    [nameArr insertObject:[nameArr objectAtIndex:indexPath.row-2] atIndex:indexPath.row -1];
                    [nameArr insertObject:[nameArr objectAtIndex:indexPath.row-2] atIndex:indexPath.row];
                    [self.dataSource insertObject:[additionalData1 objectAtIndex:indexPath.row] atIndex:indexPath.row-1];
                    [self.dataSource insertObject:[additionalData2 objectAtIndex:indexPath.row] atIndex:indexPath.row];

                    tmp = indexPath.row -2;
                }
                else if(tmp > indexPath.row){
                    [nameArr insertObject:[nameArr objectAtIndex:indexPath.row] atIndex:indexPath.row+1];
                    [nameArr insertObject:[nameArr objectAtIndex:indexPath.row] atIndex:indexPath.row+2];
                    [self.dataSource insertObject:[additionalData1 objectAtIndex:indexPath.row] atIndex:indexPath.row+1];
                    [self.dataSource insertObject:[additionalData2 objectAtIndex:indexPath.row] atIndex:indexPath.row+2];

                    tmp = indexPath.row;
                }
            }
            
            isTouched = YES;
        }
        
    }
    
    
    //reload the data of the table.
    [table reloadData];
    return indexPath;
}

-(void)dealloc{
    [table release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


