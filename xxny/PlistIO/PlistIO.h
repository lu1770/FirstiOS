//
//  PlistIOViewController.h
//  xxny
//
//  Created by Agileboost on 2019/7/5.
//  Copyright © 2019 Agileboost. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlistIO : UIViewController
+ (NSMutableDictionary*)readDict:(NSString*) fileName;
+ (void)writeDict:(NSString*) fileName dict:(NSMutableDictionary *) newsDict;
+ (void)writeToken:(NSString*) token;
+ (NSString*)readToken;
@end

NS_ASSUME_NONNULL_END
