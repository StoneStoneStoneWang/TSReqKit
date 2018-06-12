//
//  AccountBean.h
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/6/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UserBean.h"

@interface AccountBean : NSObject

@property (nonatomic ,copy) NSString *token;

@property (nonatomic ,strong) UserBean *user;

@end
