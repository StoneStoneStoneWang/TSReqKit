//
//  AccountManager.m
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/6/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "AccountManager.h"

static AccountManager *manager = nil;

@implementation AccountManager

+ (AccountManager *)shared {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [AccountManager new];
        
    });
    return manager;
}
- (void)save:(AccountBean *)acc {
    
    [[NSUserDefaults standardUserDefaults] setObject:acc.token forKey:@"token"];
    
    [[NSUserDefaults standardUserDefaults] setObject:acc.user.mobile forKey:@"mobile"];
    
    self.token = acc.token;
}
- (void)clear {
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"token"];
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"mobile"];
    
    self.token = @"";
}
- (AccountBean *)query {
    
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    
    if (!token) {
        
        return nil;
    }
    AccountBean *acc = [AccountBean new];
    
    acc.token = token;
    
    self.token = token;
    
    UserBean *user = [UserBean new];
    
    user.mobile = [[NSUserDefaults standardUserDefaults] objectForKey:@"mobile"];
    
    acc.user = user;
    
    return acc;
}

@end
