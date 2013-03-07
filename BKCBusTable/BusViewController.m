//
//  BusViewController.m
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/06.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import "BusViewController.h"

@interface BusViewController ()

@end

@implementation BusViewController
@synthesize arr;

-(id)init{
    self = [super init];
    if(self){
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(110,30,300,50)];
    label.text = @"BKCバス時刻表";
    [self.view addSubview:label];
    
        //セグメントボタン生成
        arr = [NSArray arrayWithObjects:@"南草津",@"瀬田/草津",@"中書島/衣笠",nil];
        UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:arr];
        seg.frame = CGRectMake(5,320,310,30);
        seg.segmentedControlStyle = UITableViewStylePlain;
        seg.selectedSegmentIndex = 0;
        [seg addTarget:self action:@selector(changed)
      forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:seg];

    }
    return self;
}

-(void)changed{

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
