//
//  ViewController.m
//  两数相加
//
//  Created by Leo.Chen on 2019/6/23.
//  Copyright © 2019年 Leo.Chen. All rights reserved.
//

#import "ViewController.h"



typedef struct ListNode {
    int val;
    struct ListNode *next;
} ListNode;


@interface Node : NSObject

@property (nonatomic, assign) int val;
@property (nonatomic, strong) Node *next;

@end

@implementation Node

@end



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //2,4,3
    //5,7,4
    {
        ListNode _l11, _l12, _l13, _l21, _l22, _l23;
        ListNode *l1 = &_l11, *l1_2 = &_l12, *l1_3 = &_l13;
        ListNode *l2 = &_l21, *l2_2 = &_l22, *l2_3 = &_l23;

//        l1->val = 2;
//        l1->next = l1_2;
//        l1_2->val = 4;
//        l1_2->next = l1_3;
//        l1_3->val = 3;
//
//        l2->val = 5;
//        l2->next = l2_2;
//        l2_2->val = 7;
//        l2_2->next = l2_3;
//        l2_3->val = 4;
        l1->val = 5;
        l2->val = 5;

        ListNode *l = addTwoNumbers(l1, l2);
        while (l) {
            NSLog(@"%i", l->val);
            l = l->next;
        }
    }
    
    
    /*
    {
        Node *l1 = [Node new];
        l1.val = 2;
        l1.next = ({
            Node *l12 = [Node new];
            l12.val = 4;
            l12.next = ({
                Node *l13 = [Node new];
                l13.val = 3;
                l13;
            });
            l12;
        });
        
        Node *l2 = [Node new];
        l2.val = 5;
        l2.next = ({
            Node *l22 = [Node new];
            l22.val = 7;
            l22.next = ({
                Node *l23 = [Node new];
                l23.val = 4;
                l23;
            });
            l22;
        });
        
        Node *l = [self addTwoNumbersWithL1:l1 l2:l2];
        while (l)
        {
            NSLog(@"%i", l.val);
            l = l.next;
        }
    }
    */
}







//C
struct ListNode *addTwoNumbers(struct ListNode *l1, struct ListNode *l2)
{
    ListNode *ret = NULL, *lastNode = NULL;
    int i = 0;
    int flag = 0;
    
    while (l1 || l2 || flag)
    {
        ListNode *temp = (ListNode *)(calloc(1, sizeof(ListNode)));
        
        if (i == 0)
        {
            ret = temp;
        }
        
        if (lastNode)
        {
            lastNode->next = temp;
        }
        
        int value1 = l1 ? l1->val : 0;
        int value2 = l2 ? l2->val : 0;
        int value = value1 + value2 + flag;
        if (value >= 10)
        {
            flag = 1;
        }
        else
        {
            flag = 0;
        }
        value = value % 10;
        
        temp->val = value;
        
        if (l1)
        {
            l1 = l1->next;
        }
        
        if (l2)
        {
            l2 = l2->next;
        }
        
        
        lastNode = temp;
        
        i++;
    }
    
    return ret;
}


//OC
- (Node *)addTwoNumbersWithL1:(Node *)l1 l2:(Node *)l2
{
    Node *ret, *lastNode;
    NSInteger i = 0;
    BOOL flag = NO;//进位标志
    
    while (l1 || l2 || flag)
    {
        Node *temp = [Node new];
        if (i == 0)
        {
            ret = temp;
        }
        
        if (lastNode)
        {
            lastNode.next = temp;
        }
        
        int value = l1.val + l2.val + (flag ? 1 : 0);
        if (value >= 10)
        {
            flag = YES;
        }
        else
        {
            flag = NO;
        }
        value = value % 10;
        
        temp.val = value;
        
        l1 = l1.next;
        l2 = l2.next;
        
        lastNode = temp;
        
        i++;
    }
    
    return ret;
}


@end
