//
//  PFScro.m
//  PFscroLab
//
//  Created by ekhome on 16/11/17.
//  Copyright © 2016年 xiaofei. All rights reserved.
//

#import "PFScro.h"

@interface PFScro ()<UITableViewDelegate,UITableViewDelegate>
{
    CGFloat i;
    NSTimer *time;
    BOOL is;
}
@end

@implementation PFScro

- (void)viewDidLoad {
    i =0;
    is = YES;
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    [self.tableView setContentOffset:CGPointMake(0, 0) animated:YES];
    self.tableView.scrollEnabled = NO;
    
}
-(void)star:(ScroType)type
{
    switch (type)
    {
        case ScroTypeTop:
            time = [NSTimer scheduledTimerWithTimeInterval:1/60 target:self selector:@selector(scro) userInfo:nil repeats:YES];
            break;
        case ScroTypeRigth:
        default:
            time = [NSTimer scheduledTimerWithTimeInterval:1/60 target:self selector:@selector(scro) userInfo:nil repeats:YES];
            break;
    }
    
}
-(void)scro{
    static  int  num =0;
    num ++;
    i+=1/60.0;
    [self.tableView setContentOffset:CGPointMake(0,(self.view.frame.size.height * (float)i)) animated:NO];
    if (num%60 == 0)
    {
        [time invalidate];
        if (num >= 60*(self.titles.count-1))
        {
            i =0;
            num = 0;
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (is == YES)
            {
                time = [NSTimer scheduledTimerWithTimeInterval:1/60 target:self selector:@selector(scro) userInfo:nil repeats:YES];
            }
        });
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.titles.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CGRectGetHeight(self.view.bounds);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *str = @"reuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil)
    {
        cell.textLabel.text = self.titles[indexPath.section];
    }
    cell.textLabel.text = self.titles[indexPath.section];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self seop];
    [self.delegate PFScroClick:indexPath.section];
}

-(void)seop
{
    //is = NO;
}

@end
