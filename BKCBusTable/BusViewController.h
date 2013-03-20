//
//  BusViewController.h
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/06.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateController.h"
@interface BusViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *tableList,*arrForKey,*arrForValue;
    UITableView *table;
    UITableViewCell *cell;
    DateController *dateController;
    NSNumber *countForSec;
  
}
@property(nonatomic,retain)UITableView *table;
@property(nonatomic,retain)UITableViewCell *cell;
@property(nonatomic,retain)DateController *dateController;
@property(nonatomic,retain)NSNumber *countForSec;
@property(nonatomic,retain)NSMutableArray *arrForKey,*arrForValue;
@end
