//
//  AddCellsBetweenCellsController.h
//  AddCellsBetweenCellsController
//
//  Created by sato daisuke on 13/05/13.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateController.h"

@interface AddCellsBetweenCellsController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)UITableView *table;
@property(nonatomic,retain)DateController *dateController;
@end
