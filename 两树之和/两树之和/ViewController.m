//
//  ViewController.m
//  两树之和
//
//  Created by Leo.Chen on 2019/6/22.
//  Copyright © 2019年 Leo.Chen. All rights reserved.
//

/*
 description
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那两个整数，并返回他们的数组下标。
 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self description];
    {
        int nums[] = {4, 7, 11, 15, 6, 9, 2};
        int target = 8;
        
        int *result = towsum(nums, 7, target);
        
        if (!result) return;
        printf("1-[%i, %i]\n", result[0], result[1]);
    }
    
    
    NSArray *numArray = @[@(4), @(7), @(11), @(15), @(6), @(9), @(2)];
    NSInteger target = 8;
    {
        NSLog(@"2-%@", [self towsumWithNums:numArray target:target]);
    }
}


//C
int * towsum(int *nums, int numsSize, int target)
{
    int *result = calloc(2, sizeof(int));
    for (int i = 0; i < numsSize - 1; i++)
        for (int j = i + 1; j < numsSize; j++)
        {
            if (nums[i] + nums[j] == target)
            {
                result[0] = i;
                result[1] = j;
                
                return result;
            }
        }
    
    return NULL;
}

//OC (哈希)
- (NSArray *)towsumWithNums:(NSArray <NSNumber *> *)nums target:(NSInteger)target
{
    NSMutableDictionary <NSNumber *, NSNumber *> *dict = [NSMutableDictionary dictionary];
    for (NSUInteger i = 0; i < nums.count; i++)
    {
        NSNumber *value = @(i);
        NSNumber *key = [nums objectAtIndex:i];
        [dict setObject:value forKey:key];
    }
    
    for (NSUInteger i = 0; i < nums.count; i++)
    {
        NSInteger div = target - nums[i].integerValue;
        NSNumber *value = [dict objectForKey:@(div)];
        if (value && value.integerValue != i)
        {
            return @[@(i), value];
        }
    }
    
    return nil;
}


@end
