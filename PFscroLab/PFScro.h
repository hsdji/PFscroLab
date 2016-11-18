//
//  PFScro.h
//  PFscroLab
//
//  Created by ekhome on 16/11/17.
//  Copyright © 2016年 xiaofei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ScroType){
    ScroTypeRigth,  //字体向上滚动
    ScroTypeTop
};


@protocol PFScrodelegate <NSObject>
-(void)PFScroClick:(NSUInteger)integer;
@end

@interface PFScro : UITableViewController
@property (nonatomic,strong)NSArray *titles;
@property (nonatomic,strong)id <PFScrodelegate> delegate;
@property (nonatomic,assign)ScroType type;
-(void)star:(ScroType)type;

@end
