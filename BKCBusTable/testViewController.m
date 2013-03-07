//
//  testViewController.m
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/07.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()

@end

@implementation testViewController

-(void)configureView{
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100,100,300,50)];
    label.text = @"hoge";
    [self.view addSubview:label];

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
    [self configureView];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
