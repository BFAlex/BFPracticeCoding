//
//  ViewController.m
//  BFPracticeCoding
//
//  Created by BFAlex on 2018/4/1.
//  Copyright © 2018年 BFAlex. All rights reserved.
//

#import "ViewController.h"
#import "BFSingletonObject.h"
#import "BFDatabaseManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self singletonInfo1];
    [self singletonInfo2];
    
    // Database
    [self operateDatabase];
}

#pragma mark - FMDB

- (void)operateDatabase {
    
    BFDatabaseManager *databaseManager = [BFDatabaseManager sharedInstance];
    
    NSLog(@"创表");
    [databaseManager initDefaultDatabase];
    [databaseManager createDefaultPersonTable];
    [databaseManager selectAllRecords];
    
    // 清空旧数据
//    NSLog(@"清空旧数据");
//    [databaseManager deleteAllRecords];
//    [databaseManager selectAllRecords];
    
    NSLog(@"增");
    [databaseManager insertDefaultRecord];
    [databaseManager selectAllRecords];
    
    NSLog(@"删");
    [databaseManager deleteLastRecord];
    [databaseManager selectAllRecords];
    
    NSLog(@"改");
    [databaseManager updateDefaultRecord];
    [databaseManager selectAllRecords];
}

#pragma mark - Singleto

- (void)singletonInfo1 {
    
    BFSingletonObject *obj = [BFSingletonObject sharedInstance];
    obj.name = @"Alex";
    [obj updateAge:18];
    
    NSLog(@"info1:%@", obj);
}

- (void)singletonInfo2 {
    NSLog(@"info2:%@", [BFSingletonObject sharedInstance]);
}


@end
