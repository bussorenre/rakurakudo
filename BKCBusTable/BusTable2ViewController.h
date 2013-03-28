//
//  BusTable2ViewController.h
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/24.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateController.h"

@interface BusTable2ViewController : UITableViewController
{}
@property (nonatomic,retain)DateController *dateController;
@property(nonatomic,retain)NSMutableArray *arr;
@property(nonatomic,retain)NSArray *arrForColor;
@end
