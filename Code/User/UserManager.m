//
//  UserManager.m
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/6/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "UserManager.h"

static UserManager *manager = nil;

#import <MJExtension/MJExtension.h>
@implementation UserManager

+ (UserManager *)shared {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [UserManager new];
    });
    return manager;
}

- (void)queryUser:(UserParam *)param andSucc:(UserResp)succ {
    
    [[URLSessionManager shared] jsonReqForParam:param andSucc:^(id data) {
        
        UserBean *user = [UserBean mj_objectWithKeyValues:data];
        
        succ(user);
        
    } andFail:^{
        
        
    }];
}
@end
