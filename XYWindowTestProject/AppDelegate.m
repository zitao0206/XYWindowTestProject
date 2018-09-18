//
//  AppDelegate.m
//  XYWindowTestProject
//
//  Created by lizitao on 2018/9/18.
//  Copyright © 2018年 lizitao. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self windowNotificationRegister];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *rootVC = [ViewController new];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:rootVC];
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)windowNotificationRegister
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(windowDidBecomeVisible:) name:UIWindowDidBecomeVisibleNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(windowDidBecomeHidden:) name:UIWindowDidBecomeHiddenNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(windowDidBecomeKey:) name:UIWindowDidBecomeKeyNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(windowDidResignKey:) name:UIWindowDidResignKeyNotification object:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(20 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *cusWindow = [[UIWindow alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
        cusWindow.backgroundColor = [UIColor yellowColor];
        cusWindow.windowLevel = UIWindowLevelNormal;
        [cusWindow makeKeyAndVisible];
//        [cusWindow setHidden:NO];
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"你好" message:@"警告框"
//                                                      delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
//        [alert show];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.window makeKeyAndVisible];
//            [cusWindow setHidden:YES];
        });
    });
}

- (void)windowDidBecomeVisible:(NSNotification *)notification
{
    NSLog(@"----->1.1 windowDidBecomeVisible: %@",notification.object);
    UIWindow *w = notification.object;
    NSLog(@"----->1.2 rootViewController: %@",w.rootViewController);
    NSLog(@"----->1.3 keyWindow: %@",[UIApplication sharedApplication].keyWindow);
}

- (void)windowDidBecomeKey:(NSNotification *)notification
{
    NSLog(@"----->2.1 windowDidBecomeKey: %@",notification.object);
    UIWindow *w = notification.object;
    NSLog(@"----->2.2 rootViewController: %@",w.rootViewController);
    NSLog(@"----->2.3 keyWindow: %@",[UIApplication sharedApplication].keyWindow);
}

- (void)windowDidResignKey:(NSNotification *)notification
{
    NSLog(@"----->3.1 windowDidResignKey: %@",notification.object);
    UIWindow *w = notification.object;
    NSLog(@"----->3.2 rootViewController: %@",w.rootViewController);
    NSLog(@"----->3.3 keyWindow: %@",[UIApplication sharedApplication].keyWindow);
    
}

- (void)windowDidBecomeHidden:(NSNotification *)notification
{
    NSLog(@"----->4.1 windowDidBecomeHidden: %@",notification.object);
    UIWindow *w = notification.object;
    NSLog(@"----->4.2 rootViewController: %@",w.rootViewController);
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
