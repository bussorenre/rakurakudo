//
//  ViewController.h
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/06.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarController.h"
#import "FromRitsViewController.h"
#import "ToRitsViewController.h"
#import "DateController.h"
#import "BusTabelViewController.h"
#import "BusTable2ViewController.h"
#import "AddCellsBetweenCellsController.h"

#import "tableViewFromUnivController.h"
#import "newRitsViewController.h"

@interface ViewController : UIViewController 
{
}
-(void)update;
@property(nonatomic,retain)ViewController *viewController;
@property(nonatomic,retain)TabBarController *tabBarController;
@property(nonatomic,retain)FromRitsViewController *fromRitsViewController;
@property(nonatomic,retain)ToRitsViewController *toRitsViewController;
@property(nonatomic,retain)BusTabelViewController *busTableViewController;
@property(nonatomic,retain)BusTable2ViewController *busTable2ViewController;
@property(nonatomic,retain)tableViewFromUnivController *tableViewFromUniv;
//@property(nonatomic,retain)newRitsViewController *newRits;
@property(nonatomic,retain)AddCellsBetweenCellsController *addCellsViewController;
@end
