//
//  ToRitsViewController.h
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/10.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateController.h"

@interface ToRitsViewController : UIViewController
{

    UIView *view1,*view2,*view3,*view4,*view5,*view6,*view7,*view8,*view9,*view10,*view11,*view12,*view13,*view14,*view15,*view16;
    DateController *dateController;
        UILabel *label2_2, *label3_2, *label4_2, *label5_2, *label7_2, *label8_2, *label10_2, *label11_2, *label12_2,*label14_2, *label16_2;
}
@property(nonatomic,retain)UIView *view1,*view2,*view3,*view4,*view5,*view6,*view7,*view8,*view9,*view10,*view11,*view12,*view13,*view14,*view15,*view16;
@property(nonatomic,retain)DateController *dateController;
@property(nonatomic,retain)UILabel *label2_2, *label3_2, *label4_2, *label5_2, *label7_2, *label8_2, *label10_2, *label11_2, *label12_2, *label14_2, *label16_2;

@end
