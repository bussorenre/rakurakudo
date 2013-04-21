//
//  ViewController.m
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/06.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import "ViewController.h"


//時刻の画面に移る前に、楽洛堂の初期画面を表示する。
//初期画面はUIViewで生成



@interface ViewController ()

@end

@implementation ViewController
@synthesize viewController;
@synthesize tabBarController;
@synthesize fromRitsViewController;
@synthesize toRitsViewController;
@synthesize busTableViewController;
@synthesize busTable2ViewController;
-(id)init{
    
    CGRect frame = [[UIScreen mainScreen]applicationFrame];

    if (frame.size.height > 500.0) { // iPhone 4inch (568 - 20 px)
        
                // iPhone5 のときの処理
        
                tabBarController = [[TabBarController alloc]init];//タブ
                tabBarController.view.frame = CGRectMake(0,40,320,508);
                    
            } else { // iPhone 3.5inch
            
                    tabBarController = [[TabBarController alloc]init];//タブ
                    tabBarController.view.frame = CGRectMake(0,40,320,420);
                                    
                }

    
       
    fromRitsViewController = [[FromRitsViewController alloc]init];//立命館大学発
    toRitsViewController = [[ToRitsViewController alloc]init]; //立命館着
    busTableViewController = [[BusTabelViewController alloc]init];
    busTable2ViewController = [[BusTable2ViewController alloc]init];
    
    
    [self update];
    
    
    
    NSArray *controllers = [NSArray arrayWithObjects:toRitsViewController,fromRitsViewController,busTable2ViewController,busTableViewController, nil];
    [tabBarController setViewControllers:controllers animated:NO];
    [[UITabBarItem appearance] setAccessibilityFrame:CGRectMake(0,0,320,30)];
    
    
    tabBarController.tbi1 = [tabBarController.tabBar.items objectAtIndex:0];
    tabBarController.tbi1.title = @"立命館行き";
    tabBarController.tbi2 = [tabBarController.tabBar.items objectAtIndex:1];
    tabBarController.tbi2.title = @"立命館発";
    tabBarController.tbi3 = [tabBarController.tabBar.items objectAtIndex:2];
    tabBarController.tbi3.title = @"時刻表(大学行き)";
    tabBarController.tbi4 = [tabBarController.tabBar.items objectAtIndex:3];
    tabBarController.tbi4.title = @"時刻表(大学発)";
    
    [self.view addSubview:tabBarController.view];
    
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
    NSLog(@"更新した");
    self.fromRitsViewController.dateController = [[DateController alloc]init];
    self.toRitsViewController.dateController = [[DateController alloc]init];
    int num;
    
    //南草津行き（笠山経由）
    num = [self.fromRitsViewController.dateController returnMin:1];
    self.fromRitsViewController.label2_2.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr1];
        self.fromRitsViewController.label2.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr];
    //南草津行き（直通）
    num = [self.fromRitsViewController.dateController returnMin:2];
    if(num == 1111) {
        self.fromRitsViewController.label3.text = @"本日は運休です";
    }else{
    self.fromRitsViewController.label3_2.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr1];
    self.fromRitsViewController.label3.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr];
    }

    //南草津行き（かがやき経由）
    num = [self.fromRitsViewController.dateController returnMin:3];
    self.fromRitsViewController.label4_2.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr1];
    self.fromRitsViewController.label4.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr];
       //南草津行き（パナ経由）
    num = [self.fromRitsViewController.dateController returnMin:4];
    self.fromRitsViewController.label5_2.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr1];
    self.fromRitsViewController.label5.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr];
           //草津行き
    num = [self.fromRitsViewController.dateController returnMin:5];
    self.fromRitsViewController.label7_2.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr1];
    self.fromRitsViewController.label7.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr];
        //瀬田行き
    num = [self.fromRitsViewController.dateController returnMin:7];
    self.fromRitsViewController.label11_2.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr1];
    self.fromRitsViewController.label11.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr];
        //衣笠行き
    num = [self.fromRitsViewController.dateController returnMin:9];
    self.fromRitsViewController.label15_2.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr1];
    self.fromRitsViewController.label15.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr];
    //中書島行き
    num = [self.fromRitsViewController.dateController returnMin:10];
    if(num == 1111) {
        self.fromRitsViewController.label17.text = @"本日は運休です";
    }else{
    self.fromRitsViewController.label17_2.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.remStr1];
    self.fromRitsViewController.label17.text = [NSString stringWithFormat:@"%@",self.fromRitsViewController.dateController.minStr];
    }
    
    
    
    //大学行き（笠山経由）
    num = [self.toRitsViewController.dateController returnMin:11];
    self.toRitsViewController.label2_2.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.remStr1];
    self.toRitsViewController.label2.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr];
    
    //大学行き（直通）
    num = [self.toRitsViewController.dateController returnMin:12];
    if(num == 1111) {
        self.toRitsViewController.label3.text = @"本日は運休です";
    }else{
    self.toRitsViewController.label3_2.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.remStr1];
    self.toRitsViewController.label3.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr];
    }
    //大学行き（かがやき経由）
    num = [self.toRitsViewController.dateController returnMin:13];
    self.toRitsViewController.label4_2.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.remStr1];
    self.toRitsViewController.label4.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr];
        //大学行き（パナ経由）
    num = [self.toRitsViewController.dateController returnMin:14];
    self.toRitsViewController.label5_2.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.remStr1];
    self.toRitsViewController.label5.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr];
        //大学行き（草津）
    num = [self.fromRitsViewController.dateController returnMin:15];
    self.toRitsViewController.label7_2.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.remStr1];
    self.toRitsViewController.label7.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr];
        //大学行き(瀬田)
    num = [self.toRitsViewController.dateController returnMin:17];
    self.toRitsViewController.label11_2.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.remStr1];
    self.toRitsViewController.label11.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr];
        //大学行き（衣笠)
    num = [self.toRitsViewController.dateController returnMin:19];
    self.toRitsViewController.label15_2.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.remStr1];
    self.toRitsViewController.label15.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr];
    
    //大学行き（中書島)
    num = [self.toRitsViewController.dateController returnMin:20];
    if(num == 1111) {
        self.toRitsViewController.label17.text = @"本日は運休です";
    }else{
    self.toRitsViewController.label17_2.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.remStr1];
    self.toRitsViewController.label17.text = [NSString stringWithFormat:@"%@",self.toRitsViewController.dateController.minStr];
    }
    
    
    
    
    
}

-(void)dealloc{
    fromRitsViewController  = nil;
    toRitsViewController = nil;
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"applicationDidBecomeActive" object:nil];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self init];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(applicationDidBecomeActive) name:@"applicationDidBecomeActive" object:nil];
    //[self configureView];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)applicationDidBecomeActive{
    [self update];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)adViewDidReceiveAd:(GADBannerView *)bannerView
{

    NSLog(@"Admobの広告表示に成功しました");
}
- (void)adView:(GADBannerView *)view didFailToReceiveAdWithError:(GADRequestError *)error
{
    NSLog(@"adMobの表示に失敗しました");
}



@end
