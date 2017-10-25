//
//  TBBOperation.m
//  NSOperationQueuea使用
//
//  Created by YiGuo on 2017/10/25.
//  Copyright © 2017年 tbb. All rights reserved.
//

#import "TBBOperation.h"

@implementation TBBOperation

/**
 是否并发
 */
//-(BOOL)isCancelled{
//    return YES;
//}

/**
 需要执行的任务
 */
-(void)main{
    for (NSInteger i = 0; i<100; i++) {
        NSLog(@"mainDownload1 -%zd-- %@", i, [NSThread currentThread]);
    }
    //因为线程取消后执行中的任务是无法取消的，所以执行一个任务之后判断是否以经取消，线程操作
    if (self.isCancelled) return;
    
    for (NSInteger i = 0; i<100; i++) {
        NSLog(@"mainDownload2 -%zd-- %@", i, [NSThread currentThread]);
    }
    if (self.isCancelled) return;
    
    for (NSInteger i = 0; i<100; i++) {
        NSLog(@"mainDownload3 -%zd-- %@", i, [NSThread currentThread]);
    }
    if (self.isCancelled) return;
}
@end
