//
//  DateController.h
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/07.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 
 ----このコントローラについて----
 このコントローラで、pリストからデータを配列に格納する。

 pリストからキーを配列keyArrに格納
 配列keyArrを、キーの値（時刻）で並び替える。（値の小さい順）
 
 上記の操作は初回の起動時のみ実行する。
 それ以降はユーザデフォルトに保存しておく(??)
 
 現在時刻と比較するメソッドも実装
 -(NSMutableArray *)compare;
 現在時刻と比較し、並び替えられた配列（要素１０個）が戻り値として返される
 
曜日によって場合分け
 平日と休日
 
 pリストは平日用と休日用のふたつ
 
 キー値を配列に格納、キー値の最初の数字だけ別に格納
 バリュー値を配列に格納、ソート
 バリュー値で比較

 
 */

@interface DateController : NSObject
{
    NSArray *keyArr;
    NSMutableArray *valueArr; //pリストのキー、バリュー
    NSDate *dataNow; //現在時刻
    NSMutableArray *key,*returnedArr,*sortedArr;//返される配列 ここに１０個の要素（時刻）を格納する
    NSDictionary *dictV;
    
    /*----pリスト別変数----*/
    /*立命館大学発
     行き先                　pリスト名        キー値  バリュー     NSString    NSDictionary     NSArray
     南草津（笠山経由)       　timetableMKS     時刻     1        pathMKS       dictMKS      keyArrMKS
     南草津（直行）           timetableMTK             2        pathMTK        dictMTK      keyArrMTK
     南草津（かがやき通り経由）  timetableMKG             3        pathMKG       dictMKG       keyArrMKG
     南草津（パナ経由 ）       timetableMPN             4        pathMPN       dicMPN       keyArrMPN
     草津（かがやき通り経由）   timetableKKG             5        pathKKG        dictKKG       keyArrKKG
     草津（ぱな経由）          timetableKPN            6         pathKPN       dictKPN       keyArrKPN
     瀬田                   timetableSET             7        pathSET        dictSET       keyArrSET
     長寿社会福祉センター      timetableTYO             8         pathTYO        dictTYO       keyArrTYO
     大津                   timetableOTS             9        pathOTS        dictOTS       keyArrOTS
     中書島                 timetableCHU             10        pathCHU        dictCHU       keyArrCHU
    
    NSString *pathMKS,*pathMTK,*pathMKG,*pathMPN,*pathKKG,*pathKPN,*pathSET,*pathTYO,*pathOTS,*pathCHU;
    NSDictionary *dictMKS,*dictMTK,*dictMKG,*dictMPN,*dictKKG,*dictKPN,*dictSET,*dictTYO,*dictOTS,*dictCHU;
    NSArray *keyArrMKS,*keyArrMTK,*keyArrMKG,*keyArrMPN,*keyArrKKG,*keyArrKPN,*keyArrSET,*keyArrTYO,*keyArrOTS,*keyArrCHU;
     */
    
    
    /*ボックス版*/
    //起動時に全pリストを配列に格納する。初回のみ
    //残りの分数を返す場合、メソッドを１つ用意し、そのメソッドで現在時刻と比較、計算し残り分数を返す
    NSMutableArray *arrayCHU_1,*arrayCHU_2,*arrayMKS_1,*arrayMKS_2,*arrayMKG_1,*arrayMKG_2,*arrayMPN_1,*arrayMPN_2,*arrayKST_1,*arrayKST_2,*arraySET_1,*arraySET_2,*arrarKNG_1,*arrayKNG_2,*arrayMTY_1,*arrayMTY_2;
    NSDictionary *dictCHU_1,*dictCHU_2;
    NSArray *yArr;
    NSDictionary *tDict;
    NSString *minStr,*minStr2,*remStr1,*remStr2;;
    NSNumber *num2;
    //int num;
    
    //時刻表
    NSMutableArray *arrForTable,*arrForValue,*arrForColor;
    
    
}
-(int)returnMin:(int)n;
-(NSMutableArray *)sort:(NSArray *)arr;

-(void)setKeyArr;
-(NSMutableArray *)compare;
-(BOOL)setArrForComp:(NSString *)str;
-(NSMutableArray *)sortArr:(NSMutableArray *)arr;
-(NSMutableArray *)returnArrToBusTable:(int)i;
@property(nonatomic, retain)NSArray *keyArr;
@property(nonatomic,retain)NSMutableArray *key,*valueArr,*returnedArr,*sortedArr;
@property(nonatomic,retain)NSDictionary *dictV;
@property(nonatomic,retain)NSMutableArray *arrayCHU_1,*arrayCHU_2,*arrayMKS_1,*arrayMKS_2,*arrayMKG_1,*arrayMKG_2,*arrayMPN_1,*arrayMPN_2,*arrayKST_1,*arrayKST_2,*arraySET_1,*arraySET_2,*arrayKNG_1,*arrayKNG_2,*arrayMTY_1,*arrayMTY_2;
@property(nonatomic,retain)NSDictionary *dictCHU_1,*dictCHU_2;
@property(nonatomic,retain)NSArray *tArr;
@property(nonatomic,retain)NSDictionary *tDict;
@property(nonatomic,retain)NSString *minStr,*minStr2,*remStr1,*remStr2;
@property(nonatomic,retain)NSNumber *num2;
@property(nonatomic,retain)NSMutableArray *arrForTable,*arrForValue,*finalArr,*arrForColor;
//@property(nonatomic,retain)int num;
@end
