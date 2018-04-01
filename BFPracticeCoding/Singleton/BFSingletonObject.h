//
//  BFSingletonObject.h
//  BFPracticeCoding
//
//  Created by BFAlex on 2018/4/1.
//  Copyright © 2018年 BFAlex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFSingletonObject : NSObject

@property(nonatomic, copy) NSString *name;

+ (instancetype)sharedInstance;
- (void)updateAge:(NSUInteger)age;

@end
