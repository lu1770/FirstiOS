//
//  ViewController.h
//  xxny
//
//  Created by Agileboost on 2019/7/3.
//  Copyright © 2019 Agileboost. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ASIHTTPRequest.h"
#import "WHToast.h"
#import "Home/HomeViewController.h"
#import "SLWebViewController.h"
#import "PlistIO.h"
#import "ASIIO.h"
#import "EZUIKit.h"
#import "EZUIPlayer.h"

@interface ViewController : UIViewController
{
    IBOutlet UITextField* _userNameField;
    IBOutlet UITextField* _passwordField;
    IBOutlet EZUIPlayer* _mPlayer;
}

@property (nonatomic,retain) UITextField* userNameField;
@property (nonatomic,retain) UITextField* passwordField;
@property (nonatomic,retain) EZUIPlayer* mPlayer;

-(IBAction)login:(id)sender;
-(IBAction)loadVideo:(id)sender;
@end

