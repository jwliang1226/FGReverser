//
//  ViewController.m
//  FGReverserDemo
//
//  Created by 风过的夏 on 16/9/8.
//  Copyright © 2016年 风过的夏. All rights reserved.
//

#import "ViewController.h"
#import "NSString+FGReverser.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    [self setup];
    [self createUI];
}
-(void)setup{
    
    self.view.backgroundColor=[UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1.0];
    self.title=@"FGReverser Demo";
}
-(void)createUI{
    
    UITextField *tf=[[UITextField alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    [self.view addSubview:tf];
    tf.center=CGPointMake(self.view.center.x, 120);
    tf.returnKeyType=UIReturnKeyDone;
    tf.borderStyle=UITextBorderStyleRoundedRect;
    tf.font=[UIFont systemFontOfSize:16];
    tf.textAlignment=NSTextAlignmentCenter;
    tf.placeholder=@"Input Chineese, and press Return key to show result";
    tf.delegate=self;
    
    
    UILabel *lb=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 140)];
    [self.view addSubview:lb];
    lb.center=CGPointMake(self.view.center.x, self.view.bounds.size.height-140);
    lb.numberOfLines=0;
    lb.lineBreakMode=NSLineBreakByWordWrapping;
    lb.textAlignment=NSTextAlignmentCenter;
    lb.text=@"@CGPointZero FGReverser\nBLOG:http://cgpointzero.top\nGitHub:https://github.com/Insfgg99x Jianshu:http://www.jianshu.com/users/c3f2e8c87dc4/latest_articles\nEmail:newbox0512@yahoo.com";
    lb.textColor=[UIColor lightGrayColor];
    lb.font=[UIFont systemFontOfSize:14];
    
    UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 160, 40)];
    [self.view addSubview:btn];
    btn.center=CGPointMake(self.view.center.x, self.view.bounds.size.height-40);
    [btn setTitle:@"@CGPointZero" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showBlog) forControlEvents:UIControlEventTouchUpInside];
}
-(void)showBlog{
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://cgpointzero.top"]];
}
#pragma mark - UITextField
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    //covert
    textField.text=[textField.text fg_reversed];
    [self.view endEditing:YES];
    return YES;
}

@end
