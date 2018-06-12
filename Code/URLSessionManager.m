//
//  URLSessionManager.m
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/6/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "URLSessionManager.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import "AccountManager.h"
static URLSessionManager *manager = nil;
@interface URLSessionManager()

@property (nonatomic ,copy) NSString *host;

@end
@implementation URLSessionManager

+ (URLSessionManager *)shared {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [URLSessionManager new];
    });
    return manager;
}

- (void)setHost:(NSString *)host {
    self.host = host;
}

- (void)jsonReqForParam:(BaseParam *)param andSucc:(HttpSuccessBlock)succ andFail:(HttpFailureBlock)fail {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager.requestSerializer setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:[param mj_keyValues]];
    
    if (![AccountManager shared].token) {
        
        [params setObject:[AccountManager shared].token forKey:@"token"];
    }
    
    [manager POST:[NSString stringWithFormat:@"%@%@",self.host,[param reqName]] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([NSJSONSerialization isValidJSONObject:responseObject]) {
            
            BaseResp *resp = [BaseResp mj_objectWithKeyValues:responseObject];
            
            if (resp.code == RespCodeTypeSucc) {
                
                succ(resp.data);
                
            } else if (resp.code == RespCodeTypeTokenInvalid) {
                
                // token 失效
                
            } else {
                
                // 其他失败
                
                fail();
            }
        } else {
            
            fail();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        fail();
        
    }];
}
@end
