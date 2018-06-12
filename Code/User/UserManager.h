//
//  UserManager.h
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/6/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UserParam.h"

#import "UserBean.h"

#import "URLSessionManager.h"

typedef void(^UserResp)(UserBean *user);

@interface UserManager : NSObject

+ (UserManager *)shared;

- (void)queryUser:(UserParam *)param andSucc:(UserResp)succ;

//- (void)uploadUserHeader:(id)param and

@end
