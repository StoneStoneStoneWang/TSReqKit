//
//  UploadUtil.m
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/7/17.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "UploadUtil.h"

#import "AccountManager.h"
#import "TSBaseResp.h"
#import <MJExtension/MJExtension.h>
static UploadUtil *manager = nil;

@interface UploadUtil()

@property (nonatomic ,copy ,readwrite) NSString *host;

@property (nonatomic ,strong ,readwrite) AFHTTPSessionManager *reqManager;
@end

@implementation UploadImageParam

- (NSString *)reqName {
    
    return @"/user/upload/one?";
}
@end
@implementation UploadUtil

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

+ (UploadUtil *)shared {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [UploadUtil new];
    });
    
    return manager;
}

- (void)setHost:(NSString *)host {
    _host = host;
}
- (void)upload:(UploadImageParam *)param andProgress:(void (^)(NSProgress *))progress andSucc:(void (^)(UIImage *, id ))succ andFail:(void (^)(void))fail {
    
    [self.reqManager.requestSerializer setValue:[AccountManager shared].token forHTTPHeaderField:@"XX-Token"];
    
    [self.reqManager.requestSerializer setValue:@"iphone" forHTTPHeaderField:@"XX-Device-Type"];
    
    [self.reqManager POST:[NSString stringWithFormat:@"%@%@",self.host,[param reqName]] parameters:@{} constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSData *data = UIImagePNGRepresentation(param.image);
        
        [formData appendPartWithFileData:data name:@"file" fileName:param.fileName mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        progress(uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([NSJSONSerialization isValidJSONObject:responseObject]) {
            
            TSBaseResp *resp = [TSBaseResp mj_objectWithKeyValues:responseObject];
            
            if (resp.code == RespCodeTypeSucc) {
                
                succ(param.image,resp.data);
                
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
