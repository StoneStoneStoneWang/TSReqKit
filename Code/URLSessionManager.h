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

@interface URLSessionManager : NSObject

+ (URLSessionManager *)shared;

- (void)setHost:(NSString *)host;

- (void)jsonReqForParam:(TSBaseParam *)param andSucc:(HttpSuccessBlock)succ andFail:(HttpFailureBlock)fail;

@end
