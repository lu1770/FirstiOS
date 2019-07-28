//
//  AppDelegate.m
//  xxny
//
//  Created by Agileboost on 2019/7/3.
//  Copyright © 2019 Agileboost. All rights reserved.
//

#import "AppDelegate.h"
#import "JPushService.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    // Required
    [JPUSHService handleRemoteNotification:userInfo];
}
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    // Required
    [JPUSHService registerDeviceToken:deviceToken];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    极光推送开始
    
    // 注册推送
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                          UIUserNotificationTypeSound |
                                                          UIUserNotificationTypeAlert)
                                              categories:nil];
    } else {
        //categories 必须为nil
        [JPUSHService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                          UIRemoteNotificationTypeSound |
                                                          UIRemoteNotificationTypeAlert)
                                              categories:nil];
    }
#else
    //categories 必须为nil
    [JPUSHService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                      UIRemoteNotificationTypeSound |
                                                      UIRemoteNotificationTypeAlert)
                                          categories:nil];
#endif
    
    //启动 sdk
    /* （1）不使用 IDFA 启动 sdk
     参数说明：
     appKey：极光官网控制台应用标识
     channel：频道，暂无可填任意
     apsForProduction：YES发布环境/NO开发环境
     */
    [JPUSHService setupWithOption:launchOptions appKey:@"abcacdf406411fa656ee11c3" channel:@"" apsForProduction:NO];
    
    
    /* （2）使用 IDFA 启动 sdk （不与上述方法同时使用）
     参数说明：
     appKey：极光官网控制台应用标识
     channel：频道，暂无可填任意
     apsForProduction：YES发布环境/NO开发环境
     advertisingIdentifier：IDFA广告标识符
     */
    //NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    //[JPUSHService setupWithOption:launchOptions appKey:@"abcacdf406411fa656ee11c3" channel:@"" apsForProduction:NO advertisingIdentifier:advertisingId];
    

//    极光推送结束
    return YES;
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
