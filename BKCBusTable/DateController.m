//
//  DateController.m
//  BKCBusTable
//
//  Created by sato daisuke on 13/03/07.
//  Copyright (c) 2013年 sato daisuke. All rights reserved.
//

#import "DateController.h"

@interface DateController ()
{
    /*----pリスト別変数----*/
    /*立命館大学発
     行き先                　pリスト名        キー値  バリュー     NSString    NSDictionary     NSArray
     南草津（笠山経由)       　tTableMKS     時刻     1        pathMKS       dictMKS      keyArrMKS
     南草津（直行）           tTableMTY             2        pathMTK        dictMTK      keyArrMTK
     南草津（かがやき通り経由）  tTableMKG             3        pathMKG       dictMKG       keyArrMKG
     南草津（パナ経由 ）       tTableMPN             4        pathMPN       dicMPN       keyArrMPN
     草津（かがやき通り経由）   tTableKKG             5        pathKKG        dictKKG       keyArrKKG
     草津（ぱな経由）          tTableKPN            6         pathKPN       dictKPN       keyArrKPN
     瀬田                   timetableSET             7        pathSET        dictSET       keyArrSET
     長寿社会福祉センター      timetableTYO             8         pathTYO        dictTYO       keyArrTYO
     大津                   timetableOTS             9        pathOTS        dictOTS       keyArrOTS
     中書島                 timetableCHU             10        pathCHU        dictCHU       keyArrCHU
     
     
     */

}

@end

@implementation DateController
@synthesize arrayCHU_1,arrayCHU_2,arrayMKS_1,arrayMKS_2,arrayMKG_1,arrayMKG_2,arrayMPN_1,arrayMPN_2,arrayKST_1,arrayKST_2,arraySET_1,arraySET_2,arrayKNG_1,arrayKNG_2,arrayMTY_1,arrayMTY_2;
@synthesize tArr;
@synthesize tDict;
@synthesize minStr,minStr2,remStr1,remStr2;
@synthesize num2;
@synthesize arrForTable,arrForValue,arrForColor;
@synthesize finalArr;
-(id)init{
          self = [super init];
          if(self){
              NSLog(@"init in dateController");
              /*
               •曜日を取得、曜日別に格納するpリストを変更する（後々、pリストはサーバから変更できるようにする??）
               
               */
              /*
              //取得したpリストを格納するための配列の初期化
              //南草津（笠山経由）
              arrayMKS_1 = [[[NSMutableArray alloc]init]autorelease];//立命館発
              arrayMKS_2 = [[[NSMutableArray alloc]init]autorelease];//立命館行き
              //南草津（直通）
              arrayMTY_1 = [[[NSMutableArray alloc]init]autorelease];
              arrayMTY_2 = [[[NSMutableArray alloc]init]autorelease];
              //南草津（かがやき経由）
              arrayMKG_1 = [[[NSMutableArray alloc]init]autorelease];
              arrayMKG_2 = [[[NSMutableArray alloc]init]autorelease];
              //南草津（パナ経由）
              arrayMPN_1 = [[[NSMutableArray alloc]init]autorelease];
              arrayMPN_2 = [[[NSMutableArray alloc]init]autorelease];
              //草津
              arrayKST_1 = [[[NSMutableArray alloc]init]autorelease];
              arrayKST_2 = [[[NSMutableArray alloc]init]autorelease];
              //瀬田
              arraySET_1 = [[[NSMutableArray alloc]init]autorelease];
              arraySET_2 = [[[NSMutableArray alloc]init]autorelease];
              //衣笠
              arrayKNG_1 = [[[NSMutableArray alloc]init]autorelease];
              arrayKNG_2 = [[[NSMutableArray alloc]init]autorelease];
              //中書島
              arrayCHU_1 = [[[NSMutableArray alloc]init]autorelease];
              arrayCHU_2 = [[[NSMutableArray alloc]init]autorelease];

             */
              //曜日取得、場合分け
              NSDate *dateNow = [NSDate date];
              NSCalendar *calendar = [NSCalendar currentCalendar];
              NSUInteger flags;
              NSDateComponents *comps;
              //現在時刻取得
              flags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
              comps = [calendar components:flags fromDate:dateNow];
              //曜日取得
              comps = [calendar components:NSWeekdayCalendarUnit fromDate:dateNow];
              NSInteger weekday = comps.weekday; // 曜日(1が日曜日 7が土曜日)
              
              NSString *strMKS1,*strMKS2,*strMTY1,*strMTY2,*strMKG1,*strMKG2,*strMPN1,*strMPN2,*strKST1,*strKST2,*strSET1,*strSET2,*strKNG1,*strKNG2,*strCHU1,*strCHU2;//pathに代入
              
             // weekday = 1;
              //ここで場合わけ
               if(weekday == 2 || weekday == 3 || weekday == 4 || weekday == 5 || weekday == 6){//平日
               //南草津（笠山）
               strMKS1 = [NSString stringWithFormat:@"tTableMKS_1"];
               strMKS2 = [NSString stringWithFormat:@"tTableMKS_2"];
               //南草津（直行）
               strMTY1 = [NSString stringWithFormat:@"tTableMTY_1"];
               strMTY2 = [NSString stringWithFormat:@"tTableMTY_2"];
               //南草津（かがやき）
               strMKG1 = [NSString stringWithFormat:@"tTableMKG_1"];
               strMKG2 = [NSString stringWithFormat:@"tTableMKG_2"];
               //南草津（パナ）
               strMPN1 = [NSString stringWithFormat:@"tTableMPN_1"];
               strMPN2 = [NSString stringWithFormat:@"tTableMPN_2"];
               //草津
               strKST1 = [NSString stringWithFormat:@"tTableKST_1"];
               strKST2 = [NSString stringWithFormat:@"tTableKST_2" ];
               //瀬田
               strSET1 = [NSString stringWithFormat:@"tTableSET_1"];
               strSET2 = [NSString stringWithFormat:@"tTableSET_2"];
               //衣笠
               strKNG1 = [NSString stringWithFormat:@"tTableKNG_1"];
               strKNG2 = [NSString stringWithFormat:@"tTableKNG_2" ];
               //中書島
               strCHU1 = [NSString stringWithFormat:@"tTableCHU_1"];
               strCHU2 = [NSString stringWithFormat:@"tTableCHU_2"];

               
               }else if(weekday == 7){//土曜日
               //南草津（笠山）
               strMKS1 = [NSString stringWithFormat:@"tTableMKS_3"];
               strMKS2 = [NSString stringWithFormat:@"tTableMKS_4"];
               //南草津（直行）運休
               strMTY1 = [NSString stringWithFormat:@"tTableMTY_3"];
               strMTY2 = [NSString stringWithFormat:@"tTableMTY_4"];
               //南草津（かがやき）
               strMKG1 = [NSString stringWithFormat:@"tTableMKG_3"];
               strMKG2 = [NSString stringWithFormat:@"tTableMKG_4"];
               //南草津（パナ）
               strMPN1 = [NSString stringWithFormat:@"tTableMPN_3"];
               strMPN2 = [NSString stringWithFormat:@"tTableMPN_4"];
               //草津
               strKST1 = [NSString stringWithFormat:@"tTableKST_3"];
               strKST2 = [NSString stringWithFormat:@"tTableKST_4"];
               //瀬田
               strSET1 = [NSString stringWithFormat:@"tTableSET_3"];
               strSET2 = [NSString stringWithFormat:@"tTableSET_4"];
               //衣笠
               strKNG1 = [NSString stringWithFormat:@"tTableKNG_1"];
                   strKNG2 = [NSString stringWithFormat:@"tTableKNG_2"];
               //中書島　運休
               strCHU1 = [NSString stringWithFormat:@"tTable_CHU3"];
               strCHU2 = [NSString stringWithFormat:@"tTable_CHU4"];
               
               }else if(weekday == 1){//日曜日
               //南草津（笠山）
               strMKS1 = [NSString stringWithFormat:@"tTableMKS_3"];
               strMKS2 = [NSString stringWithFormat:@"tTableMKS_4"];
               //南草津（直行）運休
               strMTY1 = [NSString stringWithFormat:@"tTableMTY_3"];
               strMTY2 = [NSString stringWithFormat:@"tTableMTY_4"];
               //南草津（かがやき）
               strMKG1 = [NSString stringWithFormat:@"tTableMKG_3"];
               strMKG2 = [NSString stringWithFormat:@"tTableMKG_4"];
               //南草津（パナ）
               strMPN1 = [NSString stringWithFormat:@"tTableMPN_3"];
               strMPN2 = [NSString stringWithFormat:@"tTableMPN_4"];
               //草津
               strKST1 = [NSString stringWithFormat:@"tTableKST_5"];
               strKST2 = [NSString stringWithFormat:@"tTableKST_6"];
               //瀬田
               strSET1 = [NSString stringWithFormat:@"tTableSET_3"];
               strSET2 = [NSString stringWithFormat:@"tTableSET_4"];
               //衣笠
               strKNG1 = [NSString stringWithFormat:@"tTableKNG_1"];
               strKNG2 = [NSString stringWithFormat:@"tTableKNG_2"];
               //中書島 運休
                strCHU1 = [NSString stringWithFormat:@"tTableCHU_3"];
               strCHU2 = [NSString stringWithFormat:@"tTableCHU_4"];
               
               }
               else {
               NSLog(@"曜日分からへん");
               }
               

              
              NSArray *tArr1 = [[[NSArray alloc]init]autorelease];
              NSArray *tArr2 = [[[NSArray alloc]init]autorelease];
              NSDictionary *tDict1 = [[[NSDictionary alloc]init]autorelease];
              NSDictionary *tDict2 = [[[NSDictionary alloc]init]autorelease];
              NSString *path1,*path2;
              int c = 0;
              while(c<8){
                  
                  if(tArr1!= nil){
                      tArr1 = nil;
                      tArr2 = nil;
                      tDict1 = nil;
                      tDict2 = nil;
                  }
                  
                  
                  if(c == 0){//南草津（笠山）
                      path1 = [[NSBundle mainBundle] pathForResource:strMKS1 ofType:@"plist"];
                      path2 = [[NSBundle mainBundle] pathForResource:strMKS2 ofType:@"plist"];
                  }else if(c == 1){//南草津（直行）
                      path1 = [[NSBundle mainBundle] pathForResource:strMTY1 ofType:@"plist"];
                      path2 = [[NSBundle mainBundle] pathForResource:strMTY2 ofType:@"plist"];
                      

                  }else if(c == 2){//南草津（かがやき）
                      path1 = [[NSBundle mainBundle] pathForResource:strMKG1 ofType:@"plist"];
                      path2 = [[NSBundle mainBundle] pathForResource:strMKG2 ofType:@"plist"];
                  
                  }else if(c == 3){//南草津（パナ）
                      path1 = [[NSBundle mainBundle] pathForResource:strMPN1 ofType:@"plist"];
                      path2 = [[NSBundle mainBundle] pathForResource:strMPN2 ofType:@"plist"];
                  
                  }else if(c == 4){//草津
                      path1 = [[NSBundle mainBundle] pathForResource:strKST1 ofType:@"plist"];
                      path2 = [[NSBundle mainBundle] pathForResource:strKST2 ofType:@"plist"];
                  
                  }else if(c == 5){//瀬田
                      path1 = [[NSBundle mainBundle] pathForResource:strSET1 ofType:@"plist"];
                      path2 = [[NSBundle mainBundle] pathForResource:strSET2 ofType:@"plist"];
                  
                  }else if(c == 6){//衣笠
                      path1 = [[NSBundle mainBundle] pathForResource:strKNG1 ofType:@"plist"];
                      path2 = [[NSBundle mainBundle] pathForResource:strKNG2 ofType:@"plist"];
                  
                  }else if(c == 7){//中書島
                      path1 = [[NSBundle mainBundle] pathForResource:strCHU1 ofType:@"plist"];
                      path2 = [[NSBundle mainBundle] pathForResource:strCHU2 ofType:@"plist"];
                      
                  
                  }
    
                  tDict1 = [NSDictionary dictionaryWithContentsOfFile:path1];
                  tArr1 = [tDict1 allKeys];
                  tDict2 = [NSDictionary dictionaryWithContentsOfFile:path2];
                  tArr2 = [tDict2 allKeys];
                  
                  
                  if(c == 0){//南草津（笠山）
                      arrayMKS_1 = [NSMutableArray arrayWithArray:[self sort:tArr1]];
                      arrayMKS_2 = [NSMutableArray arrayWithArray:[self sort:tArr2]];
                  }else if(c == 1){//南草津（直行）
                      if([tArr1 count] > 1){
                      arrayMTY_1 = [NSMutableArray arrayWithArray:[self sort:tArr1]];
                      arrayMTY_2 = [NSMutableArray arrayWithArray:[self sort:tArr2]];
                      }else{//土日は運休のため、配列に0を格納
                      }

                  }else if(c == 2){//南草津（かがやき）
                      arrayMKG_1 = [NSMutableArray arrayWithArray:[self sort:tArr1]];
                      arrayMKG_2 = [NSMutableArray arrayWithArray:[self sort:tArr2]];
                      
                  }else if(c == 3){//南草津（パナ）
                      arrayMPN_1 = [NSMutableArray arrayWithArray:[self sort:tArr1]];
                      arrayMPN_2 = [NSMutableArray arrayWithArray:[self sort:tArr2]];
                      
                  }else if(c == 4){//草津
                      arrayKST_1 = [NSMutableArray arrayWithArray:[self sort:tArr1]];
                      arrayKST_2 = [NSMutableArray arrayWithArray:[self sort:tArr2]];
                      
                  }else if(c == 5){//瀬田
                      arraySET_1 = [NSMutableArray arrayWithArray:[self sort:tArr1]];
                      arraySET_2 = [NSMutableArray arrayWithArray:[self sort:tArr2]];
                      
                  }else if(c == 6){//衣笠
                      arrayKNG_1 = [NSMutableArray arrayWithArray:[self sort:tArr1]];
                      arrayKNG_2 = [NSMutableArray arrayWithArray:[self sort:tArr2]];
                      
                  }else if(c == 7){//中書島
                      if([tArr1 count] > 1){
                      arrayCHU_1 = [NSMutableArray arrayWithArray:[self sort:tArr1]];
                      arrayCHU_2 = [NSMutableArray arrayWithArray:[self sort:tArr2]];
                      }else{
                      }
                      
                  }
                  
                  c++;
                  
              }
              
              
              /*
              //中書島行き
              tArr = [[[NSArray alloc]init]autorelease];;
              tDict = [[[NSDictionary alloc]init]autorelease];
              NSString *paths = [[NSBundle mainBundle] pathForResource:@"tTableCHU_1" ofType:@"plist"];
              tDict = [NSDictionary dictionaryWithContentsOfFile:paths];
              //tArr = [NSArray array];
              tArr = [tDict allKeys]; //初回、不変な配列に格納される
              arrayCHU_1 = [NSMutableArray arrayWithArray:[self sort:tArr]];
              //中書島発
              tArr = [[[NSArray alloc]init]autorelease];
              tDict = [[[NSDictionary alloc]init]autorelease];
              paths = [[NSBundle mainBundle] pathForResource:@"tTableCHU_2" ofType:@"plist"];
              tDict = [NSDictionary dictionaryWithContentsOfFile:paths];
              //tArr = [NSArray array];
              tArr = [tDict allKeys]; //初回、不変な配列に格納される
              arrayCHU_2 = [NSMutableArray arrayWithArray:[self sort:tArr]];
              //南草津行き（笠山経由）
              tArr = [[[NSArray alloc]init]autorelease];
              tDict = [[[NSDictionary alloc]init]autorelease];
              paths = [[NSBundle mainBundle]pathForResource:@"tTableMKS_1" ofType:@"plist"];
              tDict = [NSDictionary dictionaryWithContentsOfFile:paths];
              tArr = [tDict allKeys];
              arrayMKS_1 = [NSMutableArray arrayWithArray:[self sort:tArr]];
              //南草津発（笠山経由）
              tArr = [[[NSArray alloc]init]autorelease];
              tDict = [[[NSDictionary alloc]init]autorelease];
              paths = [[NSBundle mainBundle]pathForResource:@"tTableMKS_2" ofType:@"plist"];
              tDict = [NSDictionary dictionaryWithContentsOfFile:paths];
              tArr = [tDict allKeys];
              arrayMKS_2 = [NSMutableArray arrayWithArray:[self sort:tArr]];
              //南草津行き（直通）
              tArr = [[[NSArray alloc]init]autorelease];
              tDict = [[[NSDictionary alloc]init]autorelease];
              paths = [[NSBundle mainBundle]pathForResource:@"tTableMTY_1" ofType:@"plist"];
              tDict = [NSDictionary dictionaryWithContentsOfFile:paths];
              tArr = [tDict allKeys];
              arrayMTY_1 = [NSMutableArray arrayWithArray:[self sort:tArr]];
              //南草津（直通）
              tArr = [[[NSArray alloc]init]autorelease];
              tDict = [[[NSDictionary alloc]init]autorelease];
              paths = [[NSBundle mainBundle]pathForResource:@"tTableMTY_2" ofType:@"plist"];
              tDict = [NSDictionary dictionaryWithContentsOfFile:paths];
              tArr = [tDict allKeys];
              arrayMTY_2 = [NSMutableArray arrayWithArray:[self sort:tArr]];
              //南草津行き（かがやき経由）
              tArr = [[[NSArray alloc]init]autorelease];
              tDict = [[[NSDictionary alloc]init]autorelease];
              paths = [[NSBundle mainBundle]pathForResource:@"tTableMKG_1" ofType:@"plist"];
              tDict = [NSDictionary dictionaryWithContentsOfFile:paths];
              tArr = [tDict allKeys];
              arrayMKG_1 = [NSMutableArray arrayWithArray:[self sort:tArr]];
              //南草津発（かがやき経由)
              tArr = [[[NSArray alloc]init]autorelease];
              tDict = [[[NSDictionary alloc]init]autorelease];
              paths = [[NSBundle mainBundle]pathForResource:@"tTableMKG_2" ofType:@"plist"];
              tDict = [NSDictionary dictionaryWithContentsOfFile:paths];
              tArr = [tDict allKeys];
              arrayMKG_2 = [NSMutableArray arrayWithArray:[self sort:tArr]];
              //南草津行き（パナ経由）
              tArr = [[[NSArray alloc]init]autorelease];
              tDict = [[[NSDictionary alloc]init]autorelease];
              paths = [[NSBundle mainBundle]pathForResource:@"tTableMPN_1" ofType:@"plist"];
              tDict = [NSDictionary dictionaryWithContentsOfFile:paths];
              tArr = [tDict allKeys];
              arrayMPN_1 = [NSMutableArray arrayWithArray:[self sort:tArr]];
              //南草津発（パナ経由)
              tArr = [[[NSArray alloc]init]autorelease];
              tDict = [[[NSDictionary alloc]init]autorelease];
              paths = [[NSBundle mainBundle]pathForResource:@"tTableMPN_2" ofType:@"plist"];
              tDict = [NSDictionary dictionaryWithContentsOfFile:paths];
              tArr = [tDict allKeys];
              arrayMPN_2 = [NSMutableArray arrayWithArray:[self sort:tArr]];
              //草津行き
              tArr = [[[NSArray alloc]init]autorelease];
              tDict = [[[NSDictionary alloc]init]autorelease];
              paths = [[NSBundle mainBundle]pathForResource:@"tTableKST_1" ofType:@"plist"];
              tDict = [NSDictionary dictionaryWithContentsOfFile:paths];
              tArr = [tDict allKeys];
              arrayKST_1 = [NSMutableArray arrayWithArray:[self sort:tArr]];
              //草津発
              tArr = [[[NSArray alloc]init]autorelease];
              tDict = [[[NSDictionary alloc]init]autorelease];
              paths = [[NSBundle mainBundle]pathForResource:@"tTableKST_2" ofType:@"plist"];
              tDict = [NSDictionary dictionaryWithContentsOfFile:paths];
              tArr = [tDict allKeys];
              arrayKST_2 = [NSMutableArray arrayWithArray:[self sort:tArr]];
              //瀬田行き
              tArr = [[[NSArray alloc]init]autorelease];
              tDict = [[[NSDictionary alloc]init]autorelease];
              paths = [[NSBundle mainBundle]pathForResource:@"tTableSET_1" ofType:@"plist"];
              tDict = [NSDictionary dictionaryWithContentsOfFile:paths];
              tArr = [tDict allKeys];
              arraySET_1 = [NSMutableArray arrayWithArray:[self sort:tArr]];
              //瀬田発
              tArr = [[[NSArray alloc]init]autorelease];
              tDict = [[[NSDictionary alloc]init]autorelease];
              paths = [[NSBundle mainBundle]pathForResource:@"tTableSET_2" ofType:@"plist"];
              tDict = [NSDictionary dictionaryWithContentsOfFile:paths];
              tArr = [tDict allKeys];
              arraySET_2 = [NSMutableArray arrayWithArray:[self sort:tArr]];
              //衣笠行き
              tArr = [[[NSArray alloc]init]autorelease];
              tDict = [[[NSDictionary alloc]init]autorelease];
              paths = [[NSBundle mainBundle]pathForResource:@"tTableKNG_1" ofType:@"plist"];
              tDict = [NSDictionary dictionaryWithContentsOfFile:paths];
              tArr = [tDict allKeys];
              arrayKNG_1 = [NSMutableArray arrayWithArray:[self sort:tArr]];
              //衣笠発
              tArr = [[[NSArray alloc]init]autorelease];
              tDict = [[[NSDictionary alloc]init]autorelease];
              paths = [[NSBundle mainBundle]pathForResource:@"tTableKNG_2" ofType:@"plist"];
              tDict = [NSDictionary dictionaryWithContentsOfFile:paths];
              tArr = [tDict allKeys];
              arrayKNG_2 = [NSMutableArray arrayWithArray:[self sort:tArr]];
          
               */
              
          }
          return self;
}
-(NSMutableArray *)sort:(NSArray *)arr{
    
    NSMutableArray *tempArr = [[NSMutableArray alloc]initWithArray:arr];
    
    //並び替え
    for(int i = 0;i<[tempArr count]-1;i++){
    
        
        for(int j = [tempArr count]-1;j > i;j--){
            
            if([[tempArr objectAtIndex:j-1] intValue] > [[tempArr objectAtIndex:j] intValue ]){
                [tempArr exchangeObjectAtIndex:j-1 withObjectAtIndex:j];
                
            }
        }
    }
    
    return tempArr;

}
-(void)sortForTable{
    //NSMutableArray *sortArr = [[[NSMutableArray alloc]init]autorelease];
    //並び替えと同時にバリュー値を格納している配列も更新する
    for(int i = 0;i<[arrForTable count]-1;i++){
        
        
        for(int j = [arrForTable count]-1;j > i;j--){
            
            if([[arrForTable objectAtIndex:j-1] intValue] > [[arrForTable objectAtIndex:j] intValue ]){
                [arrForTable exchangeObjectAtIndex:j-1 withObjectAtIndex:j];
                [arrForValue exchangeObjectAtIndex:j-1 withObjectAtIndex:j];
                [arrForColor exchangeObjectAtIndex:j-1 withObjectAtIndex:j];
                
            }
        }
    }

    
}
-(NSMutableArray *)returnArrToBusTable:(int)n{
    
    
    //全てのプロパティリストをまとめる
    arrForTable = [[[NSMutableArray alloc]init]autorelease];
    arrForValue = [[[NSMutableArray alloc]init]autorelease];
    arrForColor = [[[NSMutableArray alloc]init]autorelease];
    NSArray *arr = [[[NSArray alloc]init]autorelease];
    if(n == 1){//平日 立命館大学発
        arr = [NSArray arrayWithObjects:self.arrayMKS_1,self.arrayMTY_1,self.arrayMKG_1,self.arrayMPN_1,self.arrayKST_1,self.arraySET_1,self.arrayKNG_1,self.arrayCHU_1, nil];
    }else if(n == 2){//平日 立命館大学行き
            arr = [NSArray arrayWithObjects:self.arrayMKS_2,self.arrayMTY_2,self.arrayMKG_2,self.arrayMPN_2,self.arrayKST_2,self.arraySET_2,self.arrayKNG_2,self.arrayCHU_2, nil];
    }
    else if(n == 3){//休日　立命館大学発
        arr = [NSArray arrayWithObjects:self.arrayMKS_1,self.arrayMKG_1,self.arrayMPN_1,self.arrayKST_1,self.arraySET_1,self.arrayKNG_1, nil];
    }else{//休日 立命館大学行き
       arr = [NSArray arrayWithObjects:self.arrayMKS_2,self.arrayMKG_2,self.arrayMPN_2,self.arrayKST_2,self.arraySET_2,self.arrayKNG_2, nil];
    }
    
    
    if(n == 1 || n == 2){
        
    for(int i = 0;i<[arr count];i++){
        for(int j  = 0;j<[[arr objectAtIndex:i] count];j++){
            [arrForTable addObject:[[arr objectAtIndex:i] objectAtIndex:j]];
            if(i == 0){//南草津（笠山経由)
                [arrForValue addObject:@"南草津（笠山経由）"];
                [arrForColor addObject:[NSNumber numberWithInt:0]];
            }
            else if(i == 1){//南草津（直行）
                [arrForValue addObject:@"南草津（直行)"];
                [arrForColor addObject:[NSNumber numberWithInt:1]];
            }
            else if(i == 2){//南草津（かがやき経由）
                [arrForValue addObject:@"南草津（かがやき経由）"];
                [arrForColor addObject:[NSNumber numberWithInt:2]];
            }
            else if(i == 3){//南草津（パナ）
                [arrForValue addObject:@"南草津（パナソニック東口経由）"];
                [arrForColor addObject:[NSNumber numberWithInt:3]];
            }
            else if(i == 4){//草津
                [arrForValue addObject:@"草津"];
                [arrForColor addObject:[NSNumber numberWithInt:4]];
            }
            else if(i == 5){//瀬田
                [arrForValue addObject:@"瀬田"];
                [arrForColor addObject:[NSNumber numberWithInt:5]];
            }
            else if(i == 6){//衣笠
                [arrForValue addObject:@"衣笠"];
                [arrForColor addObject:[NSNumber numberWithInt:6]];
            }
            else if(i == 7){//中書島
                [arrForValue addObject:@"中書島"];
                [arrForColor addObject:[NSNumber numberWithInt:7]];
            }
        }
    }
    }else{
        for(int i = 0;i<[arr count];i++){
            NSLog(@"arr's count is %d",[arr count]);
            for(int j  = 0;j<[[arr objectAtIndex:i] count];j++){
                [arrForTable addObject:[[arr objectAtIndex:i] objectAtIndex:j]];
                if(i == 0){//南草津（笠山経由)
                    [arrForValue addObject:@"南草津（笠山経由）"];
                    [arrForColor addObject:[NSNumber numberWithInt:0]];
                }
                /*else if(i == 1){//南草津（直行）
                    [arrForValue addObject:@"南草津（直行)"];
                    [arrForColor addObject:[NSNumber numberWithInt:1]];
                }*/
                else if(i == 1){//南草津（かがやき経由）
                    [arrForValue addObject:@"南草津（かがやき経由）"];
                    [arrForColor addObject:[NSNumber numberWithInt:2]];
                }
                else if(i == 2){//南草津（パナ）
                    [arrForValue addObject:@"南草津（パナソニック東口経由）"];
                    [arrForColor addObject:[NSNumber numberWithInt:3]];
                }
                else if(i == 3){//草津
                    [arrForValue addObject:@"草津"];
                    [arrForColor addObject:[NSNumber numberWithInt:4]];
                }
                else if(i == 4){//瀬田
                    [arrForValue addObject:@"瀬田"];
                    [arrForColor addObject:[NSNumber numberWithInt:5]];
                }
                else if(i == 5){//衣笠
                    [arrForValue addObject:@"衣笠"];
                    [arrForColor addObject:[NSNumber numberWithInt:6]];
                }/*
                else if(i == 7){//中書島
                    [arrForValue addObject:@"中書島"];
                    [arrForColor addObject:[NSNumber numberWithInt:7]];
                }*/
            }
        }
    }

        [self sortForTable];
    
    finalArr = [[NSMutableArray alloc]init];
    for(int i = 0;i<[arrForTable count];i++){
        [finalArr addObject:[NSString stringWithFormat:@"%02d:%02d　:　%@",[[arrForTable objectAtIndex:i] intValue]/100,[[arrForTable objectAtIndex:i] intValue]%100,[arrForValue objectAtIndex:i]]];
    }
    
    return finalArr;

    
}
/*
-(void)dealloc{
    [super dealloc];
}*/

-(int)returnMin:(int)n{
    int min = 0; //この値を返す
    //曜日取得、場合分け
    NSDate *dateNow = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger flags;
    NSDateComponents *comps;
    //現在時刻取得
    flags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    comps = [calendar components:flags fromDate:dateNow];
    
    NSInteger hour = comps.hour;
    NSInteger minute = comps.minute;
    //曜日取得
    comps = [calendar components:NSWeekdayCalendarUnit fromDate:dateNow];
    //NSInteger weekday = comps.weekday; // 曜日(1が日曜日 7が土曜日)
    
    //現在時刻を0000という形でNSStringで取得
    NSString *str = [NSString stringWithFormat:@"%02d%02d",hour,minute];
    //strをNSInteger型に変換
    NSInteger date = str.integerValue;
    
    /*ここで場合わけ
     if(weekday == 2 || weekday == 3 || weekday == 4 || weekday == 5 || weekday == 6){//平日
     
     }else if(weekday == 7 || weekday == 1){//休日
     
     }else {
     NSLog(@"曜日分からへん");
     }
     */
    
    //switch(引数)
    NSInteger temp;
    NSInteger temp2;
    int num = 0;
    
    //引数値によって使用する配列を変更
    NSArray *tempArr = [[[NSArray alloc]init]autorelease];
    
    switch(n){
        case 1://南草津（笠山）
            tempArr = [NSArray arrayWithArray:arrayMKS_1];
            break;
        case 2://南草津（直行）
            tempArr = [NSArray arrayWithArray:arrayMTY_1];
            if([tempArr count] == 0) min = 1111;
            break;
        case 3://南草津（かがやき）
            tempArr = [NSArray arrayWithArray:arrayMKG_1];
            break;
        case 4://南草津（パナ）
            tempArr = [NSArray arrayWithArray:arrayMPN_1];
            break;
        case 5://草津
            tempArr = [NSArray arrayWithArray:arrayKST_1];
            break;
        case 7://瀬田
            tempArr = [NSArray arrayWithArray:arraySET_1];
            break;
        case 9://衣笠
            tempArr = [NSArray arrayWithArray:arrayKNG_1];
            break;
        case 10://中書島
            tempArr = [NSArray arrayWithArray:arrayCHU_1];
              if([tempArr count] == 0) min = 1111;
            break;
            
        case 11://南草津（笠山）
            tempArr = [NSArray arrayWithArray:arrayMKS_2];
            break;
        case 12://南草津（直行）
            tempArr = [NSArray arrayWithArray:arrayMTY_2];
              if([tempArr count] == 0) min = 1111;
            break;
        case 13://南草津（かがやき）
            tempArr = [NSArray arrayWithArray:arrayMKG_2];
            break;
        case 14://南草津（パナ）
            tempArr = [NSArray arrayWithArray:arrayMPN_2];
            break;
        case 15://草津（かがやき）
            tempArr = [NSArray arrayWithArray:arrayKST_2];
            break;
        case 17://瀬田
            tempArr = [NSArray arrayWithArray:arraySET_2];
            break;
        case 19://衣笠
            tempArr = [NSArray arrayWithArray:arrayKNG_2];
            break;
        case 20://中書島
            tempArr = [NSArray arrayWithArray:arrayCHU_2];
              if([tempArr count] == 0) min = 1111;
            break;
        default:
            break;
    }
    
    if([tempArr count] > 1){
    
    for(int i = 0;i<[tempArr count];i++){
        temp = [[tempArr objectAtIndex:i] intValue];
        if( date < temp){
            min = (((temp/100)*60) + (temp%100)) - (((date/100)*60) + (date%100));
            minStr = [NSString stringWithFormat:@"分 (%02d:%02d)",temp/100,temp%100];
            remStr1 = [NSString stringWithFormat:@"%3d",min];
            if(i+1 < [tempArr count]) {
                temp2 = [[tempArr objectAtIndex:i+1] intValue];
                minStr2 = [NSString stringWithFormat:@"② %02d:%02d 出発",temp2/100,temp2%100];
                num = (((temp2/100)*60) + (temp2%100)) - (((date/100)*60) + (date%100));
                remStr2 = [NSString stringWithFormat:@"(あと%3d分)",num];
                num2 = [NSNumber numberWithInt:num];
            }else{
                minStr2 = [NSString stringWithFormat:@""];
                remStr2 = @"";
            }
            break;
        }else {
            //終了
            minStr = [NSString stringWithFormat:@"本日は終了しました"];
            remStr1 = @"";
            minStr2 = [NSString stringWithFormat:@""];
            remStr2 = @"";
        }
    }
    }

    
    
    return min;
    
}


//pリストから配列に格納する
/*
-(NSMutableArray *)compare{
    //NSLog(@"test8");
    //曜日取得 曜日で場合分けする
    NSDate *dateNow = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger flags;
    NSDateComponents *comps;
    //現在時刻取得
    flags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    comps = [calendar components:flags fromDate:dateNow];
    
    NSInteger hour = comps.hour;
    NSInteger minute = comps.minute;
    //曜日取得
    comps = [calendar components:NSWeekdayCalendarUnit fromDate:dateNow];
    //NSInteger weekday = comps.weekday; // 曜日(1が日曜日 7が土曜日)
    
    //現在時刻を0000という形でNSStringで取得
    NSString *str = [NSString stringWithFormat:@"%02d%02d",hour,minute];
    //strをNSInteger型に変換
    //NSInteger i = str.integerValue;
    
    
    
    //読み込むpリスト（平日用か休日用）を確定する
    
    if(weekday == 2 || weekday == 3 || weekday == 4 || weekday == 5 || weekday == 6){//平日
    
    }else if(weekday == 7 || weekday == 1){//休日
    
    }else {
        NSLog(@"曜日分からへん");
    }
     */
    
    //全てのpリストを格納、並び替え
    //NextBusViewCotrolerで使うメソッドorBusViewControllerで使うメソッド
    //NextViewControllerの場合
    //選択されたpリストの配列と現在時刻を比較、削除
    //新たな配列２つ（キー用、バリュー用）を生成
    //それらに全てのpリストの配列をまとめる
    
    
    //現在時刻と比較する配列に格納する行き先を決定するメソッド
    //-(BOOL)setArrForComp; ⇒その要素のキーの１文字目（数字）だけを切り離して、その数字の行き先を配列に入れるならYESを、いれないならNOを返す
    
    //YESならその要素（キー）に対応するバリューを配列に格納
    /*
    for(int i = 0;;i++){
        if([self setArrForComp:[keyArr objectAtIndex:i]] == YES){ //配列に格納するなら
            //そのキーのバリューを配列に格納
            [returnedArr addObject:[dictV objectForKey:[keyArr objectAtIndex:i]]];
        }else{//格納しないなら
        }
       
    }
     */
    
    
    //格納された配列を値の小さい順に並び替え,sortedArrに格納する
    //sortedArr = [NSMutableArray arrayWithArray:[self sortArr:returnedArr]];
    
    //現在時刻と比較、新たな配列に格納
    
    
    
    
    //pリストを読み込む
    /*
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *paths = [bundle pathForResource:@"TimeTable" ofType:@"plist"];
    //keyArr = [NSArray arrayWithContentsOfFile:paths];
    //NSLog(@"ooooooooo%d",[keyArr count]);
    dictV = [NSDictionary dictionaryWithContentsOfFile:paths];
    keyArr = [NSArray array];
    valueArr = [NSMutableArray array];
    keyArr = [dictV allKeys]; //初回、不変な配列に格納される
    for(int i = 0;i<[keyArr count];i++){
        [valueArr addObject:[dictV objectForKey:[keyArr objectAtIndex:i]]];
        NSLog(@"ooooooooo%@",[keyArr objectAtIndex:i]);
    }
     
    
    //pリストの配列と現在時刻を比較
    //テスト用配列
    NSArray *testArr1 = [[NSArray alloc]initWithObjects:
                         [NSNumber numberWithInt:600],
                         [NSNumber numberWithInt:605],
                         [NSNumber numberWithInt:607],
                         [NSNumber numberWithInt:610],
                         [NSNumber numberWithInt:615],
                         [NSNumber numberWithInt:622],
                         [NSNumber numberWithInt:625],
                         [NSNumber numberWithInt:630],
                         [NSNumber numberWithInt:633],
                         [NSNumber numberWithInt:640],
                         [NSNumber numberWithInt:645],
                         [NSNumber numberWithInt:655], nil];
    
    NSMutableArray *testArr2 =[[NSMutableArray alloc]init];
    
    NSNumber *testnum = [NSNumber numberWithInt:1];
    
    NSInteger testTime = 606;
    int num = [testnum intValue];
    //testArr1と現在時刻を比較、現在時刻より大きい時刻になるとその要素から以降１０個をtestArr2に格納
    NSLog(@"test--------%d",num);
    for(int i = 0;i<[testArr1 count];i++){
        if(testTime < [[testArr1 objectAtIndex:i] intValue]){
            for(int j = 0;j<10;j++){
                [testArr2 addObject:[testArr1 objectAtIndex:i]];
                break;
            }
        }
    }
  
    for(int i = 0;i<10;i++){
        NSLog(@"%@\n",[testArr2 objectAtIndex:i]);
    }
    //testArr2の要素0000を00:00型に変換
    
        例:630を６時と３０分に分ける
        int hour = 630 * 100; 6代入される
        int min = 630 % 100; 30代入される
     
     =
    returnedArr = [[NSMutableArray alloc]initWithCapacity:10];
    for(int i = 0;i<10;i++){
        int hour = [[testArr2 objectAtIndex:i] intValue] / 100;
        int min = [[testArr2 objectAtIndex:i] intValue] % 100;
        NSString *str = [NSString stringWithFormat:@"%02d:%02d",hour,min];
        [returnedArr addObject:str];
    }
    
    return returnedArr;
}

-(BOOL)setArrForComp:(NSString *)str{

    return YES;
}
*/
@end
