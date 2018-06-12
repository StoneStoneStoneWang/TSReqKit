//
//  URLSessionManager.h
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/6/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseParam.h"

#import "BaseResp.h"

typedef void(^HttpSuccessBlock)(id data);

typedef void(^HttpFailureBlock)(void);

@interface URLSessionManager : NSObject

+ (URLSessionManager *)shared;

- (void)setHost:(NSString *)host;

- (void)jsonReqForParam:(BaseParam *)param andSucc:(HttpSuccessBlock)succ andFail:(HttpFailureBlock)fail;

@end
