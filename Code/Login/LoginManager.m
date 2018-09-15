//
//  LoginManager.m
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/6/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "LoginManager.h"
#import "URLSessionManager.h"
#import <MJExtension/MJExtension.h>
#import "AccountManager.h"
#import "TSCacheUtil.h"
#import "TSUserManager.h"
static LoginManager *manager = nil;

@implementation LoginManager

+ (LoginManager *)shared {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [LoginManager new];
        
    });
    return manager;
}
- (BOOL)isLogin {
    
    if (![AccountManager shared].token || [[AccountManager shared].token isEqualToString:@""])
        return false;
    
    return true;
}
- (void)login:(LoginParam *)param andSucc:(LoginResp)succ andFail:(HttpFailureMsgBlock)fail andException:(HttpExceptionBlock)exception {
    
    [[URLSessionManager shared] jsonReqForParam:param andSucc:^(id data) {
        
        AccountBean *acc = [AccountBean mj_objectWithKeyValues:data];
        
        [[AccountManager shared] save:acc];
        
        [[TSUserManager shared] saveUser:acc.user];
        
        succ(acc);
        
    } andFail:fail andTokenInvalid:nil andException:exception];
}
- (void)login:(LoginParam *)param andSucc:(LoginResp)succ andFail:(void(^)(void)) fail {
    
    [[URLSessionManager shared] jsonReqForParam:param andSucc:^(id data) {
        
        AccountBean *acc = [AccountBean mj_objectWithKeyValues:data];
        
        [[AccountManager shared] save:acc];
        
        [[TSUserManager shared] saveUser:acc.user];
        
        succ(acc);
        
    } andFail:^{
        
        fail();
    }];
}
- (void)logout:(LogoutParam *)param {
    
    [[URLSessionManager shared] jsonReqForParam:param andSucc:^(id data) {
        
        
    } andFail:^{
        
        
    }];
    
    [[AccountManager shared] clear];
}
- (void)reg:(RegParam *)param andSucc:(LoginResp)succ andFail:(void(^)(void)) fail {
    
    [[URLSessionManager shared] jsonReqForParam:param andSucc:^(id data) {
        
        AccountBean *acc = [AccountBean mj_objectWithKeyValues:data];
        
        [[AccountManager shared] save:acc];
        
        [[TSUserManager shared] saveUser:acc.user];
        
        succ(acc);
        
    } andFail:^{
        
        fail();
    }];
}
- (void)reg:(RegParam *)param andSucc:(LoginResp)succ andFail:(HttpFailureMsgBlock)fail andException:(HttpExceptionBlock)exception {
    
    [[URLSessionManager shared] jsonReqForParam:param andSucc:^(id data) {
        
        AccountBean *acc = [AccountBean mj_objectWithKeyValues:data];
        
        [[AccountManager shared] save:acc];
        
        [[TSUserManager shared] saveUser:acc.user];
        
        succ(acc);
    } andFail:fail andTokenInvalid:nil andException:exception];
    
}
@end
