//
//  ViewController.m
//  BFPracticeCoding
//
//  Created by BFAlex on 2018/4/1.
//  Copyright © 2018年 BFAlex. All rights reserved.
//

#import "ViewController.h"
#import "BFSingletonObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self singletonInfo1];
    [self singletonInfo2];
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
