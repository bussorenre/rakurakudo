//
//  ViewController.h
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/06.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusViewController.h"
#import "TabBarController.h"
#import "FromRitsViewController.h"
#import "ToRitsViewController.h"
#import "DateController.h"
#import "AdWhirlView.h"
#import "AdWhirlDelegateProtocol.h"
#import "BusTabelViewController.h"
#import "BusTable2ViewController.h"

@interface ViewController : UIViewController <AdWhirlDelegate>
{
    ViewController *viewContoller;
    TabBarController *tabBarController;
    BusViewController *busViewController;
    //NextBusViewController *nextBusViewController;
    //SettingViewController *settingViewController;
    FromRitsViewController *fromRitsViewController;
    ToRitsViewController *toRitsViewController;
    //DateController *dateController;
    AdWhirlView *adView;
}
//-(void)configureView;
-(void)update;
@property(nonatomic,retain)ViewController *viewController;
@property (nonatomic,retain)BusViewController *busViewController;
//@property(nonatomic,retain)NextBusViewController *nextBusViewController;
@property(nonatomic,retain)TabBarController *tabBarController;
//@property(nonatomic,retain)SettingViewController *settingViewController;
@property(nonatomic,retain)FromRitsViewController *fromRitsViewController;
@property(nonatomic,retain)ToRitsViewController *toRitsViewController;
//@property(nonatomic,retain)DateController *dateController;
@property(nonatomic,retain)AdWhirlView *adView;
@property(nonatomic,retain)BusTabelViewController *busTableViewController;
@property(nonatomic,retain)BusTable2ViewController *busTable2ViewController;
@end
