//
//  NextBusViewController.m
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/06.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import "NextBusViewController.h"
#import "NextBusTableViewController.h"
#import "DateController.h"

//Value(行き先）を定義
#define VALUE_MINAKUSA_CHOKUTSU 1
#define VALUE_MINAKUSA_KAGAYAKI 2
#define VALUE_MINAKUSA_KASAYAMA 3
#define VALUE_MINAKUSA_PANA 4
#define VALUE_OTSU 5
#define VALUE_KUSATSU 6
#define VALUE_SETA 7
#define VALUE_CHUSHOJIMA 8

//UIColor定義
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface NextBusViewController ()

@end

@implementation NextBusViewController
@synthesize nextBusTableViewController;
@synthesize table;
@synthesize cell;
@synthesize nameLabel,dateLabel,priceLabel,memoLabel;
@synthesize nameArr,dateArr,priceArr,colorArr;
//@synthesize dateController;
@synthesize returnedArr;

-(id)init{
    self = [super init];
    if(self){
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,0,300,20)];
    label.text = @"次何分??";
    [self.view addSubview:label];
    
        //セルの中身を格納
        tableList =[[NSMutableArray alloc]initWithObjects:@"",@"",@"",@"",@"",@"",@"",@"",@"",@"", nil];
        
        table = [[UITableView alloc]initWithFrame:CGRectMake(0,0,320,360) style:UITableViewStyleGrouped];
        table.delegate = self;
        table.dataSource = self;
        
        //dateController = [[DateController alloc]init];
        NSLog(@"ここで３回？");
        
        [self.view addSubview:table];
    }
    return self;
}
//tableViewデリゲート
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        // Delete時の処理をここに書く
    }else if(editingStyle == UITableViewCellEditingStyleInsert){
        // Insert時の処理をここに書く
    }
}
/*-(CGFloat)tableView:(UITableView*)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 0){
        return 100.0;  // １番目のセクションの行の高さを30にする
    }else{
        return 100.0;  // それ以外の行の高さを50にする
    }
}*/
//テーブル基本設計
//セクション数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tebleView{
    return 1;
}
//セクション内の行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    [self updateArr];
    
    NSLog(@"%d",[self.nameArr count]);
    return [self.nameArr count];
}
//テーブルセル作成
//セルの表示更新

//全ての配列を更新するメソッド
//このメソッドは起動時、更新ボタンが押された時に実行される
-(void)updateArr{
    //テスト用配列初期化
    self.nameArr = [[NSMutableArray alloc]initWithCapacity:10];
    self.dateArr = [[NSMutableArray alloc]initWithCapacity:10];
    self.priceArr = [[NSMutableArray alloc]initWithCapacity:10];
    self.colorArr = [[NSMutableArray alloc]initWithCapacity:10];
    //配列をうけとる
    //
    //returnedArr = [[NSMutableArray alloc]initWithArray:[self.dateController compare]];
    //キーに対応しているバリューの配列を生成 要素にはint型で格納
    
    //for文でtestArrに並び替えた配列を要素順に格納する
    //テスト用配列
    //キー（時刻)
    //NSArray *arr1 = [NSArray arrayWithObjects:@"南草津(かがやき通り経由)",@"南草津(笠山経由)",@"南南草津(パナ経由)",@"南草津(直行)",@"大津",@"草津",@"中書島",@"衣笠キャンパス",@"瀬田",@"中書島", nil];
    //Valueを配列に格納
    NSArray *arr2 = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"7",@"2",nil];
    int arr[10] = {1,2,3,4,5,6,7,8,5,2};
    
    NSLog(@"%@ %d",[arr2 objectAtIndex:3],(NSUInteger)[arr2 objectAtIndex:3]);
    
    for(int i = 0;i<10;i++){
        NSLog(@"test1");
        //caseごとに全てのデータ配列に格納していく
        switch(arr[i]){
            case 1://南草津（直行）
                [self.nameArr addObject:@"南草津（直行）"];
                [self.dateArr addObject:[returnedArr objectAtIndex:i]];//本来はキーが入る
                [self.priceArr addObject:@"220"];
                [self.colorArr addObject:RGB(135,206,250)];
                break;
            case 2://南草津（かがやき通り経由）
                [self.nameArr addObject:@"南草津（かがやき通り経由）"];
                [self.dateArr addObject:[returnedArr objectAtIndex:i]];
                [self.priceArr addObject:@"250"];
                [self.colorArr addObject:RGB(173, 255, 47)];
                break;
            case 3://南草津（笠山経由）
                [self.nameArr addObject:@"南草津（笠山経由）"];
                [self.dateArr addObject:[returnedArr objectAtIndex:i]];
                [self.priceArr addObject:@"250"];
                [self.colorArr addObject:RGB(255, 127, 80)];
                break;
            case 4://南草津（パナ経由）
                [self.nameArr addObject:@"南草津（パナ経由）"];
                [self.dateArr addObject:[returnedArr objectAtIndex:i]];
                [self.priceArr addObject:@"220"];
                [self.colorArr addObject:RGB(238, 130, 238)];
                break;
            case 5://大津
                [self.nameArr addObject:@"大津"];
                [self.dateArr addObject:[returnedArr objectAtIndex:i]];
                [self.priceArr addObject:@"250"];
                [self.colorArr addObject:RGB(238, 201, 0)];
                break;
            case 6://草津
                [self.nameArr addObject:@"草津"];
                [self.dateArr addObject:[returnedArr objectAtIndex:i]];
                [self.priceArr addObject:@"220"];
                [self.colorArr addObject:RGB(255, 110, 180)];
                break;
            case 7://瀬田
                [self.nameArr addObject:@"瀬田"];
                [self.dateArr addObject:[returnedArr objectAtIndex:i]];
                [self.priceArr addObject:@"250"];
                [self.colorArr addObject:RGB(205, 150, 205)];
                break;
            case 8://中書島
                [self.nameArr addObject:@"中書島"];
                [self.dateArr addObject:[returnedArr objectAtIndex:i]];
                [self.priceArr addObject:@"600"];
                [self.colorArr addObject:RGB(205, 150, 205)];
                break;                
            default:
            break;
                
                //以上で各配列に１０個全て適当な値が格納される
        }
    }
    /*
     ----pリストについて----
     pリストはひとつ。
     Value順、時刻順に入れていく
     キー：時刻　バリュー：識別番号
     
     ----配列について----
     pリストから配列に格納し、時刻順に並び替える
     並び替えた配列と現在時刻を比較
     現在時刻より大きい時刻から１０個取り出して新たな配列に格納（１０個）
     この配列をもとに下記の情報を各々の配列に格納していく
     
     ----必要なデータ----
     1.時刻:比較、並び替えられた時刻の配列
     2.識別番号:1の配列の要素（キー）から取り出してきたValueの配列
     3.行き先:Valueから判別させた行き先の名前が格納されている配列
     4.運賃:Valueから判別させた運賃が格納されている配列
     5.背景色:Valueから判別させた行き先別の色が格納されている配列
     
     ----Value別データ----
     01-行き先:"南草津(直行)",運賃:220,背景色:#-----
     02-行き先:"南草津(かがやき通り経由)",運賃:220,背景色:#-----
     03-行き先:"南草津(笠山経由)",運賃:220,背景色:#-----
     04-行き先:"南草津(パナ経由)",運賃:220,背景色:#-----
     05-行き先:"大津",運賃:不明,背景色:#-----
     06-行き先:"草津",運賃:不明,背景色:#-----
     07-行き先:"瀬田",運賃:不明,背景色:#-----
     08-行き先:"中書島",運賃:600,背景色:#-----
     */

}

-(void)updateCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    // Update Cells
    NSLog(@"test3");
    //returnedArr = [[NSMutableArray alloc]initWithArray:[self.dateController compare]];
    
    //テスト

    //名前
    nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10,5,270,18)];
    nameLabel.text = [NSString stringWithFormat:@"%@行き",[self.nameArr objectAtIndex:(NSUInteger)indexPath.row]];
    nameLabel.font = [UIFont boldSystemFontOfSize:18];
    nameLabel.backgroundColor = [UIColor clearColor];
    [self.cell.contentView addSubview:nameLabel];
    //時間
    dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(10,30,270,18)];
    dateLabel.text = [NSString stringWithFormat:@"%@出発 何時到着(何分)",[self.dateArr objectAtIndex:(NSUInteger)indexPath.row]];
    dateLabel.font = [UIFont systemFontOfSize:14];
    dateLabel.backgroundColor = [UIColor clearColor];
    [self.cell.contentView addSubview:dateLabel];
    //運賃
    priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(10,53,270,18)];
    priceLabel.text = [NSString stringWithFormat:@"%@円（片道）",[self.priceArr objectAtIndex:(NSUInteger)indexPath.row]];
    priceLabel.font = [UIFont systemFontOfSize:14];
    priceLabel.backgroundColor = [UIColor clearColor];
    [self.cell.contentView addSubview:priceLabel];
    //メモ
    //memoLabel = [[UILabel alloc]initWithFrame:CGRectMake(10,76,270,18)];
    //memoLabel.text = [NSString stringWithFormat:@"メモ："];
    //memoLabel.font = [UIFont systemFontOfSize:14];
    //memoLabel.backgroundColor = [UIColor clearColor];
    //[self.cell.contentView addSubview:memoLabel];
    //背景色
    self.cell.backgroundColor = [self.colorArr objectAtIndex:(NSUInteger)indexPath.row];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier =@"Cell";
    //テーブルセル用意
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //新規セル作成
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    NSLog(@"test4");
    for (tableView in [cell.contentView subviews]) {
        [tableView removeFromSuperview];
    }
    //updateCell;adIndexPath;
    [self updateCell:cell atIndexPath:indexPath];
    NSLog(@"show date below");
    return cell;
}
//各行の高さの設定
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
//各行がタップされたときの処理
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger row = [indexPath row];
    NSLog(@"%d行目",row);
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
