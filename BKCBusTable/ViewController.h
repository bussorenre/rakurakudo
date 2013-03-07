//
//  ViewController.h
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/06.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusViewController.h"
#import "NextBusViewController.h"
#import "TabBarController.h"
#import "SettingViewController.h"

@interface ViewController : UIViewController
{
    TabBarController *tabBarController;
    BusViewController *busViewController;
    NextBusViewController *nextBusViewController;
    SettingViewController *settingViewController;
}
-(void)configureView;
@property (nonatomic,retain)BusViewController *busViewController;
@property(nonatomic,retain)NextBusViewController *nextBusViewController;
@property(nonatomic,retain)TabBarController *tabBarController;
@property(nonatomic,retain)SettingViewController *settingViewController;
@end
