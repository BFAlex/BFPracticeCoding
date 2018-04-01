//
//  BFDatabaseManager.m
//  BFPracticeCoding
//
//  Created by BFAlex on 2018/4/1.
//  Copyright © 2018年 BFAlex. All rights reserved.
//

#import "BFDatabaseManager.h"
#import <FMDB.h>

@interface BFDatabaseManager () {
    
    NSUInteger _tPersonNum;
}
@property(nonatomic, strong) FMDatabase *database;

@end

@implementation BFDatabaseManager

+ (instancetype)sharedInstance {
    
    static BFDatabaseManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[BFDatabaseManager alloc] init];
        [manager setupDefaultValues];
    });
    
    return manager;
}

- (void)setupDefaultValues {
    _tPersonNum = 0;
}

- (void)initDefaultDatabase {
    
    // 数据库文件路径
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dbPath = [documentsPath stringByAppendingString:@"BFDefaultDatabase.sqlite"];
    NSLog(@"database file path: %@", dbPath);
    // 实例化FMDB对象
    self.database = [FMDatabase databaseWithPath:dbPath];    
}

- (void)createDefaultPersonTable {
    
    // 创建Table
    [self.database open];
    
    NSString *personTableSQL = @"CREATE TABLE IF NOT EXISTS t_person ('id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 'person_id' TEXT NOT NULL, 'person_name' VARCHAR(255))";
    [self.database executeUpdate:personTableSQL];
    
    [self.database close];
}

- (void)insertDefaultRecord {
    
    [self.database open];
    
    _tPersonNum++;
    NSString *pID = [NSString stringWithFormat:@"pID%ld", _tPersonNum];
    NSString *pName = [NSString stringWithFormat:@"pName%ld", _tPersonNum];
    NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO t_person (person_id, person_name) VALUES ('%@', '%@')", pID, pName];
    [self.database executeUpdate:insertSQL];
    
    _tPersonNum++;
    NSString *pID2 = [NSString stringWithFormat:@"pID%ld", _tPersonNum];
    NSString *pName2 = [NSString stringWithFormat:@"pName%ld", _tPersonNum];
    [self.database executeUpdate:@"INSERT INTO t_person (person_id, person_name) VALUES (?, ?)", pID2, pName2];
    
    [self.database close];
}

- (void)deleteLastRecord {
    
    [self.database open];
    NSString *pID2 = [NSString stringWithFormat:@"pID%ld", _tPersonNum];
    NSString *deleteSQL = [NSString stringWithFormat:@"DELETE FROM t_person WHERE person_id = '%@'", pID2];
    _tPersonNum--;
    [self.database executeUpdate:deleteSQL];
    
//    [self.database executeUpdate:@"DELETE FROM t_person WHERE person_id = ?", &"pID" [ _tPersonNum]];
    
    [self.database close];
}

- (void)deleteAllRecords {
    
    [self.database open];
    
    [self.database executeUpdate:@"DELETE FROM t_person"];
    _tPersonNum = 0;
    
    [self.database close];
}

- (void)updateDefaultRecord {
    
    [self.database open];
    
    NSString *pID = [NSString stringWithFormat:@"pID%ld", _tPersonNum];
    NSString *pName_update = [NSString stringWithFormat:@"pName_update%ld", _tPersonNum];
    NSString *updateSQL = [NSString stringWithFormat:@"UPDATE t_person SET person_name = '%@' WHERE person_id = '%@'", pName_update, pID];
    [self.database executeUpdate:updateSQL];
    
    [self.database close];
}

- (void)selectAllRecords {
    
    [self.database open];
    
    NSString *selectALLSQL = @"SELECT * FROM t_person";
    FMResultSet *result = [self.database executeQuery:selectALLSQL];
    NSLog(@"select result:");
    while ([result next]) {
        
        int idNum = [[result stringForColumn:@"id"] intValue];
        NSString *pID = [result stringForColumn:@"person_id"];
        NSString *pName = [result stringForColumn:@"person_name"];
        
        NSLog(@"[id%d, person_id:%@, person_name:%@]", idNum, pID, pName);
    }
    
    [self.database close];
}

@end
