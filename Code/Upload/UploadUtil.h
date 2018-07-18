//
//  UploadUtil.h
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/7/17.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TSBaseParam.h"
@interface UploadImageParam: TSBaseParam

@property (nonatomic ,strong) UIImage *image;

@property (nonatomic ,copy) NSString *fileName;

@end

@interface UploadUtil : NSObject

+ (UploadUtil *)shared;

- (void)setHost:(NSString *)host;


- (void)upload:(UploadImageParam *)param andProgress:(void (^)(NSProgress *))progress andSucc:(void (^)(UIImage *, id))succ andFail:(void (^)(void))fail;

@end
