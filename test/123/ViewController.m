//
//  ViewController.m
//  123
//
//  Created by zhang on 2018/8/13.
//  Copyright © 2018年 zhang. All rights reserved.
//

#import "ViewController.h"
#import "NSString+NumberAndChineseCrossrotation.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",@"一亿零五千六百二十一".number);
    NSLog(@"%@",@"10011".chinese);
}



@end
