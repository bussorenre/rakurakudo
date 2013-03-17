//
//  AppDelegate.h
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/06.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    ViewController *viewController;
}

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,retain)ViewController *viewContoller;

@end
