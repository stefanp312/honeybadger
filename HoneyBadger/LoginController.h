//
//  LoginController.h
//  HoneyBadger
//
//  Created by Stefan Pleava on 2015-02-01.
//  Copyright (c) 2015 Stefan Pleava. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UILabel *state;

@end
