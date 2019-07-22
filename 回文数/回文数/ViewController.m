//
//  ViewController.m
//  回文数
//
//  Created by Leo on 2019/7/22.
//  Copyright © 2019 Leo.Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int x = 123211;
    
//    NSLog(@"%@", @([self isPalindrome:x]));
    
    
    bool b = isPalindrome(x);
    if (b)
    {
        NSLog(@"对称");
    }
    else
    {
        NSLog(@"非对称");
    }
}



//OC
- (BOOL)isPalindrome:(int)x
{
    if (x < 0)
    {
        return NO;
    }
    
    NSString *str = [NSString stringWithFormat:@"%i", x];
    NSUInteger leng = str.length;
    
    for (NSUInteger i = 0; i < leng / 2; i++)
    {
        NSString *s1 = [str substringWithRange:NSMakeRange(i, 1)];
        NSString *s2 = [str substringWithRange:NSMakeRange(leng - 1 - i, 1)];
        
        if (![s1 isEqualToString:s2])
        {
            return NO;
        }
    }
    
    return YES;
}

//C
bool isPalindrome(int x)
{
    if (x < 0)
    {
        return false;
    }
    
    char *s = calloc(1024, sizeof(char));
    sprintf(s, "%i", x);
    
    int leng = (int)strlen(s);
    for (int i = 0; i < leng / 2; i++)
    {
        char c1 = s[i];
        char c2 = s[leng - 1 - i];
        
        if (c1 != c2)
        {
            return false;
        }
    }
    
    return true;
}


@end
