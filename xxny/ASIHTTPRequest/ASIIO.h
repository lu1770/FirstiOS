//
//  ASIIO.h
//  xxny
//
//  Created by Agileboost on 2019/7/5.
//  Copyright © 2019 Agileboost. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface ASIIO : UIViewController
+ (void)postJson:(NSString*)url data:(NSMutableData*)postBody setCompletionBlock:(nullable void (^)(ASIHTTPRequest * request))block;
@end

NS_ASSUME_NONNULL_END
