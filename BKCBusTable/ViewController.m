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
@synthesize nextBusViewController;
@synthesize tabBarController;
@synthesize settingViewController;

-(void)configureView{
    
    UIView *adView = [[UIView alloc]initWithFrame:CGRectMake(0,0,320,50)];
    adView.backgroundColor = [UIColor blueColor];
    UILabel *adLabel = [[UILabel alloc]initWithFrame:CGRectMake(70,10,140,20)];
    adLabel.text = @"広告表示領域";
    [adView addSubview:adLabel];
    [self.view addSubview:adView];
    
    
    tabBarController = [[TabBarController alloc]init];//タブ
    busViewController = [[BusViewController alloc]init]; //時刻表
    nextBusViewController = [[NextBusViewController alloc]init];//次何分？
    settingViewController = [[SettingViewController alloc]init];//各種設定
    
    //タブ設定
    tabBarController.view.frame = CGRectMake(0,50,320,410);
    
    NSArray *controllers = [NSArray arrayWithObjects:nextBusViewController,busViewController,settingViewController, nil];
    [tabBarController setViewControllers:controllers animated:NO];
    
    tabBarController.tbi1 = [tabBarController.tabBar.items objectAtIndex:0];
    tabBarController.tbi1.title = @"次何分？";
    tabBarController.tbi2 = [tabBarController.tabBar.items objectAtIndex:1];
    tabBarController.tbi2.title = @"時刻表一覧";
    tabBarController.tbi3 = [tabBarController.tabBar.items objectAtIndex:2];
    tabBarController.tbi3.title = @"設定";
    
    [self.view addSubview:tabBarController.view];

    
 
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
