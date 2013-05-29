//
//  newRitsViewController.h
//  BKCBusTable
//
//  Created by sato daisuke on 13/05/11.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

//このControllerでは、二つのviewを切り替える操作を行う。
//画面をタップされると、このControllerが反応し、viewを切り替える。
//viewは別のファイルで生成し、このcontrollerにincludeする。


#import "ViewController.h"
#import "tableViewFromUnivController.h"

@interface newRitsViewController : UIViewController

@property(nonatomic,retain)tableViewFromUnivController *fromUniv;
@end
