//
//  TabBarController.h
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/06.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADBannerView.h"

@interface TabBarController : UITabBarController
{
    UITabBarItem *tbi1,*tbi2,*tbi3,*tbi4;
    UINavigationBar *navi;
    
}
@property(nonatomic,retain)UITabBarItem *tbi1,*tbi2,*tbi3,*tbi4;
@property(nonatomic,retain)UINavigationBar *navi;
@property(nonatomic,retain)GADBannerView *adBanner;
-(void)update:(BOOL)bl;
@end
