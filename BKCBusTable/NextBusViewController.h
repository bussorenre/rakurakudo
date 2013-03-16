//
//  NextBusViewController.h
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/06.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NextBusTableViewController.h"
#import "DateController.h"

@interface NextBusViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    NextBusTableViewController *nextBusTableViewController;
    
    //DateController *dateController;
    
    NSMutableArray *tableList;//テーブルの中身を入れておく
    
    UITableView *table;
    
    UITableViewCell *cell;
    
    //データ保持
    UILabel *nameLabel,*dateLabel,*priceLabel,*memoLabel;
    //テスト用配列
    NSMutableArray *nameArr,*dateArr,*priceArr,*colorArr;
    //受け取る配列
    NSMutableArray *returnedArr;
}
//全ての配列を更新
-(void)updateArr;
//セルをアップデートするメソッド
-(void)updateCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;


-(void)reloadSections:(NSIndexSet *)indexSet;
@property(nonatomic,retain)UITableView *table;
@property(nonatomic,retain)UITableViewCell *cell;
@property(nonatomic,retain)NextBusTableViewController *nextBusTableViewController;
@property(nonatomic,retain)UILabel *nameLabel,*dateLabel,*priceLabel,*memoLabel;
@property(nonatomic,retain)NSMutableArray *nameArr,*dateArr,*priceArr,*colorArr;
//@property(nonatomic,retain)DateController *dateController;
@property(nonatomic,retain)NSMutableArray *returnedArr;
@end
