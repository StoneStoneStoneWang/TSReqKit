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
    
    [[NSUserDefaults standardUserDefaults] setObject:acc.user.uid forKey:@"uid"];
    
    [[NSUserDefaults standardUserDefaults] setObject:acc.user.avatar forKey:@"avatar"];
    
    [[NSUserDefaults standardUserDefaults] setObject:acc.user.user_nickname forKey:@"user_nickname"];
    
    self.token = acc.token;
    
    self.mobile = acc.user.mobile;
    
    self.uid = acc.user.uid;
    
    self.avatar = acc.user.avatar;
    
    self.nickName = acc.user.user_nickname;
}
- (void)clear {
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"token"];
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"mobile"];
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"uid"];
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"avatar"];
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"user_nickname"];
    
    self.token = @"";
    
    self.uid = @"";
    
    self.mobile = @"";
    
    self.avatar = @"";
    
    self.nickName = @"";
}
- (AccountBean *)query {
    
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    
    if (!token) {
        
        return nil;
    }
    AccountBean *acc = [AccountBean new];
    
    acc.token = token;
    
    self.token = token;
    
    TSUserBean *user = [TSUserBean new];
    
    user.mobile = [[NSUserDefaults standardUserDefaults] objectForKey:@"mobile"];
    
    user.uid = [[NSUserDefaults standardUserDefaults] objectForKey:@"uid"];
    
    user.avatar =  [[NSUserDefaults standardUserDefaults] objectForKey:@"avatar"];
    
    user.user_nickname = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_nickname"];
    
    acc.user = user;
    
    return acc;
}

@end
