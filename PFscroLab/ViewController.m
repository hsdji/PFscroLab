//
//  ViewController.m
//  PFscroLab
//
//  Created by ekhome on 16/11/17.
//  Copyright © 2016年 xiaofei. All rights reserved.
//

#import "ViewController.h"
#import "PFScro.h"
@interface ViewController ()<PFScrodelegate>
{
    PFScro *v;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    v = [PFScro new];
    v.delegate = self;
    [self.view addSubview:v.view];
    [self addChildViewController:v];
    v.view.frame = CGRectMake(100, 100, self.view.frame.size.width, 44);
    v.titles = @[@"",@"0",@"1",@"2",@"3",@"4",@"5",@"2",@"0",@"10",@"4324"];
    [v star:ScroTypeTop];
}
-(void)PFScroClick:(NSUInteger)integer
{
    NSLog(@"当前点击的索引值是%ld,对应的标题是%@",integer,v.titles[integer]);
}

@end
