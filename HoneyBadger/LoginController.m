//
//  LoginController.m
//  HoneyBadger
//
//  Created by Stefan Pleava on 2015-02-01.
//  Copyright (c) 2015 Stefan Pleava. All rights reserved.
//

#import "LoginController.h"
#import <Parse/Parse.h>

@interface LoginController ()

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginAction:(id)sender {
    if ((![self.passwordField.text isEqualToString:@""])&&(![self.usernameField.text isEqualToString:@""])) {
        [self dismissViewControllerAnimated:YES completion:^{
            
            [PFUser logInWithUsernameInBackground:self.usernameField.text password:self.passwordField.text
                                            block: ^(PFUser *user, NSError *error) {
                                                if (user) {
                                                    // Do stuff after successful login.
                                                    NSLog(@"win");
                                                }
                                                else {
                                                    // The login failed. Check error to see why.
                                                    NSLog(@"New account %@", error);
                                                    user.username = self.usernameField.text;
                                                    user.password = self.passwordField.text;
                                                    user.email = @"";
                                                    user[@"name"] =@"LAme";
                                                    
                                                    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                                                        NSLog(@"%@",error);
                                                        [PFUser logInWithUsername:user.username password:user.password];

                                                    }];
                                                }
                                            }];

            
        }];
        
    }else{
        self.state.text = @"Please fill in your information";
        self.state.hidden = NO;
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
