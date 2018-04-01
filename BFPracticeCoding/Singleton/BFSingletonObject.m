//
//  BFSingletonObject.m
//  BFPracticeCoding
//
//  Created by BFAlex on 2018/4/1.
//  Copyright © 2018年 BFAlex. All rights reserved.
//

#import "BFSingletonObject.h"

@interface BFSingletonObject ()
@property(nonatomic, assign) NSUInteger age;

@end

@implementation BFSingletonObject

+ (instancetype)sharedInstance {
    
    static BFSingletonObject *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[BFSingletonObject alloc] init];
    });
    
    return instance;
}

- (void)updateAge:(NSUInteger)age {
    self.age = age;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"My name is %@, I am %ld", self.name, self.age];
}

@end
