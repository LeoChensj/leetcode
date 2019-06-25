//
//  ViewController.m
//  无重复的最长字符串
//
//  Created by Leo on 2019/6/25.
//  Copyright © 2019 Leo.Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
//    NSString *str = @"abcabcbb";
//    NSLog(@"%i", [self lengthOfLongestSubstring:str]);
    
    
    char *s = "abcabcbb";
    NSLog(@"%i", lengthOfLongestSubstring(s));
}


//OC
- (int)lengthOfLongestSubstring:(NSString *)str
{
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    for (int i = 0; i < str.length; i++)
    {
        NSString *s = [str substringWithRange:NSMakeRange(i, 1)];
        [map setObject:s forKey:s];
    }
    
    return (int)map.count;
}

//C
int lengthOfLongestSubstring(char * s)
{
    
    
    return 0;
}



@end
