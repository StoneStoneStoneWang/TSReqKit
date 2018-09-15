//
//  URLSessionManager.h
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/6/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TSBaseParam.h"

#import "TSBaseResp.h"

typedef void(^HttpSuccessBlock)(id);

typedef void(^HttpFailureBlock)(void);

typedef void(^HttpFailureMsgBlock)(NSString *msg);

typedef void(^HttpExceptionBlock)(void);

typedef void(^HttpTokenInvalidBlock)(void);

@interface URLSessionManager : NSObject

+ (URLSessionManager *)shared;

- (void)setHost:(NSString *)host;

- (void)jsonReqForParam:(TSBaseParam *)param andSucc:(HttpSuccessBlock)succ andFail:(HttpFailureBlock)fail ;

- (void)jsonReqForParam:(TSBaseParam *)param andSucc:(HttpSuccessBlock)succ andFail:(HttpFailureMsgBlock)fail andTokenInvalid:(HttpTokenInvalidBlock )tokenInvalid andException:(HttpExceptionBlock)exception;

- (void)jsonGetReqForParam:(TSBaseParam *)param andSucc:(HttpSuccessBlock)succ andFail:(HttpFailureBlock)fail;

- (void)jsonGetReqForParam:(TSBaseParam *)param andSucc:(HttpSuccessBlock)succ andFail:(HttpFailureMsgBlock)fail andTokenInvalid:(HttpTokenInvalidBlock )tokenInvalid andException:(HttpExceptionBlock)exception;
@end

