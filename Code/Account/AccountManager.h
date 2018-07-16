//
//  AccountManager.h
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/6/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AccountBean.h"
@interface AccountManager : NSObject

+ (AccountManager *)shared;

@property (nonatomic ,copy) NSString *token;

@property (nonatomic ,copy) NSString *uid;

@property (nonatomic ,copy) NSString *mobile;

- (void)save:(AccountBean *)acc;

- (void)clear;

- (AccountBean *)query;

@end
