//
//  TabBarController.m
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/06.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController
@synthesize tbi1,tbi2,tbi3;
@synthesize navi;
-(id)init{
    self = [super init];
    if(self){
        
        CGRect frame = [[UIScreen mainScreen] applicationFrame];
        
        if (frame.size.height==548.0) { // iPhone 4inch (568 - 20 px)
            
            // iPhone5 のときの処理
            
        } else { // iPhone 3.5inch
            
            // iPhone5より前のモデル のときの処理
            //UITabBarControllerのタブの高さ変更
            float offset = 8.0;
            CGRect tabFrame = self.tabBar.frame;
            tabFrame.origin.y += offset;
            tabFrame.size.height -= offset;
            self.tabBar.frame = tabFrame;
            self.view.bounds = self.tabBar.bounds; // <- (*)
            
        }
        //広告表示
        //ツールバー生成
        UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        toolbar.barStyle = UIBarStyleBlackTranslucent;
        toolbar.backgroundColor = [UIColor blackColor];
        [self.view addSubview:toolbar];
        //ボタン生成
        UIBarButtonItem *button1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:nil];
        UIBarButtonItem *flexible = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        NSArray *items = [[NSArray alloc]initWithObjects:flexible,button1,nil];
        [toolbar setItems:items];
        

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
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
