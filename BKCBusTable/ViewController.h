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
#import "FromRitsViewController.h"
#import "ToRitsViewController.h"
#import "DateController.h"
#import "AdWhirlView.h"
#import "AdWhirlDelegateProtocol.h"

@interface ViewController : UIViewController <AdWhirlDelegate>
{
    TabBarController *tabBarController;
    BusViewController *busViewController;
    //NextBusViewController *nextBusViewController;
    //SettingViewController *settingViewController;
    FromRitsViewController *fromRitsViewController;
    ToRitsViewController *toRitsViewController;
    DateController *dateController;
    AdWhirlView *adView;
}
-(void)configureView;
@property (nonatomic,retain)BusViewController *busViewController;
//@property(nonatomic,retain)NextBusViewController *nextBusViewController;
@property(nonatomic,retain)TabBarController *tabBarController;
//@property(nonatomic,retain)SettingViewController *settingViewController;
@property(nonatomic,retain)FromRitsViewController *fromRitsViewController;
@property(nonatomic,retain)ToRitsViewController *toRitsViewController;
@property(nonatomic,retain)DateController *dateController;
@property(nonatomic,retain)AdWhirlView *adView;
@end
