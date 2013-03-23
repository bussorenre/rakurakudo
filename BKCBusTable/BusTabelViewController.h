//
//  BusTabelViewController.h
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/20.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateController.h"

@interface BusTabelViewController : UITableViewController{

}
@property (nonatomic,retain)DateController *dateController;
@property(nonatomic,retain)NSMutableArray *arr;
@property(nonatomic,retain)NSArray *arrForColor;
@end
