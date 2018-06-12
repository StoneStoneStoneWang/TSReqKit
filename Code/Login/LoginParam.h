//
//  LoginParam.h
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/6/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "BaseParam.h"

@interface LoginParam : BaseParam

@property (nonatomic ,copy) NSString *username;

@property (nonatomic ,copy) NSString *password;

@property (nonatomic ,copy) NSString *device_type;

@end
