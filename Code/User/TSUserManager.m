//
//  UserManager.m
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/6/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSUserManager.h"

static TSUserManager *manager = nil;

#import <MJExtension/MJExtension.h>

#import "TSCacheUtil.h"

#import "AccountManager.h"
@implementation TSUserManager

+ (TSUserManager *)shared {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [TSUserManager new];
    });
    return manager;
}

- (void)queryUser:(UserParam *)param andSucc:(UserResp)succ {
    
    [[URLSessionManager shared] jsonGetReqForParam:param andSucc:^(id data) {
        
        TSUserBean *user = [TSUserBean mj_objectWithKeyValues:data];
        
        [self saveUser:user];
        
        succ(user);
        
    } andFail:^{
        
        
    }];
}
- (void)queryUser:(UserParam *)param andSucc:(UserResp)succ andFail:(HttpFailureMsgBlock)fail andException:(HttpExceptionBlock)exception andTokenInvalid:(HttpTokenInvalidBlock)tokenInvalid {
    
    [[URLSessionManager shared] jsonGetReqForParam:param andSucc:^(id data) {
        
        TSUserBean *user = [TSUserBean mj_objectWithKeyValues:data];
        
        [self saveUser:user];
        
        succ(user);
    } andFail:^(NSString *msg) {
        
    } andTokenInvalid:tokenInvalid andException:exception];
}

- (TSUserBean *)queryUser {
    
    return (TSUserBean *)[[TSCacheUtil shared] objectForKey:[NSString stringWithFormat:@"%@_%@",[AccountManager shared].mobile,[AccountManager shared].uid]];
}
- (void)saveUser:(TSUserBean *)user {
    
    [[TSCacheUtil shared] setObject:user forKey:[NSString stringWithFormat:@"%@_%@",[AccountManager shared].mobile,[AccountManager shared].uid]];
}

@end
