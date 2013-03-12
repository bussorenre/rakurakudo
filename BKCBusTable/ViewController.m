//
//  ViewController.m
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/06.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import "ViewController.h"
#import "BusViewController.h"
#import "NextBusViewController.h"
#import "TabBarController.h"
#import "SettingViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize busViewController;
//@synthesize nextBusViewController;
@synthesize tabBarController;
//@synthesize settingViewController;
@synthesize fromRitsViewController;
@synthesize toRitsViewController;
@synthesize dateController;
@synthesize adView;
-(void)configureView{
    
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    
    if (frame.size.height > 500.0) { // iPhone 4inch (568 - 20 px)
        
        // iPhone5 のときの処理
        
        tabBarController = [[TabBarController alloc]init];//タブ
        tabBarController.view.frame = CGRectMake(0,0,320,548);
        
    } else { // iPhone 3.5inch
        
        tabBarController = [[TabBarController alloc]init];//タブ
        tabBarController.view.frame = CGRectMake(0,0,320,460);
        
    }
    
    dateController = [[DateController alloc]init];
    busViewController = [[BusViewController alloc]init]; //時刻表
    //nextBusViewController = [[NextBusViewController alloc]init];//次何分？
    //settingViewController = [[SettingViewController alloc]init];//各種設定
    fromRitsViewController = [[FromRitsViewController alloc]init];//立命館大学発
    toRitsViewController = [[ToRitsViewController alloc]init]; //立命館着
    
    
    //タブ設定
    //tabBarController.view.frame = CGRectMake(0,0,320,548);
    
    NSArray *controllers = [NSArray arrayWithObjects:fromRitsViewController,toRitsViewController,busViewController, nil];
    [tabBarController setViewControllers:controllers animated:NO];
    [[UITabBarItem appearance] setAccessibilityFrame:CGRectMake(0,0,320,30)];
    
    tabBarController.tbi1 = [tabBarController.tabBar.items objectAtIndex:0];
    tabBarController.tbi1.title = @"立命館発";
    tabBarController.tbi2 = [tabBarController.tabBar.items objectAtIndex:1];
    tabBarController.tbi2.title = @"立命館着";
    tabBarController.tbi3 = [tabBarController.tabBar.items objectAtIndex:2];
    tabBarController.tbi3.title = @"時刻表";
    
    [self.view addSubview:tabBarController.view];
    
    /*AdWhirl設定*/
    adView = [AdWhirlView requestAdWhirlViewWithDelegate:self];
    adView.frame = CGRectMake(0.0, 480.0, 320.0, 50.0);
    [self.view addSubview:adView];

    
 
}
/*AdWhirlデリゲート*/
- (NSString *)adWhirlApplicationKey
{
    return @"aaf418439d504dc3b2b9ccc3b234dad4";
}
-(UIViewController *)viewControllerForPresentingModalView
{
    return self;
}
- (void)adWhirlDidReceiveAd:(AdWhirlView *)adWhirlView {
    
    [UIView beginAnimations:@"AdWhirlDelegate.adWhirlDidReceiveAd:" context:nil];
    [UIView setAnimationDuration:2.0];
    CGSize adSize = [adWhirlView actualAdSize];
    CGRect newFrame = adWhirlView.frame;
    newFrame.size = adSize;
    newFrame.origin.x = (320 - adSize.width) / 2;
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    if (frame.size.height==548.0) { // iPhone 4inch (568 - 20 px)
        
        newFrame.origin.y = 498 - adSize.height;
        
        
        
    } else { // iPhone 3.5inch
        
        newFrame.origin.y = 420 - adSize.height;
        
        
    }
    
    adWhirlView.frame = newFrame;
    [UIView commitAnimations];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
