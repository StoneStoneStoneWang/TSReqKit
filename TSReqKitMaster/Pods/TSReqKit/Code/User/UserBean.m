//
//  UserBean.m
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/6/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "UserBean.h"
#import <MJExtension/MJExtension.h>
@implementation UserBean

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    
    return @{@"uid":@"id"};
}

@end
