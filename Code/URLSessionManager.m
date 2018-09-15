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
#import "LoginManager.h"
static URLSessionManager *manager = nil;
@interface URLSessionManager()

@property (nonatomic ,copy) NSString *host;

@property (nonatomic ,strong) AFHTTPSessionManager *reqManager;

@end
@implementation URLSessionManager

+ (URLSessionManager *)shared {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [URLSessionManager new];
    });
    return manager;
}
- (AFHTTPSessionManager *)reqManager {
    
    if (!_reqManager) {
        
        _reqManager = [AFHTTPSessionManager manager];
        
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
        
        securityPolicy.validatesDomainName = NO;
        
        securityPolicy.allowInvalidCertificates = YES;
        
        _reqManager.securityPolicy = securityPolicy;
        
        _reqManager.requestSerializer.timeoutInterval = 30;
        
        _reqManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json;charset=utf-8",@"text/json",@"text/plain",@"text/html",@"application/json", nil];
    }
    return _reqManager;
}

- (void)setHost:(NSString *)host {
    _host = host;
}

- (void)jsonReqForParam:(TSBaseParam *)param andSucc:(HttpSuccessBlock)succ andFail:(HttpFailureBlock)fail {
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:[param mj_keyValues]];
    
    if ([LoginManager shared].isLogin) {
        
        [self.reqManager.requestSerializer setValue:[AccountManager shared].token forHTTPHeaderField:@"XX-Token"];
        
    }
    
    [self.reqManager.requestSerializer setValue:@"iphone" forHTTPHeaderField:@"XX-Device-Type"];
    
    [self.reqManager POST:[NSString stringWithFormat:@"%@%@",self.host,[param reqName]] parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([NSJSONSerialization isValidJSONObject:responseObject]) {
            
            TSBaseResp *resp = [TSBaseResp mj_objectWithKeyValues:responseObject];
            
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
        
        NSLog(@"%@",error);
        
        fail();
    }];
}
- (void)jsonReqForParam:(TSBaseParam *)param andSucc:(HttpSuccessBlock)succ andFail:(HttpFailureMsgBlock)fail andTokenInvalid:(HttpTokenInvalidBlock)tokenInvalid andException:(HttpExceptionBlock)exception {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:[param mj_keyValues]];
    
    if ([LoginManager shared].isLogin) {
        
        [self.reqManager.requestSerializer setValue:[AccountManager shared].token forHTTPHeaderField:@"XX-Token"];
        
    }
    
    [self.reqManager.requestSerializer setValue:@"iphone" forHTTPHeaderField:@"XX-Device-Type"];
    
    [self.reqManager POST:[NSString stringWithFormat:@"%@%@",self.host,[param reqName]] parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([NSJSONSerialization isValidJSONObject:responseObject]) {
            
            TSBaseResp *resp = [TSBaseResp mj_objectWithKeyValues:responseObject];
            
            if (resp.code == RespCodeTypeSucc) {
                
                succ(resp.data);
                
            } else if (resp.code == RespCodeTypeTokenInvalid) {
                
                // token 失效
                [[AccountManager shared] clear];
                
                tokenInvalid();
            } else {
                
                // 其他失败
                fail(resp.msg);
            }
        } else {
            
            fail(@"不是json");
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
        exception();
    }];
}

- (void)jsonGetReqForParam:(TSBaseParam *)param andSucc:(HttpSuccessBlock)succ andFail:(HttpFailureBlock)fail {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:[param mj_keyValues]];
    
    if ([LoginManager shared].isLogin) {
        
        [self.reqManager.requestSerializer setValue:[AccountManager shared].token forHTTPHeaderField:@"XX-Token"];
        
    }
    
    [self.reqManager.requestSerializer setValue:@"iphone" forHTTPHeaderField:@"XX-Device-Type"];
    
    [self.reqManager GET:[NSString stringWithFormat:@"%@%@",self.host,[param reqName]] parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([NSJSONSerialization isValidJSONObject:responseObject]) {
            
            TSBaseResp *resp = [TSBaseResp mj_objectWithKeyValues:responseObject];
            
            if (resp.code == RespCodeTypeSucc) {
                
                succ(resp.data);
                
            } else if (resp.code == RespCodeTypeTokenInvalid) {
                
                // token 失效
                
            } else {
                
                if ([resp.msg isEqualToString:@"您没有创建店铺!"]) {
                    
                    
                } else {
                    
                    fail();
                }
                
                // 其他失败
            }
        } else {
            
            fail();
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
        fail();
    }];
}
- (void)jsonGetReqForParam:(TSBaseParam *)param andSucc:(HttpSuccessBlock)succ andFail:(HttpFailureMsgBlock)fail andTokenInvalid:(HttpTokenInvalidBlock)tokenInvalid andException:(HttpExceptionBlock)exception {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:[param mj_keyValues]];
    
    if ([LoginManager shared].isLogin) {
        
        [self.reqManager.requestSerializer setValue:[AccountManager shared].token forHTTPHeaderField:@"XX-Token"];
    }
    [self.reqManager.requestSerializer setValue:@"iphone" forHTTPHeaderField:@"XX-Device-Type"];
    
    [self.reqManager GET:[NSString stringWithFormat:@"%@%@",self.host,[param reqName]] parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([NSJSONSerialization isValidJSONObject:responseObject]) {
            
            TSBaseResp *resp = [TSBaseResp mj_objectWithKeyValues:responseObject];
            
            if (resp.code == RespCodeTypeSucc) {
                
                succ(resp.data);
                
            } else if (resp.code == RespCodeTypeTokenInvalid) {
                
                [[AccountManager shared] clear];
                
                // token 失效
                tokenInvalid();
            } else {
                
                if ([resp.msg isEqualToString:@"您没有创建店铺!"]) {
                    
                    
                } else {
                    
                    fail(resp.msg);
                }
            }
        } else {
            
            fail(@"不是json");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
        exception();
    }];
}
@end

