//
//  ViewController.m
//  xxny
//
//  Created by Agileboost on 2019/7/3.
//  Copyright © 2019 Agileboost. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize userNameField;
@synthesize passwordField;

- (void)viewDidLoad {
    [super viewDidLoad];
    _userNameField.text = @"admin";
    _passwordField.text = @"admin";
//    [self login:nil];
}

-(IBAction)loadVideo:(id)sender{
    NSLog(@"hello");
    //初始化
    [EZUIKit initWithAppKey:@"26810f3acd794862b608b6cfbc32a6b8"];
    //登录授权
    [EZUIKit setAccessToken:@"ra.4onqxkqb4jmkln0m1sjh19x101cqxwf4-1739cehz2e-0alc2dr-bft5itgdm"];
    //创建播放器
    self.mPlayer = [EZUIPlayer createPlayerWithUrl:@"ezopen://open.ys7.com/203751922/1.hd.live"];
    //设置代理
    self.mPlayer.mDelegate = self;
    //添加预览视图到当前界面
    [self.view addSubview:self.mPlayer.previewView];
    //开始播放，回放模式必须在EZUIPlayerPrepared回调之后再进行调用
    [self.mPlayer startPlay];
}

-(IBAction)login:(id)sender{
    NSLog(@"login");
    
    [WHToast resetConfig];
    [WHToast hide];

    NSString* userName = [[_userNameField text] autorelease];
    NSString* password = [[_passwordField text] autorelease];
    NSDictionary *user = @{@"username":userName,@"password":password};
    if([userName length]<1 || [password length]<1){
//        CBToast.showToastAction(message: "加载中。。。")
        [WHToast showMessage:@"用户名密码不正确" duration:2 finishHandler:^{
            NSLog(@"error shown.");
        }];
        return;
    }else{
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:user options:NSJSONWritingPrettyPrinted error: &error];
        NSMutableData * tempJsonData = [NSMutableData dataWithData:jsonData];
//        http://112.124.40.109:7500/static/#/proxies/tcp
        NSString* urlStr = @"http://112.124.40.109:18080/user/login";
        [ASIIO postJson:urlStr data:tempJsonData setCompletionBlock:^(ASIHTTPRequest* request){
            NSString * responseString = [request responseString];
            NSLog(@"%@", responseString);
            [WHToast resetConfig];
            [WHToast hide];
            //            id obj = [NSJSONSerialization dataWithJSONObject:[responseString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
            id obj = [NSJSONSerialization JSONObjectWithData:[responseString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
            if ([obj[@"passed"] isEqual:@(YES)]) {
                NSLog(@"%@", obj[@"data"]);
                [WHToast showMessage:@"登录成功" duration:2 finishHandler:^{
                    NSLog(@"%@", responseString);
                }];
                
                // Save token
                [PlistIO writeToken:obj[@"data"]];
                
                // Navigate to
                SLWebViewController * controller = [[SLWebViewController alloc] init];
                [[UIApplication sharedApplication] delegate].window.rootViewController = controller;
            }else{
                [WHToast showMessage:obj[@"errorMessage"] duration:2 finishHandler:^{
                    NSLog(@"%@", responseString);
                }];
            }
        }];
    }
    
}


@end
