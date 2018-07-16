//
//  UserBean.h
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/6/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSUserBean : NSObject <NSCoding>
// uid
@property (nonatomic ,copy) NSString *uid;
// 手机号
@property (nonatomic ,copy) NSString *mobile;
// 头像
@property (nonatomic ,copy) NSString *avatar;
// 性别
@property (nonatomic ,copy) NSString *sex;
// 昵称
@property (nonatomic ,copy) NSString *user_nickname;

@end
