//
//  LoginManager.h
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/6/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginParam.h"
#import "AccountBean.h"
#import "LogoutParam.h"
#import "RegParam.h"
#import "URLSessionManager.h"

typedef void(^LoginResp)(AccountBean *);

@interface LoginManager : NSObject

+ (LoginManager *)shared;

#pragma mark --- 是否登录

- (BOOL)isLogin;
#pragma mark --- 登陆

- (void)login:(LoginParam *)param andSucc:(LoginResp)succ andFail:(void(^)(void)) fail;
/*
 上面的弃用
 */
- (void)login:(LoginParam *)param andSucc:(LoginResp)succ andFail:(HttpFailureMsgBlock) fail andException:(HttpExceptionBlock)exception;

#pragma mark --- 退出登陆

- (void)logout:(LogoutParam *)param;

#pragma mark --- 注册
- (void)reg:(RegParam *)param andSucc:(LoginResp)succ andFail:(void(^)(void)) fail;
/*
 上面的弃用
 */
- (void)reg:(RegParam *)param andSucc:(LoginResp)succ andFail:(HttpFailureMsgBlock) fail andException:(HttpExceptionBlock)exception;

@end
