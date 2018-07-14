//
//  RegParam.h
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/6/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSBaseParam.h"

@interface RegParam : TSBaseParam

@property (nonatomic ,copy) NSString *nickname;

@property (nonatomic ,copy) NSString *username;

@property (nonatomic ,copy) NSString *password;

@property (nonatomic ,copy) NSString *verification_code;

@end
