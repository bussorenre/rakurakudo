//
//  ViewController.m
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/06.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import "ViewController.h"
#import "BusViewController.h"
#import "TabBarController.h"

//時刻の画面に移る前に、楽洛堂の初期画面を表示する。
//初期画面はUIViewで生成



@interface ViewController ()

@end

@implementation ViewController
@synthesize viewController;
@synthesize busViewController;
//@synthesize nextBusViewController;
@synthesize tabBarController;
//@synthesize settingViewController;
@synthesize fromRitsViewController;
@synthesize toRitsViewController;
@synthesize busTableViewController;
@synthesize busTable2ViewController;
//@synthesize dateController;
@synthesize adView;
-(id)init{
    
    CGRect frame = [[UIScreen mainScreen]applicationFrame];
    
    /*AdWhirl設定*/
    adView = [AdWhirlView requestAdWhirlViewWithDelegate:self];
    
    
    if (frame.size.height > 500.0) { // iPhone 4inch (568 - 20 px)
        
        // iPhone5 のときの処理
        
        tabBarController = [[TabBarController alloc]init];//タブ
        tabBarController.view.frame = CGRectMake(0,40,320,508);
        //AdWhirl
        adView.frame = CGRectMake(0.0, 458.0, 320.0, 50.0);
        
    } else { // iPhone 3.5inch
        
        tabBarController = [[TabBarController alloc]init];//タブ
        tabBarController.view.frame = CGRectMake(0,40,320,420);
        //AdWhirl
        adView.frame = CGRectMake(0.0, 370.0, 320.0, 50.0);
        
    }
    
    //dateController = [[DateController alloc]init];
    //NSLog(@"dateControler in viewContorler %@",[self.dateController.arrayCHU_1 objectAtIndex:0]);
    busViewController = [[[BusViewController alloc]init]autorelease]; //時刻表
    //nextBusViewController = [[NextBusViewController alloc]init];//次何分？
    //settingViewController = [[SettingViewController alloc]init];//各種設定
    fromRitsViewController = [[[FromRitsViewController alloc]init]autorelease];//立命館大学発
    toRitsViewController = [[[ToRitsViewController alloc]init]autorelease]; //立命館着
    busTableViewController = [[[BusTabelViewController alloc]init]autorelease];
    busTable2ViewController = [[[BusTable2ViewController alloc]init]autorelease];
    
    
    [self update];
    
    
    //タブ設定
    //tabBarController.view.frame = CGRectMake(0,0,320,548);
    
    NSArray *controllers = [NSArray arrayWithObjects:toRitsViewController,fromRitsViewController,busTable2ViewController,busTableViewController, nil];
    [tabBarController setViewControllers:controllers animated:NO];
    [[UITabBarItem appearance] setAccessibilityFrame:CGRectMake(0,0,320,30)];
//    [[self.tabBarController.tbi1] setTitlePositionAdjustment:<#(UIOffset)#>];
    
    
    tabBarController.tbi1 = [tabBarController.tabBar.items objectAtIndex:0];
    tabBarController.tbi1.title = @"立命館行き";
    tabBarController.tbi2 = [tabBarController.tabBar.items objectAtIndex:1];
    tabBarController.tbi2.title = @"立命館発";
    tabBarController.tbi3 = [tabBarController.tabBar.items objectAtIndex:2];
    tabBarController.tbi3.title = @"時刻表(大学行き)";
    tabBarController.tbi4 = [tabBarController.tabBar.items objectAtIndex:3];
    tabBarController.tbi4.title = @"時刻表(大学発)";
    
    [self.view addSubview:tabBarController.view];
    
    /*AdWhirl追加*/
    [self.view addSubview:adView];
   
    //ツールバー生成
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    //[self.navigationController setToolbarHidden:NO animated:NO];
    toolbar.barStyle = UIBarStyleBlackTranslucent;
    toolbar.backgroundColor = [UIColor blackColor];
    [self.view addSubview:toolbar];
    //ボタン生成
    UIBarButtonItem *button1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(update)];
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSMutableArray *items = [[[NSMutableArray alloc]init]autorelease];
        [items addObject:flexible];
    [items addObject:button1];
    [toolbar setItems:items];

    return self;
 
}
-(void)update{
    self.fromRitsViewController.dateController = [[DateController alloc]init];
    self.toRitsViewController.dateController = [[DateController alloc]init];
    int num;
    
    //南草津行き（笠山経由）
    num = [self.fromRitsViewController.dateController returnMin:1];
    self.fromRitsViewController.label2_2.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr1];
    self.fromRitsViewController.label2.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr];
    //self.fromRitsViewController.label2_3.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr2];
    //self.fromRitsViewController.label2_4.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr2];
    //南草津行き（直通）
    num = [self.fromRitsViewController.dateController returnMin:2];
    self.fromRitsViewController.label3_2.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr1];
    self.fromRitsViewController.label3.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr];

    //南草津行き（かがやき経由）
    num = [self.fromRitsViewController.dateController returnMin:3];
    self.fromRitsViewController.label4_2.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr1];
    self.fromRitsViewController.label4.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr];
    //self.fromRitsViewController.label4_3.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr2];
    //self.fromRitsViewController.label4_4.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr2];
    //南草津行き（パナ経由）
    num = [self.fromRitsViewController.dateController returnMin:4];
    self.fromRitsViewController.label5_2.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr1];
    self.fromRitsViewController.label5.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr];
    //self.fromRitsViewController.label5_3.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr2];
    //self.fromRitsViewController.label5_4.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr2];
        //草津行き
    num = [self.fromRitsViewController.dateController returnMin:5];
    self.fromRitsViewController.label7_2.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr1];
    self.fromRitsViewController.label7.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr];
    //self.fromRitsViewController.label7_3.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr2];
    //self.fromRitsViewController.label7_4.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr2];
    //瀬田行き
    num = [self.fromRitsViewController.dateController returnMin:7];
    self.fromRitsViewController.label11_2.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr1];
    self.fromRitsViewController.label11.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr];
    //self.fromRitsViewController.label11_3.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr2];
    //self.fromRitsViewController.label11_4.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr2];
    //衣笠行き
    num = [self.fromRitsViewController.dateController returnMin:9];
    self.fromRitsViewController.label15_2.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr1];
    self.fromRitsViewController.label15.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr];
    //中書島行き
    num = [self.fromRitsViewController.dateController returnMin:10];
    self.fromRitsViewController.label17_2.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr1];
    self.fromRitsViewController.label17.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr];
    //self.fromRitsViewController.label17_3.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr2];
    //self.fromRitsViewController.label17_4.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr2];
    
    
    
    
    
    //大学行き（笠山経由）
    num = [self.toRitsViewController.dateController returnMin:11];
    self.toRitsViewController.label2_2.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.remStr1];
    self.toRitsViewController.label2.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr];
    //self.toRitsViewController.label2_3.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr2];
    //self.toRitsViewController.label2_4.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.remStr2];
    //大学行き（直通）
    num = [self.toRitsViewController.dateController returnMin:12];
    self.toRitsViewController.label3_2.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.remStr1];
    self.toRitsViewController.label3.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr];
    //大学行き（かがやき経由）
    num = [self.toRitsViewController.dateController returnMin:13];
    self.toRitsViewController.label4_2.text = [NSString stringWithFormat:@"%2@",self.toRitsViewController.dateController.remStr1];
    self.toRitsViewController.label4.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr];
    //self.toRitsViewController.label4_3.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr2];
    //self.toRitsViewController.label4_4.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.remStr2];
    //大学行き（パナ経由）
    num = [self.toRitsViewController.dateController returnMin:14];
    self.toRitsViewController.label5_2.text = [NSString stringWithFormat:@"%2@",self.toRitsViewController.dateController.remStr1];
    self.toRitsViewController.label5.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr];
    //self.toRitsViewController.label5_3.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr2];
    //self.toRitsViewController.label5_4.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.remStr2];
    //大学行き（草津）
    num = [self.fromRitsViewController.dateController returnMin:15];
    self.toRitsViewController.label7_2.text = [NSString stringWithFormat:@"%2@",self.toRitsViewController.dateController.remStr1];
    self.toRitsViewController.label7.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr];
    //self.toRitsViewController.label7_3.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr2];
    //self.toRitsViewController.label7_4.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.remStr2];
    //大学行き(瀬田)
    num = [self.toRitsViewController.dateController returnMin:17];
    self.toRitsViewController.label11_2.text = [NSString stringWithFormat:@"%2@",self.toRitsViewController.dateController.remStr1];
    self.toRitsViewController.label11.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr];
    //self.toRitsViewController.label11_3.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr2];
    //self.toRitsViewController.label11_4.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.remStr2];
    //大学行き（衣笠)
    num = [self.toRitsViewController.dateController returnMin:19];
    self.toRitsViewController.label15_2.text = [NSString stringWithFormat:@"%2@",self.toRitsViewController.dateController.remStr1];
    self.toRitsViewController.label15.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr];
    //self.toRitsViewController.label17_3.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr2];
    //self.toRitsViewController.label17_4.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.remStr2];

    //大学行き（中書島)
    num = [self.toRitsViewController.dateController returnMin:20];
    self.toRitsViewController.label17_2.text = [NSString stringWithFormat:@"%2@",self.toRitsViewController.dateController.remStr1];
    self.toRitsViewController.label17.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr];
    //self.toRitsViewController.label17_3.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr2];
    //self.toRitsViewController.label17_4.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.remStr2];
    
    
    
    
    
    
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
/*
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
    
}*/
-(void)adWhirlDidFailToReceiveAd:(AdWhirlView *)adWhirlView usingBackup:(BOOL)yesOrNo {
    NSLog(@"広告の表示に失敗しました");
}
-(void)dealloc{
    fromRitsViewController  = nil;
    toRitsViewController = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self init];
    //[self configureView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
