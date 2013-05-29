//
//  newRitsViewController.m
//  BKCBusTable
//
//  Created by sato daisuke on 13/05/11.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import "newRitsViewController.h"

@interface newRitsViewController ()

@end

@implementation newRitsViewController
@synthesize fromUniv;

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
    fromUniv = [[tableViewFromUnivController alloc]init];
    [self addChildViewController:fromUniv];
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
