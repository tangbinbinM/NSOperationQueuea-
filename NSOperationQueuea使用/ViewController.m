//
//  ViewController.m
//  NSOperationQueuea使用
//
//  Created by YiGuo on 2017/10/25.
//  Copyright © 2017年 tbb. All rights reserved.
//

#import "ViewController.h"
#import "TBBOperation.h"
@interface ViewController ()
@property (nonatomic,strong)NSOperationQueue *queue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 设置最大并发操作数
    //    queue.maxConcurrentOperationCount = 1; // 就变成了串行队列
    //
    //    // 添加操作
    //    [queue addOperationWithBlock:^{
    ////        NSLog(@"download1 --- %@", [NSThread currentThread]);
    ////        [NSThread sleepForTimeInterval:1.0];
    //        for (NSInteger i = 0; i<5000; i++) {
    //            NSLog(@"download1 -%zd-- %@", i, [NSThread currentThread]);
    //        }
    //    }];
    //    [queue addOperationWithBlock:^{
    ////        NSLog(@"download2 --- %@", [NSThread currentThread]);
    //        //        [NSThread sleepForTimeInterval:1.0];
    //        for (NSInteger i = 0; i<1000; i++) {
    //            NSLog(@"download2 --- %@", [NSThread currentThread]);
    //        }
    //    }];
    //    [queue addOperationWithBlock:^{
    ////        NSLog(@"download3 --- %@", [NSThread currentThread]);
    ////        [NSThread sleepForTimeInterval:1.0];
    //        for (NSInteger i = 0; i<1000; i++) {
    //            NSLog(@"download3 --- %@", [NSThread currentThread]);
    //        }
    //    }];
    
    
    
    [queue addOperation:[[TBBOperation alloc] init]];
    self.queue = queue;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //    if (self.queue.isSuspended) {
    //        // 恢复队列，继续执行
    //        self.queue.suspended = NO;
    //    } else {
    //        // 暂停（挂起）队列，暂停执行
    //        self.queue.suspended = YES;
    //    }
    
    //取消队列
    [self.queue cancelAllOperations];
    //注意执行中的队列任务无法取消与暂停
}


/**
 并发数设置
 */
- (void)opetationQueue3
{
    // 创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 设置最大并发操作数
        queue.maxConcurrentOperationCount = 3;
//    queue.maxConcurrentOperationCount = 1; // 就变成了串行队列
    
    // 添加操作
    [queue addOperationWithBlock:^{
        NSLog(@"download1 --- %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.01];
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"download2 --- %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.01];
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"download3 --- %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.01];
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"download4 --- %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.01];
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"download5 --- %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.01];
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"download6 --- %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.01];
    }];
}


/**
 更便捷的操作
 */
- (void)operationQueue2{
    //创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperationWithBlock:^{
        NSLog(@"更便捷的操作1 %@",[NSThread currentThread]);
    }];
    [queue addOperationWithBlock:^{
        NSLog(@"更便捷的操作2 %@",[NSThread currentThread]);
    }];
}

- (void)operationQueue1{
    //创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    //创建操作（任务）
    // 创建NSInvocationOperation
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download1:) object:@"download1"];
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download2:) object:@"download2"];
    
    //创建NSBlockOperation
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"download3 --- %@", [NSThread currentThread]);
    }];
    [op3 addExecutionBlock:^{
        NSLog(@"download4 ---- %@", [NSThread currentThread]);
    }];
    [op3 addExecutionBlock:^{
        NSLog(@"download5 ----- %@", [NSThread currentThread]);
    }];
    
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"download6 --- %@", [NSThread currentThread]);
    }];
    
    TBBOperation *op5 = [[TBBOperation alloc] init];
    
    
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
    [queue addOperation:op4];
    [queue addOperation:op5];
    
}

- (void)download1:(NSString *)download1;
{
    NSLog(@"--download1:%@ - %@",download1, [NSThread currentThread]);
}

- (void)download2:(NSString *)download2;
{
    NSLog(@"--download2 -- %@", [NSThread currentThread]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
