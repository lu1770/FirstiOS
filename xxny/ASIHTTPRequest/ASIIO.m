//
//  ASIIO.m
//  xxny
//
//  Created by Agileboost on 2019/7/5.
//  Copyright © 2019 Agileboost. All rights reserved.
//

#import "ASIIO.h"
@interface ASIIO ()

@end

@implementation ASIIO

- (void)viewDidLoad {
    [super viewDidLoad];
}

+ (void)postJson:(NSString*)url data:(NSMutableData*)postBody setCompletionBlock:(nullable void (^)(ASIHTTPRequest * req))block{
    NSURL * urlS = [NSURL URLWithString:url];
    __block ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:urlS];
    [request setRequestMethod:@"POST"];
    [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    [request addRequestHeader:@"Accept" value:@"application/json"];
    [request setPostBody:postBody];
    if(block!=nil){
        [request setCompletionBlock:^{
            block(request);
        }];
    }
    [request startAsynchronous];
}
@end
