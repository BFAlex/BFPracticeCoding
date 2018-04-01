//
//  BFDatabaseManager.h
//  BFPracticeCoding
//
//  Created by BFAlex on 2018/4/1.
//  Copyright © 2018年 BFAlex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFDatabaseManager : NSObject

+ (instancetype)sharedInstance;

- (void)initDefaultDatabase;
- (void)createDefaultPersonTable;
// 增
- (void)insertDefaultRecord;
// 删
- (void)deleteLastRecord;
- (void)deleteAllRecords;
// 改
- (void)updateDefaultRecord;
// 查
- (void)selectAllRecords;

@end
