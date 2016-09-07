//
//  AppDelegate.m
//  FGReverserDemo
//
//  Created by 风过的夏 on 16/9/8.
//  Copyright © 2016年 风过的夏. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ViewController *controller=[[ViewController alloc] init];
    UINavigationController *navi=[[UINavigationController alloc] initWithRootViewController:controller];
    navi.navigationBar.barStyle=UIBarStyleBlack;
    self.window.rootViewController=navi;
    return YES;
}


@end
