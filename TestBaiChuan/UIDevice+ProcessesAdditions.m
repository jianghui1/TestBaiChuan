//
//  UIDevice+ProcessesAdditions.m
//  TestBaiChuan
//
//  Created by ys on 16/6/12.
//  Copyright © 2016年 jzh. All rights reserved.
//

#import "UIDevice+ProcessesAdditions.h"

#import <sys/sysctl.h>

@implementation UIDevice (ProcessesAdditions)

- (NSArray *)runningProcesses {
    
    int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_ALL, 0};
    u_int miblen = 4;
    
    size_t size;
    int st = sysctl(mib, miblen, NULL, &size, NULL, 0);
    
    struct kinfo_proc * process = NULL;
    struct kinfo_proc * newprocess = NULL;
    
    do {
        
        size += size / 10;
        newprocess = realloc(process, size);
        
        if (!newprocess){
            
            if (process){
                free(process);
            }
            
            return nil;
        }
        
        process = newprocess;
        st = sysctl(mib, miblen, process, &size, NULL, 0);
        
    } while (st == -1 && errno == ENOMEM);
    
    if (st == 0){
        
        if (size % sizeof(struct kinfo_proc) == 0){
            NSInteger nprocess = size / sizeof(struct kinfo_proc);
            
            if (nprocess){
                
//                NSMutableArray * array = [[NSMutableArray alloc] init];
                
                for (NSInteger i = nprocess - 1; i >= 0; i--){
                    
                    NSString * processID = [[NSString alloc] initWithFormat:@"%d", process[i].kp_proc.p_pid];
                    NSString * processName = [[NSString alloc] initWithFormat:@"%s", process[i].kp_proc.p_comm];
                    
                    NSDictionary * dict = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:processID, processName, nil]
                                                                        forKeys:[NSArray arrayWithObjects:@"ProcessID", @"ProcessName", nil]];
//                    [processID release];
//                    [processName release];
//                    [array addObject:dict];
//                    [dict release];
                    NSLog(@"%@", dict);
                }
                
                free(process);
//                return [array autorelease];
            }
        }
    }
    
    return nil;
}

@end
