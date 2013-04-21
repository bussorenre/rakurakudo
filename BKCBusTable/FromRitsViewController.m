//
//  FromRitsViewController.m
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/09.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import "FromRitsViewController.h"
#import "DateController.h"
#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

//UIColor定義 RGB(,,);
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


@interface FromRitsViewController ()

@end

@implementation FromRitsViewController
@synthesize view1,view2_1,view2,view3,view3_1,view4,view4_1,view5,view5_1,view6,view6_1,view7,view7_1,view8,view9,view10,view10_1,view11,view11_1,view12,view13,view14,view14_1,view15,view15_1,view16,view16_1,view17,view17_1;
//@synthesize adView;
@synthesize dateController;
@synthesize label2,label2_2,label2_3,label2_4,
label3,label3_2,
label4,label4_2,label4_3,label4_4,
label5,label5_2,label5_3,label5_4,
label6_2,
label7,label7_2,label7_3,label7_4,
label8_2,label9_2,label10_2,
label11,label11_2,label11_3,label11_4,label12_2,label13_2,label14_2,
label15,label15_2,label16_2,
label17,label17_2,label17_3,label17_4;
-(id)init{
    NSLog(@"init in fromRitsViewController");
    self = [super init];
    if(self){
        
        view1 = [[UIView alloc]init];
        view2 = [[UIView alloc]init];
        view3 = [[UIView alloc]init];
        view4 = [[UIView alloc]init];
        view5 = [[UIView alloc]init];
        view6 = [[UIView alloc]init];
        view7 = [[UIView alloc]init];
        view8 = [[UIView alloc]init];
        view9 = [[UIView alloc]init];
        view10 = [[UIView alloc]init];
        view11 = [[UIView alloc]init];
        view12 = [[UIView alloc]init];
        view13 = [[UIView alloc]init];
        view14 = [[UIView alloc]init];
        view15 = [[UIView alloc]init];
        view16 = [[UIView alloc]init];
        view17 = [[UIView alloc]init];
        
        view2_1 = [[UIView alloc]init];
        view3_1 = [[UIView alloc]init];
        view4_1 = [[UIView alloc]init];
        view5_1 = [[UIView alloc]init];
        view6_1 = [[UIView alloc]init];
        view7_1 = [[UIView alloc]init];
        view10_1 = [[UIView alloc]init];
        view11_1 = [[UIView alloc]init];
        view14_1 = [[UIView alloc]init];
        view15_1 = [[UIView alloc]init];
        view16_1 = [[UIView alloc]init];
        view17_1 = [[UIView alloc]init];
    
        
        CGRect frame = [[UIScreen mainScreen] applicationFrame];
        
        if (frame.size.height > 500.0) { // iPhone 4inch (568 - 20 px)
            NSLog(@"in height = 548");
            
            
            
            // iPhone5 のときの処理
            view1.frame = CGRectMake(0,0,320,40);
            view2.frame = CGRectMake(0,70,160,65);
            view3.frame = CGRectMake(160,70,160,65);
            view4.frame = CGRectMake(0,165,160,65);
            view5.frame = CGRectMake(160,165,160,65);
            //view6.frame = CGRectMake(20,205,140,30);
            view7.frame = CGRectMake(0,260,160,62.5);
            //view8.frame = CGRectMake(110,152,100,35);
            //view9.frame = CGRectMake(110,187,100,70);
            //view10.frame = CGRectMake(180,205,140,30);
            view11.frame = CGRectMake(160,260,160,62.5);
            //view12.frame = CGRectMake(0,164,160,30);
            //view13.frame = CGRectMake(0,194,160,52.5);
            //view14.frame = CGRectMake(20,287.5,140,30);
            view15.frame = CGRectMake(0,357.5,160,62.5);
            //view16.frame = CGRectMake(180,287.5,140,30);
            view17.frame = CGRectMake(160,357.5,160,62.5);
            
            view2_1.frame = CGRectMake(0,40,160,30);
            view3_1.frame = CGRectMake(160,40,160,30);
            view4_1.frame = CGRectMake(0,135,160,30);
            view5_1.frame = CGRectMake(160,135,160,30);
            //view6_1.frame = CGRectMake(0,205,20,30);
            view7_1.frame = CGRectMake(0,225,160,35);
            //view8.frame = CGRectMake(105,267,100,70);
            //view9.frame = CGRectMake(210,232,105,35);
            //view10_1.frame = CGRectMake(160,267,105,70);
            view11_1.frame = CGRectMake(160,225,160,35);
            //view12.frame = CGRectMake(5,377,100,70);
            //view13.frame = CGRectMake(110,342,100,35);
            //view14_1.frame = CGRectMake(110,377,100,70);
            view15_1.frame = CGRectMake(0,322.5,160,35);
            //view16_1.frame = CGRectMake(215,377,100,70);
            view17_1.frame = CGRectMake(160,322.5,160,35);
                        
            
        } else { // iPhone 3.5inch
            
            // iPhone5より前のモデル のときの処理
            view1.frame = CGRectMake(0,0,320,165);
            view2.frame = CGRectMake(0,50,160,47.5);
            view3.frame = CGRectMake(160,50,160,47.5);
            view4.frame = CGRectMake(0,117.5,160,47.5);
            view5.frame = CGRectMake(160,117.5,160,47.5);
            //view6.frame = CGRectMake(20,205,140,30);
            view7.frame = CGRectMake(0,195,160,52.5);
            //view8.frame = CGRectMake(110,152,100,35);
            //view9.frame = CGRectMake(110,187,100,70);
            //view10.frame = CGRectMake(180,205,140,30);
            view11.frame = CGRectMake(160,195,160,52.5);
            //view12.frame = CGRectMake(0,164,160,30);
            //view13.frame = CGRectMake(0,194,160,52.5);
            //view14.frame = CGRectMake(20,287.5,140,30);
            view15.frame = CGRectMake(0,277.5,160,52.5);
            //view16.frame = CGRectMake(180,287.5,140,30);
            view17.frame = CGRectMake(160,277.5,160,52.5);
            
            view2_1.frame = CGRectMake(0,30,160,20);
            view3_1.frame = CGRectMake(160,30,160,20);
            view4_1.frame = CGRectMake(0,97.5,160,20);
            view5_1.frame = CGRectMake(160,97.5,160,20);
            //view6_1.frame = CGRectMake(0,205,20,30);
            view7_1.frame = CGRectMake(0,165,160,30);
            //view8.frame = CGRectMake(105,267,100,70);
            //view9.frame = CGRectMake(210,232,105,35);
            //view10_1.frame = CGRectMake(160,267,105,70);
            view11_1.frame = CGRectMake(160,165,160,30);
            //view12.frame = CGRectMake(5,377,100,70);
            //view13.frame = CGRectMake(110,342,100,35);
            //view14_1.frame = CGRectMake(110,377,100,70);
            view15_1.frame = CGRectMake(0,247.5,160,30);
            //view16_1.frame = CGRectMake(215,377,100,70);
            view17_1.frame = CGRectMake(160,247.5,160,30);
            
            
        }
        
        
        
        view1.backgroundColor = RGB(67, 110, 238);
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0,2,320,30)];
        label1.backgroundColor = [UIColor clearColor];
        label1.textAlignment = NSTextAlignmentCenter;
        label1.font = [UIFont fontWithName:@"Marker Felt" size:20];
        label1.text = @"南草津行き";
        //[[view1 layer] setBorderColor:[RGB(0,0,0) CGColor]];
        //[[view1 layer] setBorderWidth:1.0f];
        [self.view1 addSubview:label1];
        [self.view addSubview:view1 ];
        
        /*----笠山----*/
        view2.backgroundColor = RGB(224, 255, 255);
        
        //ラベル「あと」
        UILabel *lbl2_0 = [[UILabel alloc]initWithFrame:CGRectMake(5,10,25,15)];
        lbl2_0.text = @"あと";
        lbl2_0.font  = [UIFont fontWithName:@"Marker Felt" size:12];
        lbl2_0.backgroundColor = [UIColor clearColor];
        [self.view2 addSubview:lbl2_0];
        //ラベル「分(00:00)」
        label2 = [[UILabel alloc]initWithFrame:CGRectMake(0,25,155,20)];
        label2.font = [UIFont fontWithName:@"Marker Felt" size:15];
        label2.backgroundColor = [UIColor clearColor];
        label2.textAlignment = NSTextAlignmentRight;
        [self.view2 addSubview:label2];
        //ラベル「00」
        label2_2 = [[UILabel alloc]initWithFrame:CGRectMake(0,8,90,40)];
        label2_2.backgroundColor = [UIColor clearColor];
        label2_2.font = [UIFont fontWithName:@"Marker Felt" size:35];
        label2_2.textAlignment = NSTextAlignmentRight;
        [self.view2 addSubview:label2_2];
        
        //label2_3 = [[UILabel alloc]initWithFrame:CGRectMake(0,35,160,20)];
        //label2_3.font = [UIFont fontWithName:@"Marker Felt" size:17];
        //label2_3.backgroundColor = [UIColor clearColor];
        //[self.view2 addSubview:label2_3];
        
        //label2_4 = [[UILabel alloc]initWithFrame:CGRectMake(60,55,75,15)];
        //label2_4.backgroundColor = [UIColor clearColor];
        //label2_4.font = [UIFont fontWithName:@"Marker Felt" size:14];
        //label2_4.textAlignment = NSTextAlignmentRight;
        //[self.view2 addSubview:label2_4];
        
        [self.view addSubview:view2];
        
        /*--------*/
        
        //view2_1
        view2_1.backgroundColor = RGB(99, 184, 255);
        UILabel *lbl2_1 = [[UILabel alloc]initWithFrame:CGRectMake(0,2,160,20)];
        lbl2_1.font = [UIFont fontWithName:@"Marker Felt" size:16];
        lbl2_1.backgroundColor = [UIColor clearColor];
        lbl2_1.textAlignment = NSTextAlignmentCenter;
        lbl2_1.numberOfLines = 1;
        lbl2_1.text = @"笠山経由";
        [self.view2_1 addSubview:lbl2_1];
        [self.view addSubview:view2_1];
        
        view3.backgroundColor = RGB(224, 255, 255);
        
        //ラベル「あと」
        UILabel *lbl3_0 = [[UILabel alloc]initWithFrame:CGRectMake(5,10,25,15)];
        lbl3_0.text = @"あと";
        lbl3_0.font  = [UIFont fontWithName:@"Marker Felt" size:12];
        lbl3_0.backgroundColor = [UIColor clearColor];
        [self.view3 addSubview:lbl3_0];
        //ラベル「分(00:00)」
        label3 = [[UILabel alloc]initWithFrame:CGRectMake(0,25,155,20)];
        label3.font = [UIFont fontWithName:@"Marker Felt" size:15];
        label3.backgroundColor = [UIColor clearColor];
        label3.textAlignment = NSTextAlignmentRight;
        [self.view3 addSubview:label3];
        //ラベル「00」
        label3_2 = [[UILabel alloc]initWithFrame:CGRectMake(0,8,90,40)];
        label3_2.backgroundColor = [UIColor clearColor];
        label3_2.font = [UIFont fontWithName:@"Marker Felt" size:35];
        label3_2.textAlignment = NSTextAlignmentRight;
        [self.view3 addSubview:label3_2];
        
        [self.view addSubview:view3];
        
        
        //view3_1
        view3_1.backgroundColor = RGB(99, 184, 255);
        UILabel *lbl3_1 = [[UILabel alloc]initWithFrame:CGRectMake(0,2,160,20)];
        lbl3_1.font = [UIFont fontWithName:@"Marker Felt" size:16];
        lbl3_1.backgroundColor = [UIColor clearColor];
        lbl3_1.textAlignment = NSTextAlignmentCenter;
        lbl3_1.numberOfLines = 1;
        lbl3_1.text = @"直行";
        [self.view3_1 addSubview:lbl3_1];
        [self.view addSubview:view3_1];
        
        /*----かがやき----*/
        view4.backgroundColor = RGB(224, 255, 255);
        
        //ラベル「あと」
        UILabel *lbl4_0 = [[UILabel alloc]initWithFrame:CGRectMake(5,10,25,15)];
        lbl4_0.text = @"あと";
        lbl4_0.font  = [UIFont fontWithName:@"Marker Felt" size:12];
        lbl4_0.backgroundColor = [UIColor clearColor];
        [self.view4 addSubview:lbl4_0];
        //ラベル「分(00:00)」
        label4 = [[UILabel alloc]initWithFrame:CGRectMake(0,25,155,20)];
        label4.font = [UIFont fontWithName:@"Marker Felt" size:15];
        label4.backgroundColor = [UIColor clearColor];
        label4.textAlignment = NSTextAlignmentRight;
        [self.view4 addSubview:label4];
        //ラベル「00」
        label4_2 = [[UILabel alloc]initWithFrame:CGRectMake(0,8,90,40)];
        label4_2.backgroundColor = [UIColor clearColor];
        label4_2.font = [UIFont fontWithName:@"Marker Felt" size:35];
        label4_2.textAlignment = NSTextAlignmentRight;
        [self.view4 addSubview:label4_2];
        
        [self.view addSubview:view4];
        
        /*--------*/

        
        /*
        view4.backgroundColor = RGB(202, 255, 112);
        UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(62,20,50,50)];
        //[[view4 layer] setBorderColor:[RGB(0,0,0) CGColor]];
        //[[view4 layer] setBorderWidth:1.0f];
        label4.font = [UIFont fontWithName:@"Marker Felt" size:16];
        label4.backgroundColor = [UIColor clearColor];
        //int n = 10;
        label4.text = [NSString stringWithFormat:@"分"];
        [self.view4 addSubview:label4];
        label4_2 = [[UILabel alloc]initWithFrame:CGRectMake(2,15,60,50)];
        label4_2.backgroundColor = [UIColor clearColor];
        label4_2.font = [UIFont fontWithName:@"Marker Felt" size:35];
        label4_2.textAlignment = NSTextAlignmentRight;
        //int n = 10;
        //label4_2.text = [NSString stringWithFormat:@"%d",n[self.DateController method:(int)3]];
        [self.view4 addSubview:label4_2];
        UILabel *label4_3 = [[UILabel alloc]initWithFrame:CGRectMake(5,2,72,20)];
        label4_3.font = [UIFont fontWithName:@"Marker Felt" size:12];
        label4_3.text = @"かがやき経由";
        label4_3.backgroundColor = RGB(202,255,112);
        [self.view4 addSubview:label4_3];
        [self.view addSubview:view4];
        */
        
        //view4_1
        view4_1.backgroundColor = RGB(99, 184, 255);
        UILabel *lbl4_1 = [[UILabel alloc]initWithFrame:CGRectMake(0,2,160,20)];
        lbl4_1.font = [UIFont fontWithName:@"Marker Felt" size:14];
        lbl4_1.backgroundColor = [UIColor clearColor];
        lbl4_1.numberOfLines = 1;
        lbl4_1.textAlignment = NSTextAlignmentCenter;
        lbl4_1.text = @"かがやき経由";
        [self.view4_1 addSubview:lbl4_1];
        [self.view addSubview:view4_1];
        
        
        /*----パナ----*/
        view5.backgroundColor = RGB(224, 255, 255);
        
        //ラベル「あと」
        UILabel *lbl5_0 = [[UILabel alloc]initWithFrame:CGRectMake(5,10,25,15)];
        lbl5_0.text = @"あと";
        lbl5_0.font  = [UIFont fontWithName:@"Marker Felt" size:12];
        lbl5_0.backgroundColor = [UIColor clearColor];
        [self.view5 addSubview:lbl5_0];
        //ラベル「分(00:00)」
        label5 = [[UILabel alloc]initWithFrame:CGRectMake(0,25,155,20)];
        label5.font = [UIFont fontWithName:@"Marker Felt" size:15];
        label5.backgroundColor = [UIColor clearColor];
        label5.textAlignment = NSTextAlignmentRight;
        [self.view5 addSubview:label5];
        //ラベル「00」
        label5_2 = [[UILabel alloc]initWithFrame:CGRectMake(0,8,90,40)];
        label5_2.backgroundColor = [UIColor clearColor];
        label5_2.font = [UIFont fontWithName:@"Marker Felt" size:35];
        label5_2.textAlignment = NSTextAlignmentRight;
        [self.view5 addSubview:label5_2];
        
        [self.view addSubview:view5];
        
        /*--------*/

        /*
        view5.backgroundColor = RGB(202, 255, 112);
        UILabel *label5 = [[UILabel alloc]initWithFrame:CGRectMake(62,20,50,50)];
        //[[view5 layer] setBorderColor:[RGB(0,0,0) CGColor]];
        //[[view5 layer] setBorderWidth:1.0f];
        label5.font = [UIFont fontWithName:@"Marker Felt" size:16];
        label5.backgroundColor = [UIColor clearColor];
        //int n = 10;
        label5.text = [NSString stringWithFormat:@"分"];
        [self.view5 addSubview:label5];
        label5_2 = [[UILabel alloc]initWithFrame:CGRectMake(2,15,60,50)];
        label5_2.backgroundColor = [UIColor clearColor];
        label5_2.font = [UIFont fontWithName:@"Marker Felt" size:35];
        label5_2.textAlignment = NSTextAlignmentRight;
        //int n = 10;
        //label5_2.text = [NSString stringWithFormat:@"%d",n[self.DateController method:(int)4]];
        [self.view5 addSubview:label5_2];
        UILabel *label5_3 = [[UILabel alloc]initWithFrame:CGRectMake(5,2,60,20)];
        label5_3.font = [UIFont fontWithName:@"Marker Felt" size:12];
        label5_3.text = @"パナ経由";
        label5_3.backgroundColor = RGB(202,255,112);
        [self.view5 addSubview:label5_3];
        [self.view addSubview:view5];
        */
        
        //view5_1
        view5_1.backgroundColor = RGB(99, 184, 255);
        UILabel *lbl5_1 = [[UILabel alloc]initWithFrame:CGRectMake(0,2,160,20)];
        lbl5_1.font = [UIFont fontWithName:@"Marker Felt" size:16];
        lbl5_1.backgroundColor = [UIColor clearColor];
        lbl5_1.numberOfLines = 1;
        lbl5_1.textAlignment = NSTextAlignmentCenter;
        lbl5_1.text = @"パナ経由";
        [self.view5_1 addSubview:lbl5_1];
        [self.view addSubview:view5_1];
        
        //add now 2013/3/17 below
        /*----草津----*/
        view7.backgroundColor = RGB(193, 255, 193);
        
        //ラベル「あと」
        UILabel *lbl7_0 = [[UILabel alloc]initWithFrame:CGRectMake(5,10,25,15)];
        lbl7_0.text = @"あと";
        lbl7_0.font  = [UIFont fontWithName:@"Marker Felt" size:12];
        lbl7_0.backgroundColor = [UIColor clearColor];
        [self.view7 addSubview:lbl7_0];
        //ラベル「分(00:00)」
        label7 = [[UILabel alloc]initWithFrame:CGRectMake(0,30,155,20)];
        label7.font = [UIFont fontWithName:@"Marker Felt" size:15];
        label7.backgroundColor = [UIColor clearColor];
        label7.textAlignment = NSTextAlignmentRight;
        [self.view7 addSubview:label7];
        //ラベル「00」
        label7_2 = [[UILabel alloc]initWithFrame:CGRectMake(0,13,90,40)];
        label7_2.backgroundColor = [UIColor clearColor];
        label7_2.font = [UIFont fontWithName:@"Marker Felt" size:35];
        label7_2.textAlignment = NSTextAlignmentRight;
        [self.view7 addSubview:label7_2];
        
        [self.view addSubview:view7];
        
        /*--------*/
        
        
        /*
        view7.backgroundColor = RGB(127,255,212);
        UILabel *label7 = [[UILabel alloc]initWithFrame:CGRectMake(75,20,50,50)];
        label7.font = [UIFont fontWithName:@"Marker Felt" size:16];
        label7.backgroundColor = [UIColor clearColor];
        //int n = 10;
        label7.text = [NSString stringWithFormat:@"分"];
        [self.view7 addSubview:label7];
        label7_2 = [[UILabel alloc]initWithFrame:CGRectMake(15,15,50,50)];
        label7_2.backgroundColor = [UIColor clearColor];
        label7_2.font = [UIFont fontWithName:@"Marker Felt" size:35];
        label7_2.textAlignment = NSTextAlignmentRight;
        //int n = 10;
        //label7_2.text = [NSString stringWithFormat:@"%d",n[self.DateController method:(int)8]];
        [self.view7 addSubview:label7_2];
        [self.view addSubview:view7];
        */
        
        //view7_1
        view7_1.backgroundColor = RGB(154, 205, 50);
        UILabel *lbl7_1 = [[UILabel alloc]initWithFrame:CGRectMake(0,6,160,20)];
        lbl7_1.font = [UIFont fontWithName:@"Marker Felt" size:20];
        lbl7_1.backgroundColor = [UIColor clearColor];
        lbl7_1.numberOfLines = 1;
        lbl7_1.textAlignment = NSTextAlignmentCenter;
        lbl7_1.text = @"草津行き";
        [self.view7_1 addSubview:lbl7_1];
        [self.view addSubview:view7_1];
        /*
        
        view8.backgroundColor = RGB(255,129,80);
        UILabel *label8 = [[UILabel alloc]initWithFrame:CGRectMake(30,10,80,20)];
        label8.backgroundColor = [UIColor clearColor];
        label8.font = [UIFont fontWithName:@"Marker Felt" size:20];
        label8.text = @"大津";
        [self.view addSubview:view8];
        [self.view8 addSubview:label8];
        
        view9.backgroundColor = RGB(255,129,80);
        UILabel *label9 = [[UILabel alloc]initWithFrame:CGRectMake(75,20,50,50)];
        label9.font = [UIFont fontWithName:@"Marker Felt" size:16];
        label9.backgroundColor = [UIColor clearColor];
        //int n = 10;
        label9.text = [NSString stringWithFormat:@"分"];
        [self.view9 addSubview:label9];
        label9_2 = [[UILabel alloc]initWithFrame:CGRectMake(15,15,60,50)];
        label9_2.backgroundColor = [UIColor clearColor];
        label9_2.textAlignment = NSTextAlignmentRight;
        label9_2.font = [UIFont fontWithName:@"Marker Felt" size:35];
        //int n = 10;
        label9_2.text = [NSString stringWithFormat:@"%d",n[self.DateController method:(int)9]];
        [self.view9 addSubview:label9_2];
        [self.view addSubview:view9];*/
        
        /*----瀬田----*/
        view11.backgroundColor = RGB(250, 250, 210);
        
        //ラベル「あと」
        UILabel *lbl11_0 = [[UILabel alloc]initWithFrame:CGRectMake(5,10,25,15)];
        lbl11_0.text = @"あと";
        lbl11_0.font  = [UIFont fontWithName:@"Marker Felt" size:12];
        lbl11_0.backgroundColor = [UIColor clearColor];
        [self.view11 addSubview:lbl11_0];
        //ラベル「分(00:00)」
        label11 = [[UILabel alloc]initWithFrame:CGRectMake(0,30,155,20)];
        label11.font = [UIFont fontWithName:@"Marker Felt" size:15];
        label11.backgroundColor = [UIColor clearColor];
        label11.textAlignment = NSTextAlignmentRight;
        [self.view11 addSubview:label11];
        //ラベル「00」
        label11_2 = [[UILabel alloc]initWithFrame:CGRectMake(0,13,90,40)];
        label11_2.backgroundColor = [UIColor clearColor];
        label11_2.font = [UIFont fontWithName:@"Marker Felt" size:35];
        label11_2.textAlignment = NSTextAlignmentRight;
        [self.view11 addSubview:label11_2];
        
        [self.view addSubview:view11];
        
        /*--------*/

        /*
        view10.backgroundColor = RGB(218,112,214);
        //UILabel *label7 = [[UILabel alloc]initWithFrame:CGRectMake(225,250,90,20)];
        UILabel *label10 = [[UILabel alloc]initWithFrame:CGRectMake(30,10,80,20)];
        label10.font = [UIFont fontWithName:@"Marker Felt" size:20];
        label10.backgroundColor = [UIColor clearColor];
        label10.text = @"瀬田";
        [self.view addSubview:view10];
        [self.view10 addSubview:label10];
         */
        /*
        view11.backgroundColor = RGB(218,112,214);
        UILabel *label11 = [[UILabel alloc]initWithFrame:CGRectMake(75,20,50,50)];
        label11.font = [UIFont fontWithName:@"Marker Felt" size:16];
        label11.backgroundColor = [UIColor clearColor];*/
        //view11_1
        view11_1.backgroundColor = RGB(205, 205, 0);
        UILabel *lbl11_1 = [[UILabel alloc]initWithFrame:CGRectMake(0,6,160,20)];
        lbl11_1.font = [UIFont fontWithName:@"Marker Felt" size:20];
        lbl11_1.backgroundColor = [UIColor clearColor];
        lbl11_1.numberOfLines = 1;
        lbl11_1.textAlignment = NSTextAlignmentCenter;
        lbl11_1.text = @"瀬田行き";
        [self.view11_1 addSubview:lbl11_1];
        [self.view addSubview:view11_1];
        /*
        //int n = 10;
        label11.text = [NSString stringWithFormat:@"分"];
        [self.view11 addSubview:label11];
        label11_2 = [[UILabel alloc]initWithFrame:CGRectMake(15,15,60,50)];
        label11_2.backgroundColor = [UIColor clearColor];
        label11_2.textAlignment = NSTextAlignmentRight;
        label11_2.font = [UIFont fontWithName:@"Marker Felt" size:35];
        /*num = [self.dateController returnMin:10];
        NSLog(@"minutes is %d",num);
        if(num > 200){
            label16_2.text = @"終";
        }else{
            //label16_2.text = [NSString stringWithFormat:@"%3d",num];
        }
         
        [self.view11 addSubview:label11_2];
        [self.view addSubview:view11];
        */

        /*
        view6.backgroundColor = RGB(205,149,12);
        UILabel *label6 = [[UILabel alloc]initWithFrame:CGRectMake(82,10,80,20)];
        label6.backgroundColor = [UIColor clearColor];
        label6.text = @"草津";
        [self.view addSubview:view6];
        [self.view6 addSubview:label6];
        
        view7.backgroundColor = RGB(255,215,0);
        UILabel *label7 = [[UILabel alloc]initWithFrame:CGRectMake(75,20,50,50)];
        label7.backgroundColor = [UIColor clearColor];
        //int n = 10;
        label7.text = [NSString stringWithFormat:@"分"];
        [self.view7 addSubview:label7];
        label7_2 = [[UILabel alloc]initWithFrame:CGRectMake(20,15,50,50)];
        label7_2.backgroundColor = [UIColor clearColor];
        label7_2.font = [UIFont fontWithName:@"Marker Felt" size:40];
        //int n = 10;*/
        /*
        label7_2.text = [NSString stringWithFormat:@"%d",n[self.DateController method:(int)5]];
        [self.view7 addSubview:label7_2];
        UILabel *label7_3 = [[UILabel alloc]initWithFrame:CGRectMake(5,2,80,20)];
        label7_3.font = [UIFont fontWithName:@"Marker Felt" size:12];
        label7_3.text = @"かがやき経由";
        label7_3.backgroundColor = [UIColor clearColor];
        [self.view7 addSubview:label7_3];
        [self.view addSubview:view7];
        
        view8.backgroundColor = RGB(255,193,37);
        UILabel *label8 = [[UILabel alloc]initWithFrame:CGRectMake(75,20,50,50)];
        label8.backgroundColor = [UIColor clearColor];
        //int n = 10;
        label8.text = [NSString stringWithFormat:@"分"];
        [self.view8 addSubview:label8];
        label8_2 = [[UILabel alloc]initWithFrame:CGRectMake(20,15,50,50)];
        label8_2.backgroundColor = [UIColor clearColor];
        label8_2.font = [UIFont fontWithName:@"Marker Felt" size:40];
        //int n = 10;
        label8_2.text = [NSString stringWithFormat:@"%d",n[self.DateController method:(int)6]];
        [self.view8 addSubview:label8_2];
        UILabel *label8_3 = [[UILabel alloc]initWithFrame:CGRectMake(5,2,60,20)];
        label8_3.font = [UIFont fontWithName:@"Marker Felt" size:12];
        label8_3.text = @"パナ経由";
        label8_3.backgroundColor = [UIColor clearColor];
        [self.view8 addSubview:label8_3];
        [self.view addSubview:view8];
        
        view9.backgroundColor = RGB(30,144,255);
        UILabel *label9 = [[UILabel alloc]initWithFrame:CGRectMake(30,13,80,20)];
        label9.backgroundColor = [UIColor clearColor];
        label9.text = @"瀬田";
        [self.view addSubview:view9];
        [self.view9 addSubview:label9];
        
       
        view10.backgroundColor = RGB(99,184,255);
        UILabel *label10 = [[UILabel alloc]initWithFrame:CGRectMake(75,20,50,50)];
        label10.backgroundColor = [UIColor clearColor];
        //int n = 10;
        label10.text = [NSString stringWithFormat:@"分"];
        [self.view10 addSubview:label10];
        label10_2 = [[UILabel alloc]initWithFrame:CGRectMake(20,15,50,50)];
        label10_2.backgroundColor = [UIColor clearColor];
        label10_2.font = [UIFont fontWithName:@"Marker Felt" size:40];
        //int n = 10;
        label10_2.text = [NSString stringWithFormat:@"%d",n[self.DateController method:(int)7]];
        [self.view10 addSubview:label10_2];
        [self.view addSubview:view10];
        */
        /*
        view12.backgroundColor = RGB(162,205,90);
        UILabel *label12 = [[UILabel alloc]initWithFrame:CGRectMake(5,2,80,20)];
        label12.backgroundColor = [UIColor clearColor];
        label12.text = @"長寿社会福祉";
        label12.font = [UIFont fontWithName:@"Marker Felt" size:13];
        label12_2 = [[UILabel alloc]initWithFrame:CGRectMake(37,17,80,20)];
        label12_2.backgroundColor = [UIColor clearColor];
        label12_2.text = @"センター";
        label12_2.font = [UIFont fontWithName:@"Marker Felt" size:13];
        [self.view addSubview:view12];
        [self.view12 addSubview:label12];
        [self.view12 addSubview:label12_2];
        
        view13.backgroundColor = RGB(162,205,90);
        UILabel *label13 = [[UILabel alloc]initWithFrame:CGRectMake(75,20,50,50)];
        label13.font = [UIFont fontWithName:@"Marker Felt" size:16];
        label13.backgroundColor = [UIColor clearColor];
        //int n = 10;
        label13.text = [NSString stringWithFormat:@"分"];
        [self.view13 addSubview:label13];
        label13_2 = [[UILabel alloc]initWithFrame:CGRectMake(15,15,60,50)];
        label13_2.backgroundColor = [UIColor clearColor];
        label13_2.font = [UIFont fontWithName:@"Marker Felt" size:35];
        label13_2.textAlignment = NSTextAlignmentRight;
        //int n = 10;
        label13_2.text = [NSString stringWithFormat:@"%d",n[self.DateController method:(int)8]];
        [self.view13 addSubview:label13_2];
        [self.view addSubview:view13];
        */
        
        //衣笠
        
        view15.backgroundColor = RGB(255, 231, 186);
        
        //ラベル「あと」
        UILabel *lbl15_0 = [[UILabel alloc]initWithFrame:CGRectMake(5,10,25,15)];
        lbl15_0.text = @"あと";
        lbl15_0.font  = [UIFont fontWithName:@"Marker Felt" size:12];
        lbl15_0.backgroundColor = [UIColor clearColor];
        [self.view15 addSubview:lbl15_0];
        //ラベル「分(00:00)」
        label15 = [[UILabel alloc]initWithFrame:CGRectMake(0,30,155,20)];
        label15.font = [UIFont fontWithName:@"Marker Felt" size:15];
        label15.backgroundColor = [UIColor clearColor];
        label15.textAlignment = NSTextAlignmentRight;
        [self.view15 addSubview:label15];
        //ラベル「00」
        label15_2 = [[UILabel alloc]initWithFrame:CGRectMake(0,13,90,40)];
        label15_2.backgroundColor = [UIColor clearColor];
        label15_2.font = [UIFont fontWithName:@"Marker Felt" size:35];
        label15_2.textAlignment = NSTextAlignmentRight;
        [self.view15 addSubview:label15_2];
        [self.view addSubview:view15];

        
        //view15_1
        view15_1.backgroundColor = RGB(238, 59, 59);
        UILabel *lbl15_1 = [[UILabel alloc]initWithFrame:CGRectMake(0,3,160,30)];
        lbl15_1.font = [UIFont fontWithName:@"Marker Felt" size:20];
        lbl15_1.backgroundColor = [UIColor clearColor];
        lbl15_1.textAlignment = NSTextAlignmentCenter;
        lbl15_1.numberOfLines = 1;
        lbl15_1.text = @"衣笠行き";
        [self.view15_1 addSubview:lbl15_1];
        [self.view addSubview:view15_1];
        
        /*----中書島----*/
        view17.backgroundColor = RGB(255, 187, 255);
        
        //ラベル「あと」
        UILabel *lbl17_0 = [[UILabel alloc]initWithFrame:CGRectMake(5,10,25,15)];
        lbl17_0.text = @"あと";
        lbl17_0.font  = [UIFont fontWithName:@"Marker Felt" size:12];
        lbl17_0.backgroundColor = [UIColor clearColor];
        [self.view17 addSubview:lbl17_0];
        //ラベル「分(00:00)」
        label17 = [[UILabel alloc]initWithFrame:CGRectMake(0,30,155,20)];
        label17.font = [UIFont fontWithName:@"Marker Felt" size:15];
        label17.backgroundColor = [UIColor clearColor];
        label17.textAlignment = NSTextAlignmentRight;
        [self.view17 addSubview:label17];
        //ラベル「00」
        label17_2 = [[UILabel alloc]initWithFrame:CGRectMake(0,13,90,40)];
        label17_2.backgroundColor = [UIColor clearColor];
        label17_2.font = [UIFont fontWithName:@"Marker Felt" size:35];
        label17_2.textAlignment = NSTextAlignmentRight;
        [self.view17 addSubview:label17_2];
        [self.view addSubview:view17];
        
        /*--------*/

        /*
        view17.backgroundColor = RGB(255,165,79);
        UILabel *label17 = [[UILabel alloc]initWithFrame:CGRectMake(75,20,50,50)];
        label17.font = [UIFont fontWithName:@"Marker Felt" size:16];
        label17.backgroundColor = [UIColor clearColor];
        //int n = 10;
        label17.text = [NSString stringWithFormat:@"分"];
        [self.view17 addSubview:label17];
        label17_2 = [[UILabel alloc]initWithFrame:CGRectMake(15,15,60,50)];
        label17_2.backgroundColor = [UIColor clearColor];
        label17_2.font = [UIFont fontWithName:@"Marker Felt" size:35];
        label17_2.textAlignment = NSTextAlignmentRight;
        num = [self.dateController returnMin:10];
         */
        //view17_1
        view17_1.backgroundColor = RGB(159, 121, 238);
        UILabel *lbl17_1 = [[UILabel alloc]initWithFrame:CGRectMake(0,3,160,30)];
        lbl17_1.font = [UIFont fontWithName:@"Marker Felt" size:20];
        lbl17_1.backgroundColor = [UIColor clearColor];
        lbl17_1.numberOfLines = 1;
        lbl17_1.textAlignment = NSTextAlignmentCenter;
        lbl17_1.text = @"中書島行き";
        [self.view17_1 addSubview:lbl17_1];
        [self.view addSubview:view17_1];
        
        
        }
return self;
    //[self dealloc];
}


-(void)dealloc{
    //[self release];
    [super dealloc];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self init];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
