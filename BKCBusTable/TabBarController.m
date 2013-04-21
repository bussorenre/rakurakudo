//
//  TabBarController.m
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/06.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import "TabBarController.h"

#define MY_BANNER_UNIT_ID @"a1513db461de170"


@interface TabBarController ()

@end

@implementation TabBarController
@synthesize tbi1,tbi2,tbi3,tbi4;
@synthesize navi;
@synthesize adBanner;
-(id)init{
    self = [super init];
    if(self){
        
        CGRect frame = [[UIScreen mainScreen] applicationFrame];
        
        if (frame.size.height==548.0) { // iPhone 4inch (568 - 20 px)
            
            // iPhone5 のときの処理
            
        } else { // iPhone 3.5inch
            
            // iPhone5より前のモデル のときの処理
            //UITabBarControllerのタブの高さ変更
            float offset = 9.0;
            CGRect tabFrame = self.tabBar.frame;
            tabFrame.origin.y += offset;
            tabFrame.size.height -= offset;
            self.tabBar.frame = tabFrame;
            self.view.bounds = self.tabBar.bounds;
            // <- (*)
            NSLog(@"tabFrame.height = %f",tabFrame.size.height);
        }
        //広告表示
        

    }
return self;
}
-(void)update:(BOOL)bl{
    //blがYESなら立命館発、NOなら立命館着

}
-(void)dealloc{
    [self release];
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    adBanner = [[GADBannerView alloc]init];
    CGRect frame = [[UIScreen mainScreen]applicationFrame];
    
    
    if (frame.size.height > 500.0) { // iPhone 4inch (568 - 20 px)
        
        
        // iPhone5 のときの処理
        //adView.frame = CGRectMake(0.0, 458.0, 320.0, 50.0);
        adBanner.frame = CGRectMake(0,418.0,320,50);
        
    } else { // iPhone 3.5inch
        adBanner.frame = CGRectMake(0.0, 330.0, 320.0, 50.0);
        
    }
    
    adBanner.adUnitID = MY_BANNER_UNIT_ID;
    adBanner.rootViewController = self;
    [self.view addSubview:adBanner];
    [adBanner loadRequest:[GADRequest request]];
	// Do any additional setup after loading the view.
    
}
- (void)adViewDidReceiveAd:(GADBannerView *)bannerView
{
    
    NSLog(@"Admobの広告表示に成功しました");
}
- (void)adView:(GADBannerView *)view didFailToReceiveAdWithError:(GADRequestError *)error
{
    NSLog(@"adMobの表示に失敗しました");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
