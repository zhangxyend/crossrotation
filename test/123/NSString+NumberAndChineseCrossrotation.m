//
//  NSString+NumberAndChineseCrossrotation.m
//  123
//
//  Created by zhang on 2018/8/13.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "NSString+NumberAndChineseCrossrotation.h"

@implementation NSString (NumberAndChineseCrossrotation)
-(void)setChinese:(NSString *)chinese{
    self.chinese = chinese;
}
//数字转汉字
-(NSString*)chinese

{   NSString *str = (NSString*)self;
    NSArray *number_numerals = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
    NSArray *chinese_numerals = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"零"];
    NSArray *digits = @[@"个",@"十",@"百",@"千",@"万",@"十",@"百",@"千",@"亿",@"十",@"百",@"千",@"兆"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:chinese_numerals forKeys:number_numerals];
    
    NSMutableArray *sums = [NSMutableArray array];
    for (int i = 0; i < str.length; i ++) {
        NSString *substr = [str substringWithRange:NSMakeRange(i, 1)];
        NSString *a = [dictionary objectForKey:substr];
        NSString *b = digits[str.length -i-1];
        NSString *sum = [a stringByAppendingString:b];
        if ([a isEqualToString:chinese_numerals[9]])
        {
            if([b isEqualToString:digits[4]] || [b isEqualToString:digits[8]])
            {
                sum = b;
                if ([[sums lastObject] isEqualToString:chinese_numerals[9]])
                {
                    [sums removeLastObject];
                }
            }else
            {
                sum = chinese_numerals[9];
            }
            
            if ([[sums lastObject] isEqualToString:sum])
            {
                continue;
            }
        }
        
        [sums addObject:sum];
    }
    
    NSString *sumStr = [sums  componentsJoinedByString:@""];
    NSString *chinese = [sumStr substringToIndex:sumStr.length-1];
    return chinese;
}

//汉字转数字
-(void)setNumber:(NSString *)number{
    self.number = number;
}
-(NSString*)number{
    NSDictionary* mdic = @{
                           @"零":@"0",
                           @"一":@"1",
                           @"二":@"2",
                           @"三":@"3",
                           @"四":@"4",
                           @"五":@"5",
                           @"六":@"6",
                           @"七":@"7",
                           @"八":@"8",
                           @"九":@"9",
                           @"十":@"10",
                           @"百":@"100",
                           @"千":@"1000",
                           @"万":@"10000",
                           @"亿":@"100000000",
                           };
    BOOL flag=YES;//yes表示正数，no表示负数
    NSString * s=[self substringWithRange:NSMakeRange(0, 1)];
    if([s isEqualToString:@"负"]){
        flag=NO;
    }
    int i=0;
    if(!flag){
        i=1;
    }
    int sum=0;//和
    int num[20];//保存单个汉字信息数组
    for(int i=0;i<20;i++){//将其全部赋值为0
        num[i]=0;
    }
    
    int k=0;//用来记录数据的个数
    //如果是负数，正常的数据从第二个汉字开始，否则从第一个开始
    for(;i<[self length];i++){
        NSString * key=[self substringWithRange:NSMakeRange(i, 1)];
        int tmp=[[mdic valueForKey:key] intValue];
        num[k++]=tmp;
    }
    //将获得的所有数据进行拼装
    for(int i=0;i<k;i++){
        if(num[i]<10&&num[i+1]>=10){
            sum+=num[i]*num[i+1];
            i++;
        }else{
            sum+=num[i];
        }
        
    }
    NSMutableString * result=[[NSMutableString alloc]init];;
    if(flag){//如果正数
       
        result=[NSMutableString stringWithFormat:@"%d",sum];
    }else{//如果负数
      
        result=[NSMutableString stringWithFormat:@"-%d",sum];
    }
    return result;
}
@end
