//
//  FromRitsViewController.m
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/09.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import "FromRitsViewController.h"
#import "DateController.h"

//UIColor定義 RGB(,,);
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


@interface FromRitsViewController ()

@end

@implementation FromRitsViewController
@synthesize view1,view2,view3,view4,view5,view6,view7,view8,view9,view10,view11,view12,view13,view14,view15,view16;
@synthesize adView;
@synthesize dateController;
-(id)init{

    self = [super init];
    if(self){
        
        
        dateController = [[DateController alloc]init];
        int num = 0;;
        
        
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
        
        CGRect frame = [[UIScreen mainScreen] applicationFrame];
        
        if (frame.size.height > 500.0) { // iPhone 4inch (568 - 20 px)
            NSLog(@"in height = 548");
            
            // iPhone5 のときの処理
            view1.frame = CGRectMake(5,123,310,35);
            view2.frame = CGRectMake(5,157,77.5,70);
            view3.frame = CGRectMake(82.5,157,77.5,70);
            view4.frame = CGRectMake(160,157,77.5,70);
            view5.frame = CGRectMake(237.5,157,77.5,70);
            view6.frame = CGRectMake(5,232,200,35);
            view7.frame = CGRectMake(5,267,100,70);
            view8.frame = CGRectMake(105,267,100,70);
            view9.frame = CGRectMake(210,232,105,35);
            view10.frame = CGRectMake(210,267,105,70);
            view11.frame = CGRectMake(5,342,100,35);
            view12.frame = CGRectMake(5,377,100,70);
            view13.frame = CGRectMake(110,342,100,35);
            view14.frame = CGRectMake(110,377,100,70);
            view15.frame = CGRectMake(215,342,100,35);
            view16.frame = CGRectMake(215,377,100,70);
            
        } else { // iPhone 3.5inch
            
            // iPhone5より前のモデル のときの処理
            view1.frame = CGRectMake(5,43,310,35);
            view2.frame = CGRectMake(5,77,77.5,70);
            view3.frame = CGRectMake(82.5,77,77.5,70);
            view4.frame = CGRectMake(160,77,77.5,70);
            view5.frame = CGRectMake(237.5,77,77.5,70);
            view6.frame = CGRectMake(5,152,200,35);
            view7.frame = CGRectMake(5,187,100,70);
            view8.frame = CGRectMake(105,187,100,70);
            view9.frame = CGRectMake(210,152,105,35);
            view10.frame = CGRectMake(210,187,105,70);
            view11.frame = CGRectMake(5,262,100,35);
            view12.frame = CGRectMake(5,297,100,70);
            view13.frame = CGRectMake(110,262,100,35);
            view14.frame = CGRectMake(110,297,100,70);
            view15.frame = CGRectMake(215,262,100,35);
            view16.frame = CGRectMake(215,297,100,70);
        }
        
        view1.backgroundColor = RGB(127,255,0);
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(130,10,100,20)];
        label1.backgroundColor = [UIColor clearColor];
        label1.text = @"南草津";
        [self.view1 addSubview:label1];
        [self.view addSubview:view1];
        
        view2.backgroundColor = RGB(84,255,159);
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(50,20,50,50)];
        label2.backgroundColor = [UIColor clearColor];
        int n = 10;
        label2.text = [NSString stringWithFormat:@"分"];
        [self.view2 addSubview:label2];
        UILabel *label2_2 = [[UILabel alloc]initWithFrame:CGRectMake(5,15,50,50)];
        label2_2.backgroundColor = [UIColor clearColor];
        label2_2.font = [UIFont fontWithName:@"Marker Felt" size:40];
        //int n = 10;
        label2_2.text = [NSString stringWithFormat:@"%d",n/*[self.DateController method:(int)1]*/];
        [self.view2 addSubview:label2_2];
        UILabel *label2_3 = [[UILabel alloc]initWithFrame:CGRectMake(5,2,60,20)];
        label2_3.font = [UIFont fontWithName:@"Marker Felt" size:12];
        label2_3.text = @"笠山経由";
        label2_3.backgroundColor = [UIColor clearColor];
        [self.view2 addSubview:label2_3];
        [self.view addSubview:view2];
        
        view3.backgroundColor = RGB(154,255,154);
        UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(50,20,50,50)];
        label3.backgroundColor = [UIColor clearColor];
        //int n = 10;
        label3.text = [NSString stringWithFormat:@"分"];
        [self.view3 addSubview:label3];
        UILabel *label3_2 = [[UILabel alloc]initWithFrame:CGRectMake(5,15,50,50)];
        label3_2.backgroundColor = [UIColor clearColor];
        label3_2.font = [UIFont fontWithName:@"Marker Felt" size:40];
        //int n = 10;
        label3_2.text = [NSString stringWithFormat:@"%d",n/*[self.DateController method:(int)2]*/];
        [self.view3 addSubview:label3_2];
        UILabel *label3_3 = [[UILabel alloc]initWithFrame:CGRectMake(5,2,60,20)];
        label3_3.font = [UIFont fontWithName:@"Marker Felt" size:12];
        label3_3.text = @"直行";
        label3_3.backgroundColor = [UIColor clearColor];
        [self.view3 addSubview:label3_3];
        [self.view addSubview:view3];
        
        view4.backgroundColor = RGB(0,255,127);
        UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(50,20,50,50)];
        label4.backgroundColor = [UIColor clearColor];
        //int n = 10;
        label4.text = [NSString stringWithFormat:@"分"];
        [self.view4 addSubview:label4];
        UILabel *label4_2 = [[UILabel alloc]initWithFrame:CGRectMake(5,15,50,50)];
        label4_2.backgroundColor = [UIColor clearColor];
        label4_2.font = [UIFont fontWithName:@"Marker Felt" size:40];
        //int n = 10;
        label4_2.text = [NSString stringWithFormat:@"%d",n/*[self.DateController method:(int)3]*/];
        [self.view4 addSubview:label4_2];
        UILabel *label4_3 = [[UILabel alloc]initWithFrame:CGRectMake(5,2,72,20)];
        label4_3.font = [UIFont fontWithName:@"Marker Felt" size:12];
        label4_3.text = @"かがやき経由";
        label4_3.backgroundColor = [UIColor clearColor];
        [self.view4 addSubview:label4_3];
        [self.view addSubview:view4];
        
        view5.backgroundColor = RGB(0,255,0);
        UILabel *label5 = [[UILabel alloc]initWithFrame:CGRectMake(50,20,50,50)];
        label5.backgroundColor = [UIColor clearColor];
        //int n = 10;
        label5.text = [NSString stringWithFormat:@"分"];
        [self.view5 addSubview:label5];
        UILabel *label5_2 = [[UILabel alloc]initWithFrame:CGRectMake(5,15,50,50)];
        label5_2.backgroundColor = [UIColor clearColor];
        label5_2.font = [UIFont fontWithName:@"Marker Felt" size:40];
        //int n = 10;
        label5_2.text = [NSString stringWithFormat:@"%d",n/*[self.DateController method:(int)4]*/];
        [self.view5 addSubview:label5_2];
        UILabel *label5_3 = [[UILabel alloc]initWithFrame:CGRectMake(5,2,60,20)];
        label5_3.font = [UIFont fontWithName:@"Marker Felt" size:12];
        label5_3.text = @"パナ経由";
        label5_3.backgroundColor = [UIColor clearColor];
        [self.view5 addSubview:label5_3];
        [self.view addSubview:view5];
        
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
        UILabel *label7_2 = [[UILabel alloc]initWithFrame:CGRectMake(20,15,50,50)];
        label7_2.backgroundColor = [UIColor clearColor];
        label7_2.font = [UIFont fontWithName:@"Marker Felt" size:40];
        //int n = 10;
        label7_2.text = [NSString stringWithFormat:@"%d",n/*[self.DateController method:(int)5]*/];
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
        UILabel *label8_2 = [[UILabel alloc]initWithFrame:CGRectMake(20,15,50,50)];
        label8_2.backgroundColor = [UIColor clearColor];
        label8_2.font = [UIFont fontWithName:@"Marker Felt" size:40];
        //int n = 10;
        label8_2.text = [NSString stringWithFormat:@"%d",n/*[self.DateController method:(int)6]*/];
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
        UILabel *label10_2 = [[UILabel alloc]initWithFrame:CGRectMake(20,15,50,50)];
        label10_2.backgroundColor = [UIColor clearColor];
        label10_2.font = [UIFont fontWithName:@"Marker Felt" size:40];
        //int n = 10;
        label10_2.text = [NSString stringWithFormat:@"%d",n/*[self.DateController method:(int)7]*/];
        [self.view10 addSubview:label10_2];
        [self.view addSubview:view10];
        
        view11.backgroundColor = RGB(255,20,147);
        UILabel *label11 = [[UILabel alloc]initWithFrame:CGRectMake(5,5,80,20)];
        label11.backgroundColor = [UIColor clearColor];
        label11.text = @"長寿社会福祉";
        label11.font = [UIFont fontWithName:@"Marker Felt" size:13];
        UILabel *label11_2 = [[UILabel alloc]initWithFrame:CGRectMake(35,20,80,20)];
        label11_2.backgroundColor = [UIColor clearColor];
        label11_2.text = @"センター";
        label11_2.font = [UIFont fontWithName:@"Marker Felt" size:13];
        [self.view addSubview:view11];
        [self.view11 addSubview:label11];
        [self.view11 addSubview:label11_2];
        
        view12.backgroundColor = RGB(255,110,180);
        UILabel *label12 = [[UILabel alloc]initWithFrame:CGRectMake(75,20,50,50)];
        label12.backgroundColor = [UIColor clearColor];
        //int n = 10;
        label12.text = [NSString stringWithFormat:@"分"];
        [self.view12 addSubview:label12];
        UILabel *label12_2 = [[UILabel alloc]initWithFrame:CGRectMake(20,15,50,50)];
        label12_2.backgroundColor = [UIColor clearColor];
        label12_2.font = [UIFont fontWithName:@"Marker Felt" size:40];
        //int n = 10;
        label12_2.text = [NSString stringWithFormat:@"%d",n/*[self.DateController method:(int)8]*/];
        [self.view12 addSubview:label12_2];
        [self.view addSubview:view12];
        
        view13.backgroundColor = RGB(255,211,155);
        UILabel *label13 = [[UILabel alloc]initWithFrame:CGRectMake(30,10,80,20)];
        label13.backgroundColor = [UIColor clearColor];
        label13.text = @"大津";
        [self.view addSubview:view13];
        [self.view13 addSubview:label13];
        
        view14.backgroundColor = RGB(255,231,186);
        UILabel *label14 = [[UILabel alloc]initWithFrame:CGRectMake(75,20,50,50)];
        label14.backgroundColor = [UIColor clearColor];
        //int n = 10;
        label14.text = [NSString stringWithFormat:@"分"];
        [self.view14 addSubview:label14];
        UILabel *label14_2 = [[UILabel alloc]initWithFrame:CGRectMake(20,15,50,50)];
        label14_2.backgroundColor = [UIColor clearColor];
        label14_2.font = [UIFont fontWithName:@"Marker Felt" size:40];
        //int n = 10;
        label14_2.text = [NSString stringWithFormat:@"%d",n/*[self.DateController method:(int)9]*/];
        [self.view14 addSubview:label14_2];
        [self.view addSubview:view14];
        
        view15.backgroundColor = RGB(191,62,255);
        //UILabel *label7 = [[UILabel alloc]initWithFrame:CGRectMake(225,250,90,20)];
        UILabel *label15 = [[UILabel alloc]initWithFrame:CGRectMake(25,10,90,20)];
        label15.backgroundColor = [UIColor clearColor];
        label15.text = @"中書島";
        [self.view addSubview:view15];
        [self.view15 addSubview:label15];
        
        view16.backgroundColor = RGB(171,130,255);
        UILabel *label16 = [[UILabel alloc]initWithFrame:CGRectMake(75,20,50,50)];
        label16.backgroundColor = [UIColor clearColor];
        //int n = 10;
        label16.text = [NSString stringWithFormat:@"分"];
        [self.view16 addSubview:label16];
        UILabel *label16_2 = [[UILabel alloc]initWithFrame:CGRectMake(20,15,50,50)];
        label16_2.backgroundColor = [UIColor clearColor];
        label16_2.font = [UIFont fontWithName:@"Marker Felt" size:40];
        num = [self.dateController returnMin:10];
        if(num > 200){
            label16_2.text = @"終";
        }else{
        label16_2.text = [NSString stringWithFormat:@"%d",num];
        }
        [self.view16 addSubview:label16_2];
        [self.view addSubview:view16];
        
        
        /*AdWhirl設定*/
        /*
        adView = [AdWhirlView requestAdWhirlViewWithDelegate:self];
        adView.frame = CGRectMake(0.0, 480.0, 320.0, 50.0);
        [self.view addSubview:adView];
        
        */
     
        
        
        //NSArray *arr = [NSArray arrayWithObjects:view1,view2,view3,view4,view5,view6,view7,view8,view9,view10, nil];
    
    
        
    }
return self;
    //[self dealloc];
}
-(void)dealloc{
    [self release];
    [super dealloc];
}

/*AdWhirlデリゲート*/
/*
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
}*/

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
