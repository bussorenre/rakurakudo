//
//  FromRitsViewController.h
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/09.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateController.h"
#import "AdWhirlView.h"
#import "AdWhirlDelegateProtocol.h"

@interface FromRitsViewController : UIViewController /*<AdWhirlDelegate>*/
{
    UIView *view1,*view2_1,*view2,*view3,*view3_1,*view4,*view4_1,*view5,*view5_1,*view6,*view6_1,*view7,*view7_1,*view8,*view9,*view10,*view10_1,*view11,*view11_1,*view12,*view13,*view14,*view14_1,*view15,*view15_1,*view16,*view16_1,*view17,*view17_1;
    DateController *dateController;
       AdWhirlView *adView;
    UILabel *label2,*label2_2, *label2_3,*label2_4,
    *label3_2,
    *label4,*label4_2,*label4_3,*label4_4,
    *label5,*label5_2,*label5_3,*label5_4,
    *label6_2,
    *label7,*label7_2,*label7_3,*label7_4,
    *label8_2, *label9_2,*label10_2,
    *label11,*label11_2,*label11_3,*label11_4,*label12_2,*label13_2,*label14_2, *label15_2,*label16_2,
    *label17,*label17_2,*label17_3,*label17_4;
}
@property (strong,nonatomic) AdWhirlView *adView;
@property(nonatomic,retain)UIView *view1,*view2_1,*view2,*view3,*view3_1,*view4,*view4_1,*view5,*view5_1,*view6,*view6_1,*view7,*view7_1,*view8,*view9,*view10,*view10_1,*view11,*view11_1,*view12,*view13,*view14,*view14_1,*view15,*view15_1,*view16,*view16_1,*view17,*view17_1;
@property(nonatomic,retain)DateController *dateController;
@property(nonatomic,retain)UILabel *label2,*label2_2, *label2_3,*label2_4,
*label3_2,
*label4,*label4_2,*label4_3,*label4_4,
*label5,*label5_2,*label5_3,*label5_4,
*label6_2,
*label7,*label7_2,*label7_3,*label7_4,
*label8_2, *label9_2,*label10_2,
*label11,*label11_2,*label11_3,*label11_4, *label12_2, *label13_2,*label14_2, *label15_2,*label16_2,
*label17,*label17_2,*label17_3,*label17_4;
@end

