//
//  BaseResp.h
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/6/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,RespCodeType) {
    
    RespCodeTypeFail = 0,
    
    RespCodeTypeSucc = 1,
    
    RespCodeTypeTokenInvalid = 100,
};

@interface TSBaseResp : NSObject

@property (nonatomic ,copy) NSString *msg;

@property (nonatomic ,strong) id data;

@property (nonatomic ,assign) RespCodeType code;
@end
