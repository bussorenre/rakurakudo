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
    UIView *view1,*view2,*view3,*view4,*view5,*view6,*view7,*view8,*view9,*view10,*view11,*view12,*view13,*view14,*view15,*view16;
    DateController *dateController;
       AdWhirlView *adView;
}
@property (strong,nonatomic) AdWhirlView *adView;
@property(nonatomic,retain)UIView *view1,*view2,*view3,*view4,*view5,*view6,*view7,*view8,*view9,*view10,*view11,*view12,*view13,*view14,*view15,*view16;
@property(nonatomic,retain)DateController *dateController;
@end

