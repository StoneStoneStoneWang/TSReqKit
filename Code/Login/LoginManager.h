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
#import "LogoutParam.m"
#import "RegParam.h"

typedef void(^LoginResp)(AccountBean *acc);


@interface LoginManager : NSObject

+ (LoginManager *)shared;

#pragma mark --- 登陆

- (void)login:(LoginParam *)param andSucc:(LoginResp)succ;

#pragma mark --- 退出登陆

- (void)logout:(LogoutParam *)param;

#pragma mark --- 注册

- (void)reg:(RegParam *)param andSucc:(LoginResp)succ;
@end
