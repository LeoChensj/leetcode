//
//  ViewController.m
//  整数反转
//
//  Created by Leo.Chen on 2019/6/23.
//  Copyright © 2019年 Leo.Chen. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //溢出 2147483647 -2147483648
    {
        NSLog(@"%i", [self reverse:123]);
        NSLog(@"%i", [self reverse:-123]);
        NSLog(@"%i", [self reverse:120]);
        NSLog(@"%i", [self reverse:-120]);
        NSLog(@"%i", [self reverse:(1000000003)]);
        NSLog(@"%i", [self reverse:(1000000009)]);
        NSLog(@"%i", [self reverse:(1463847421)]);
        NSLog(@"%i", [self reverse:(-1463847421)]);
    }
    
    NSLog(@"----------------------");
    
    {
        NSLog(@"%i", reverse(123));
        NSLog(@"%i", reverse(-123));
        NSLog(@"%i", reverse(120));
        NSLog(@"%i", reverse(-120));
        NSLog(@"%i", reverse(1000000003));
        NSLog(@"%i", reverse(1000000009));
        NSLog(@"%i", reverse(1463847421));
        NSLog(@"%i", reverse(-1463847421));
    }
    
}

//C
int reverse(int x)
{
    long ret = 0;
    while (x != 0)
    {
        int a = x % 10;
        ret = ret * 10 + a;
        
        if (ret > INT_MAX || ret < INT_MIN)
        {
            return 0;
        }
        
        x = (x - a) / 10;
    }
    
    return (int)ret;
}

//OC
- (int)reverse:(int)x
{
    BOOL flagNegative = NO;
    if (x < 0)
    {
        flagNegative = YES;
        x = -x;
    }
    
    NSString *strX = [NSString stringWithFormat:@"%i", x];
    NSMutableString *strResult = [NSMutableString stringWithString:@""];
    for (NSInteger i = strX.length - 1; i >= 0; i--)
    {
        [strResult appendString:[strX substringWithRange:NSMakeRange(i, 1)]];
    }
    
    long long value = strResult.longLongValue;
    if ((flagNegative == NO && value > INT_MAX) ||
        (flagNegative == YES && (-value) < INT_MIN))
    {
        return 0;
    }
    
    int result = (int)value;

    if (flagNegative)
    {
        return -(result);
    }

    return result;
}







@end
