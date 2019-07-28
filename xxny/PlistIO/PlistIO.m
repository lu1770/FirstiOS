//
//  PlistIOViewController.m
//  xxny
//
//  Created by Agileboost on 2019/7/5.
//  Copyright © 2019 Agileboost. All rights reserved.
//

#import "PlistIO.h"

@interface PlistIO ()

@end

@implementation PlistIO

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
+ (NSMutableDictionary*)readDict:(NSString*) fileName{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path1 = [pathArray objectAtIndex:0];
    NSString *myPath = [path1 stringByAppendingPathComponent:fileName];
    NSLog(@"read plist by : [%@])", myPath);
    NSMutableDictionary *data2 = [[NSMutableDictionary alloc] initWithContentsOfFile:myPath];
    return [[NSMutableDictionary alloc] initWithContentsOfFile:myPath];;
}

+ (NSString*)readToken{
    NSString* fileName = @"UserInfo.plist";
    return [PlistIO readDict:fileName][@"token"];
}
+ (void)writeToken:(NSString*) token {
    NSString* fileName = @"UserInfo.plist";
    //创建数据
    NSMutableDictionary *newsDict = [NSMutableDictionary dictionary];
    //赋值
    [newsDict setObject:token forKey:@"token"];
    [PlistIO writeDict:fileName dict:newsDict];
}

+ (void)writeDict:(NSString*) fileName dict:(NSMutableDictionary *) newsDict {
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [path objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:fileName];
    [newsDict writeToFile:plistPath atomically:YES];
}

@end
