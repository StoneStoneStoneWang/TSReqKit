//
//  TSCacheUtil.h
//  TSReqKitDemo
//
//  Created by three stone 王 on 2018/7/16.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSCacheUtil : NSObject

+ (TSCacheUtil *_Nullable)shared;

- (void)setObject:(nullable id<NSCoding>)object forKey:(NSString *_Nonnull)key;

- (nullable id<NSCoding>)objectForKey:(NSString *_Nullable)key;
@end
