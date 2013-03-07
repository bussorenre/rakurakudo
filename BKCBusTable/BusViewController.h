//
//  BusViewController.h
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/06.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BusViewController : UIViewController
{
    NSArray *arr;
  
}
//@property(nonatomic,retain)BusViewController *BusViewController;
@property(nonatomic,retain)NSArray *arr;
-(void)changed;
@end
