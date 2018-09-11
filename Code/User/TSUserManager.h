//
//  UserManager.h
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/6/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UserParam.h"

#import "TSUserBean.h"

#import "URLSessionManager.h"

typedef void(^UserResp)(TSUserBean *);

@interface TSUserManager : NSObject

+ (TSUserManager *)shared;

- (void)queryUser:(UserParam *)param andSucc:(UserResp)succ;

- (void)queryUser:(UserParam *)param andSucc:(UserResp)succ andFail:(HttpFailureBlock)fail andException:(HttpExceptionBlock)exception andTokenInvalid:(HttpTokenInvalidBlock)tokenInvalid;

//- (void)uploadUserHeader:(id)param and
- (void)saveUser:(TSUserBean *)user ;

- (TSUserBean *)queryUser;

@end
