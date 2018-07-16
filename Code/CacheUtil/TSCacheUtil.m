//
//  TSCacheUtil.m
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/7/16.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSCacheUtil.h"
#import <YYCache/YYCache.h>
static TSCacheUtil *manager = nil;

static YYCache *cache = nil;
@implementation TSCacheUtil

+ (TSCacheUtil *)shared {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [TSCacheUtil new];
        
        cache = [[YYCache alloc] initWithName:@"YYCache_TSCache"];
        
        
    });
    return manager;
}
- (void)setObject:(nullable id<NSCoding>)object forKey:(NSString *)key {
    
    [cache setObject:object forKey:key];
}
- (nullable id<NSCoding>)objectForKey:(NSString *)key {
    
    return [cache objectForKey:key];
}
@end
