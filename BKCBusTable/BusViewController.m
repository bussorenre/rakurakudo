//
//  BusViewController.m
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/06.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import "BusViewController.h"
#import "DateController.h"
#import "AppDelegate.h"

//UIColor定義 RGB(,,);
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


@interface BusViewController ()

@end

@implementation BusViewController
@synthesize table;
@synthesize cell;
@synthesize dateController;
@synthesize countForSec;
@synthesize arrForKey,arrForValue;
-(id)init{
    self = [super init];
    if(self){
       //self.dateController = [[[DateController alloc]init]autorelease];
        //arrForKey = [[[NSMutableArray alloc]initWithArray:self.dateController.arrForTable]autorelease];
        //arrForValue = [[[NSMutableArray alloc]initWithArray:self.dateController.arrForValue]autorelease];
        //NSLog(@"in BusViewCOntoller %@",[self.arrForValue objectAtIndex:0]);
        //並び替え
        //arrForAll = [[[NSMutableArray alloc]initWithArray:[self.dateController sort:allArr]]autorelease];
        //countForSec = [NSNumber numberWithInt:[arrForAll count]];
        
        //全てのプロパティリストをひとつにまとまる。
        //allArr = [[NSMutableArray alloc]initWithArray:nil];
      /*
        self.dateController = [[[DateController alloc]init]autorelease];
        allArr = [[[NSMutableArray alloc]init]autorelease];
        NSArray *arr = [[NSArray alloc]initWithObjects:self.dateController.arrayMKS_1,self.dateController.arrayMKG_1,self.dateController.arrayMPN_1,self.dateController.arrayKST_1,self.dateController.arraySET_1,self.dateController.arrayCHU_1, nil];
        for(int i = 0;i<[arr count];i++){
            for(int j  = 0;j<[[arr objectAtIndex:i] count];j++){
                [allArr addObject:[[arr objectAtIndex:i] objectAtIndex:j]];
            }
        }
        //並び替え
        arrForAll = [[[NSMutableArray alloc]initWithArray:[self.dateController sort:allArr]]autorelease];
        countForSec = [NSNumber numberWithInt:[arrForAll count]];
        NSLog(@"%d",[arrForAll count]);*/
        UIView *view1 = [[[UIView alloc]initWithFrame:CGRectMake(0,40,320,330)]autorelease];

        table = [[UITableView alloc]initWithFrame:CGRectMake(0,0,320,330) style:UITableViewStylePlain];
        table.delegate = self;
        table.dataSource = self;
        [view1 addSubview:table];
        
        [self.view addSubview:view1];
        

    }
    return self;
}
//セクション数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tebleView{
    return 1;
}
//セクション内の行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //self.dateController = [[[DateController alloc]init]autorelease];
    int n;
    //AppDelegate *app = [[UIApplication sharedApplication] delegate];
    
    //第１セクションの設定
    if (section==0) {
        n =171;
        
    }
    /*
    //第２セクションの設定
    else if (section==1) {
       // return @"南草津（直行）";
        n = 5;
    }
    else if (section == 2){
        //return @"南草津（かがやき経由）";
        n = 5;
    }
    else if (section == 3){
        //return @"南草津（パナ経由）";
        n = 5;
    }
    else if (section == 4){
        //return @"草津（かがやき）";
        n = 5;
    }
    else if (section == 5){
        //return @"草津（パナ）";
        n = 5;
    }
    else if (section == 6){
        //return @"瀬田";
        n = 5;
    }
    else if (section == 7){
        //return @"長寿社会福祉センター";
        n = 5;
    }
    else if (section == 8){
        //return @"大津";
        n = 5;
    }
    else if (section == 9){
        //return @"中書島";
        //NSLog(@"セクション %@",[dateController.arrayCHU_1 objectAtIndex:0]);
        //NSLog(@"------%d",[dateController.arrayCHU_1 count]);
        //n = [dateController.arrayCHU_1 count];
        //n = [self.dateController.arrayCHU_1 count];
        n = 14;
    }
    */
    return n;
}
//セクションのタイトルを設定
- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section{
    //self.dateController = [[[DateController alloc]init]autorelease];
    //第１セクションの設定
    if (section==0) {
        return @"時刻表";
    }
    /*
    //第２セクションの設定
    else if (section==1) {
        return @"南草津（直行）";
    }
    else if (section == 2){
        return @"南草津（かがやき経由）";
    }
    else if (section == 3){
        return @"南草津（パナ経由）";
    }
    else if (section == 4){
        return @"草津（かがやき）";
    }
    else if (section == 5){
        return @"草津（パナ）";
    }
    else if (section == 6){
        return @"瀬田";
    }
    else if (section == 7){
        return @"長寿社会福祉センター";
    }
    else if (section == 8){
        return @"大津";
    }
    else if (section == 9){
        return @"中書島";
    }
    */
    
    return nil;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier =@"Cell";
    /*
     self.dateController = [[[DateController alloc]init]autorelease];
    allArr = [[[NSMutableArray alloc]init]autorelease];
    NSArray *arr = [[NSArray alloc]initWithObjects:self.dateController.arrayMKS_1,self.dateController.arrayMKG_1,self.dateController.arrayMPN_1,self.dateController.arrayKST_1,self.dateController.arraySET_1,self.dateController.arrayCHU_1, nil];
    for(int i = 0;i<[arr count];i++){
        for(int j  = 0;j<[[arr objectAtIndex:i] count];j++){
            [allArr addObject:[[arr objectAtIndex:i] objectAtIndex:j]];
        }
    }
    //並び替え
    arrForAll = [[[NSMutableArray alloc]initWithArray:[self.dateController sort:allArr]]autorelease];
    countForSec = [NSNumber numberWithInt:[arrForAll count]];

    //全てのプロパティリストをひとつにまとまる。
    allArr = [[NSMutableArray alloc]initWithArray:nil];
    NSLog(@"sssssssss%d",[self.dateController.arrayCHU_2 count]);
     */
    //テーブルセル用意
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //新規セル作成
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    for (tableView in [cell.contentView subviews]) {
        [tableView removeFromSuperview];
    }
    
    [self updateCell:cell atIndexPath:indexPath];    /*
    //グループごとに配列を格納
    if(indexPath.section == 0){
    
    }
    if(indexPath.section == 1){
        
    }
    if(indexPath.section == 2){
        
    }
    if(indexPath.section == 3){
        
    }
    if(indexPath.section == 4){
        
    }
    if(indexPath.section == 5){
        
    }
    if(indexPath.section == 6){
        
    }
    if(indexPath.section == 7){
        
    }
    if(indexPath.section == 8){
        //背景変更
        self.cell.backgroundColor = RGB(191,62,255);

    }
    if(indexPath.section == 9){
        //周辺の住民たちの空いてる時間と学生が空いてる時間の違い？
        //別々でラベル生成し、条件によって分ける
        //１５行に設定して、配列の要素数を取得、その値
        //その配列の要素数以下なら実行、上回ると停止
        //if([self.dateController.arrayCHU_1 count]
        //
        
        int hour,min,hour2,min2;
        hour =[[dateController.arrayCHU_1 objectAtIndex:(NSUInteger)indexPath.row] intValue]/100;
        min = [[dateController.arrayCHU_1 objectAtIndex:(NSUInteger)indexPath.row] intValue]%100;
        hour2 =[[dateController.arrayCHU_2 objectAtIndex:(NSUInteger)indexPath.row] intValue]/100;
        min2 = [[dateController.arrayCHU_2 objectAtIndex:(NSUInteger)indexPath.row] intValue]%100;

        UILabel *lbl1 = [[UILabel alloc]initWithFrame:CGRectMake(5,5,280,20)];
        lbl1.text = [NSString stringWithFormat:@"立命館発　　　　　　　立命館着"];
        lbl1.font = [UIFont fontWithName:nil size:18];
        lbl1.backgroundColor = [UIColor clearColor];
        [self.cell.contentView addSubview:lbl1];
        
        for(int i =0;i<10;i++){
            UILabel *lbl2 = [[UILabel alloc]initWithFrame:CGRectMake(5,30,280,200)];
            lbl2.text = [NSString stringWithFormat:@"%02d:%02d",hour,min];
            lbl2.font = [UIFont fontWithName:nil size:14];
            lbl2.backgroundColor = [UIColor clearColor];
            [self.cell.contentView addSubview:lbl2];
        }
        
        
        
        //
        
        
        //背景変更
        self.cell.backgroundColor = RGB(171,130,255);
       // UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(15,30,280,20)];
        int hour,min,hour2,min2;
        hour =[[dateController.arrayCHU_1 objectAtIndex:(NSUInteger)indexPath.row] intValue]/100;
        min = [[dateController.arrayCHU_1 objectAtIndex:(NSUInteger)indexPath.row] intValue]%100;
        hour2 =[[dateController.arrayCHU_2 objectAtIndex:(NSUInteger)indexPath.row] intValue]/100;
        min2 = [[dateController.arrayCHU_2 objectAtIndex:(NSUInteger)indexPath.row] intValue]%100;
        if(indexPath.row == 0){
            UILabel *lbl1 = [[UILabel alloc]initWithFrame:CGRectMake(15,30,380,20)];
            UILabel *lbl0 = [[UILabel alloc]initWithFrame:CGRectMake(15,5,280,20)];
            lbl0.text = @"    立命館発                 立命館着";
            lbl0.backgroundColor = [UIColor clearColor];
            [self.cell.contentView addSubview:lbl0];
        lbl1.font = [UIFont fontWithName:nil size:14];
        lbl1.numberOfLines = 0;
        lbl1.backgroundColor = [UIColor clearColor];
        lbl1.text = [NSString stringWithFormat:@"　　%02d:%02d　　　　　　%02d:%02d",hour,min,hour2,min2];
            [self.cell.contentView addSubview:lbl1];
        }else{
        UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(15,15,280,20)];
        lbl.font = [UIFont fontWithName:nil size:14];
        lbl.numberOfLines = 0;
        lbl.backgroundColor = [UIColor clearColor];
        lbl.text = [NSString stringWithFormat:@"　　%02d:%02d　　　　　　%02d:%02d",hour,min,hour2,min2];
        
        //NSLog(@"-------%@",[self.dateController.arrayCHU_1 objectAtIndex:0]);
        //lbl.text = @"aaaa";
        [self.cell.contentView addSubview:lbl];
         
        }
    }
     */
    return cell;
}
- (void)updateCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    // Update Cells

    self.dateController = [[DateController alloc]init];
    arrForKey = [[[NSMutableArray alloc]initWithArray:self.dateController.arrForTable]autorelease];
    arrForValue = [[[NSMutableArray alloc]initWithArray:self.dateController.arrForValue]autorelease];
    
    
    UILabel *lbl1 = [[UILabel alloc]initWithFrame:CGRectMake(5,5,155,20)];
    NSString *str = [NSString stringWithFormat:@"%02d:%02d",[[self.arrForKey objectAtIndex:indexPath.row] intValue]/100,[[self.arrForKey objectAtIndex:indexPath.row] intValue]%100];
    lbl1.text = [NSString stringWithFormat:@"%@",str];
    lbl1.textAlignment = NSTextAlignmentLeft;
    [self.cell.contentView addSubview:lbl1];
    UILabel *lbl2 = [[UILabel alloc]initWithFrame:CGRectMake(160,5,155,20)];
    NSString *str2;
    switch ([[self.arrForValue objectAtIndex:indexPath.row] intValue]){
        case 1://南草津（笠山経由）
            str2 = @"南草津行き（笠山経由）";
            break;
        case 3://南草津（かがやき経由）
            str2 = @"南草津行き（かがやき経由）";
            break;
        case 4://南草津（パナ）
            str2 = @"南草津行き（パナ)";
            break;
        case 5://草津
            str2 = @"草津行き";
            break;
        case 6://瀬田
            str2= @"瀬田行き";
            break;
        case 7://中書島
            str2 = @"中書島行き";
            break;
            default:
            break;
    }
    lbl2.text = str2;
    [self.cell.contentView addSubview];
}
//各行の高さの設定
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
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
    [self init];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
