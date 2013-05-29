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
//pリストを格納する配列。
@property(nonatomic,retain)NSMutableArray *arrayCHU_1,*arrayCHU_2,*arrayMKS_1,*arrayMKS_2,*arrayMKG_1,*arrayMKG_2,*arrayMPN_1,*arrayMPN_2,*arrayKST_1,*arrayKST_2,*arraySET_1,*arraySET_2,*arrayKNG_1,*arrayKNG_2,*arrayMTY_1,*arrayMTY_2;
@property(nonatomic,retain)NSArray *tArr;//pリストから取得したデータを一時格納しておく
@property(nonatomic,retain)NSDictionary *tDict;
@property(nonatomic,retain)NSString *minStr,*minStr2,*remStr1,*remStr2;
@property(nonatomic,retain)NSNumber *num2;
@property(nonatomic,retain)NSMutableArray *arrForTable,*arrForValue,*finalArr,*arrForColor;
-(int)returnMin:(int)n;
-(NSMutableArray *)sort:(NSArray *)arr;
//-(NSMutableArray *)sortArr:(NSMutableArray *)arr;
-(NSMutableArray *)returnArrToBusTable:(int)i;
-(NSMutableArray *)outputArrForColor;

@end
