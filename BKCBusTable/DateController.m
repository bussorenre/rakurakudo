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
     
     
     */
    
    NSString *pathMKS,*pathMTK,*pathMKG,*pathMPN,*pathKKG,*pathKPN,*pathSET,*pathTYO,*pathOTS,*pathCHU;
    NSDictionary *dictMKS,*dictMTK,*dictMKG,*dictMPN,*dictKKG,*dictKPN,*dictSET,*dictTYO,*dictOTS,*dictCHU;
    NSArray *keyArrMKS,*keyArrMTK,*keyArrMKG,*keyArrMPN,*keyArrKKG,*keyArrKPN,*keyArrSET,*keyArrTYO,*keyArrOTS,*keyArrCHU;
}

@end

@implementation DateController
@synthesize keyArr;
@synthesize key,valueArr,returnedArr,sortedArr;
@synthesize dictV;
@synthesize arrayCHU_1,arrayCHU_2;
@synthesize dictCHU_1,dictCHU_2;
@synthesize tArr;
@synthesize tDict;

-(id)init{
          self = [super init];
          if(self){
              NSLog(@"do init");
              
              //NSArray *pathArray = [[NSArray alloc]initWithObjects:@"tTableCHU_1",@"tTableCHU_2",nil];
              
              arrayCHU_1 = [[NSMutableArray alloc]init];
              arrayCHU_2 = [[NSMutableArray alloc]init];
              
              //NSArray *arrayArr = [[NSArray alloc]initWithObjects:arrayCHU_1,arrayCHU_2, nil];
              
              tArr = [[NSArray alloc]init];
              tDict = [[NSDictionary alloc]init];
              NSBundle *bundle = [NSBundle mainBundle];
              NSString *paths = [bundle pathForResource:@"tTableCHU_1" ofType:@"plist"];
              tDict = [NSDictionary dictionaryWithContentsOfFile:paths];
              //tArr = [NSArray array];
              tArr = [tDict allKeys]; //初回、不変な配列に格納される
              arrayCHU_1 = [NSMutableArray arrayWithArray:[self sort:tArr]];
              NSLog(@"arrayCHU_1 count = %d,%@",[arrayCHU_1 count],[arrayCHU_1 objectAtIndex:0]);
              
              
              tArr = [[NSArray alloc]init];
              tDict = [[NSDictionary alloc]init];
              bundle = [NSBundle mainBundle];
              paths = [bundle pathForResource:@"tTableCHU_2" ofType:@"plist"];
              tDict = [NSDictionary dictionaryWithContentsOfFile:paths];
              //tArr = [NSArray array];
              tArr = [tDict allKeys]; //初回、不変な配列に格納される
              NSLog(@"%d",[tArr count]);
              arrayCHU_2 = [NSMutableArray arrayWithArray:[self sort:tArr]];
              NSLog(@"arrayCHU_2 count =%d、%@",[arrayCHU_2 count],[arrayCHU_2 objectAtIndex:0]);
              
              
              /*for(int i = 0;i<[pathArray count];i++){
              
                  NSArray *tArr = [[NSArray alloc]init];
                  NSDictionary *tDict = [[NSDictionary alloc]init];
              
                  NSBundle *bundle = [NSBundle mainBundle];
                  NSString *paths = [bundle pathForResource:[pathArray objectAtIndex:i] ofType:@"plist"];
                  tDict = [NSDictionary dictionaryWithContentsOfFile:paths];
                  //tArr = [NSArray array];
                  tArr = [tDict allKeys]; //初回、不変な配列に格納される
                  [[arrayArr objectAtIndex:i] addObject:[self sort:tArr]];
                  NSLog(@"%d",[[arrayArr objectAtIndex:i] count]);
                  
                  [tArr autorelease];
                  [tDict autorelease];
                  [bundle autorelease];
                  [paths autorelease];
                  
              }*/
          
              
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
/*
-(void)dealloc{
    [super dealloc];
}*/

-(int)returnMin:(int)n{
    int min = 0; //この値を返す
    
    NSLog(@"arrayCHU_1 in returnMin = %d, arrayCHU_2 = %d",[arrayCHU_1 count],[arrayCHU_2 count]);
    
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
    NSLog(@"time is %d",date);
    
    /*ここで場合わけ
     if(weekday == 2 || weekday == 3 || weekday == 4 || weekday == 5 || weekday == 6){//平日
     
     }else if(weekday == 7 || weekday == 1){//休日
     
     }else {
     NSLog(@"曜日分からへん");
     }
     */
    
    //switch(引数)
    
    switch(n){
        /*case 1://南草津（笠山）
            int min = 0;
            for(int i = 0;i<[配列 count];i++){
                if(date < [[配列 objectAtIndex:i] intValue]){
                    min = [[配列 objectAtIndex:i] intValue] - date;
                    break;
                }else {}
            }
            break;
        case 2://南草津（直行）
            int min = 0;
            for(int i = 0;i<[配列 count];i++){
                if(date < [[配列 objectAtIndex:i] intValue]){
                    min = [[配列 objectAtIndex:i] intValue] - date;
                    break;
                }else {}
            }
            break;
        case 3://南草津（かがやき）
            int min = 0;
            for(int i = 0;i<[配列 count];i++){
                if(date < [[配列 objectAtIndex:i] intValue]){
                    min = [[配列 objectAtIndex:i] intValue] - date;
                    break;
                }else {}
            }
            break;
        case 4://南草津（パナ）
            int min = 0;
            for(int i = 0;i<[配列 count];i++){
                if(date < [[配列 objectAtIndex:i] intValue]){
                    min = [[配列 objectAtIndex:i] intValue] - date;
                    break;
                }else {}
            }
            break;
        case 5://草津（かがやき）
            int min = 0;
            for(int i = 0;i<[配列 count];i++){
                if(date < [[配列 objectAtIndex:i] intValue]){
                    min = [[配列 objectAtIndex:i] intValue] - date;
                    break;
                }else {}
            }
            break;
        case 6://草津（パナ）
            int min = 0;
            for(int i = 0;i<[配列 count];i++){
                if(date < [[配列 objectAtIndex:i] intValue]){
                    min = [[配列 objectAtIndex:i] intValue] - date;
                    break;
                }else {}
            }
            break;
        case 7://瀬田
            int min = 0;
            for(int i = 0;i<[配列 count];i++){
                if(date < [[配列 objectAtIndex:i] intValue]){
                    min = [[配列 objectAtIndex:i] intValue] - date;
                    break;
                }else {}
            }
            break;
        case 8://大津
            int min = 0;
            for(int i = 0;i<[配列 count];i++){
                if(date < [[配列 objectAtIndex:i] intValue]){
                    min = [[配列 objectAtIndex:i] intValue] - date;
                    break;
                }else {}
            }
            break;
        case 9://長寿社会福祉センター
            int min = 0;
            for(int i = 0;i<[配列 count];i++){
                if(date < [[配列 objectAtIndex:i] intValue]){
                    min = [[配列 objectAtIndex:i] intValue] - date;
                    break;
                }else {}
            }
            break;*/
        case 10://中書島
            for(int i = 0;i<[arrayCHU_1 count];i++){
                NSString *str = [arrayCHU_1 objectAtIndex:i];
                NSInteger temp = str.intValue;;
                int t = 1134;
                if( date < temp){
                    min = (((temp/100)*60) + (temp%100)) - (((date/100)*60) + (date%100));
            break;
                }else {}
            }
            break;
            /*case 11://南草津（笠山）
             int min = 0;
             for(int i = 0;i<[配列 count];i++){
             if(date < [[配列 objectAtIndex:i] intValue]){
             min = [[配列 objectAtIndex:i] intValue] - date;
             break;
             }else {}
             }
             break;
             case 12://南草津（直行）
             int min = 0;
             for(int i = 0;i<[配列 count];i++){
             if(date < [[配列 objectAtIndex:i] intValue]){
             min = [[配列 objectAtIndex:i] intValue] - date;
             break;
             }else {}
             }
             break;
             case 13://南草津（かがやき）
             int min = 0;
             for(int i = 0;i<[配列 count];i++){
             if(date < [[配列 objectAtIndex:i] intValue]){
             min = [[配列 objectAtIndex:i] intValue] - date;
             break;
             }else {}
             }
             break;
             case 14://南草津（パナ）
             int min = 0;
             for(int i = 0;i<[配列 count];i++){
             if(date < [[配列 objectAtIndex:i] intValue]){
             min = [[配列 objectAtIndex:i] intValue] - date;
             break;
             }else {}
             }
             break;
             case 15://草津（かがやき）
             int min = 0;
             for(int i = 0;i<[配列 count];i++){
             if(date < [[配列 objectAtIndex:i] intValue]){
             min = [[配列 objectAtIndex:i] intValue] - date;
             break;
             }else {}
             }
             break;
             case 16://草津（パナ）
             int min = 0;
             for(int i = 0;i<[配列 count];i++){
             if(date < [[配列 objectAtIndex:i] intValue]){
             min = [[配列 objectAtIndex:i] intValue] - date;
             break;
             }else {}
             }
             break;
             case 17://瀬田
             int min = 0;
             for(int i = 0;i<[配列 count];i++){
             if(date < [[配列 objectAtIndex:i] intValue]){
             min = [[配列 objectAtIndex:i] intValue] - date;
             break;
             }else {}
             }
             break;
             case 18://大津
             int min = 0;
             for(int i = 0;i<[配列 count];i++){
             if(date < [[配列 objectAtIndex:i] intValue]){
             min = [[配列 objectAtIndex:i] intValue] - date;
             break;
             }else {}
             }
             break;
             case 19://長寿社会福祉センター
             int min = 0;
             for(int i = 0;i<[配列 count];i++){
             if(date < [[配列 objectAtIndex:i] intValue]){
             min = [[配列 objectAtIndex:i] intValue] - date;
             break;
             }else {}
             }
             break;*/
        case 20://中書島
            for(int i = 0;i<[arrayCHU_2 count];i++){
                NSString *str = [arrayCHU_2 objectAtIndex:i];
                NSInteger temp = str.intValue;;
                int t = 1945;
                if( date < temp){
                    min = (((temp/100)*60) + (temp%100)) - (((date/100)*60) + (date%100));
                    NSLog(@"%d",min);
                    break;
                }else {}
            }
            break;
        default:
            break;
    }
    
    
    return min;
    
}


//pリストから配列に格納する
-(void)setKeyArr{

    //テスト
    //keyArr = [[NSMutableArray alloc]initWithCapacity:10];
}
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
    /*
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
     */
    
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
    /*
        例:630を６時と３０分に分ける
        int hour = 630 * 100; 6代入される
        int min = 630 % 100; 30代入される
     
     */
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

@end
