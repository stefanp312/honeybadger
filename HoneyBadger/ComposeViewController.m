//
//  ComposeViewController.m
//  HoneyBadger
//
//  Created by Stefan Pleava on 2015-01-31.
//  Copyright (c) 2015 Stefan Pleava. All rights reserved.
//

#import "ComposeViewController.h"
#import "TextViewController.h"
#import <Parse/Parse.h>

@implementation ComposeViewController

-(void)viewDidAppear:(BOOL)animated{
    
    self.tabBarController.title = self.title;
    [self.tabBarController.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStyleDone target:self action:@selector(doneBarButtonItemClicked) ] animated:YES];
}
-(void)viewDidDisappear:(BOOL)animated{
    [self.tabBarController.navigationItem setRightBarButtonItem:nil animated:YES];
}
-(void)viewDidLoad{
    
    self.bodyTextField.delegate = self;
    [self getPrompt];
    
    [self.titleTextField setReturnKeyType:UIReturnKeyDone];
    [self.subtitileTextField setReturnKeyType:UIReturnKeyDone];
    self.titleTextField.delegate=self;
    self.subtitileTextField.delegate=self;
    
}

#pragma marks -Get Prompt
- (IBAction)hasTitle:(UITextField*)sender {
    if (![sender.text isEqualToString:@""]) {
        self.hasTitle=true;
    }
}
- (IBAction)hasSubtitle:(UITextField *)sender {
    if (![sender.text isEqualToString:@""]) {
        self.hasSubtitle=true;
    }
}


-(void)getPrompt{
    [PFCloud callFunctionInBackground:@"getRandomPrompt" withParameters:@{} block:^(id object, NSError *error){
            self.currentPrompt = object;
            self.promptLabel.text = [object valueForKey:@"content"];
    }];
    
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    TextViewController* textViewController = [[TextViewController alloc] init];
    [textView resignFirstResponder];
    //[self.navigationController pushViewController:textViewController animated:YES];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:textViewController];
    //[nc.navigationBar]
    [self presentViewController:nc animated:YES completion:^{
        
        self.bodyTextField.text = textViewController.textView.text;
    }
    ];
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    [self.bodyTextField resignFirstResponder];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - Actions
- (IBAction)newPromptAction:(id)sender {
    [self getPrompt];
}

- (void)doneBarButtonItemClicked{
    // Dismiss the keyboard by removing it as the first responder.
    [self.bodyTextField resignFirstResponder];
    [self makePost];
    
}


- (void)makePost{
    //parse test CODE
    
    NSDictionary* user = @{
                           @"password" : @"password",
                           @"username" : @"username",
                           @"emailVerified" : @YES,
                           @"coverImg" : @"",
                           @"email" : @"stefanpleava@gmail.com",
                           @"tagLine" : @"Have a great day mate!",
                           @"account" : self.bodyTextField.text,
                           };

    NSDictionary* prompt = @{
                             @"content" : self.promptLabel.text,
                             @"type" : @"Quote",
                             //@"tags" : [NSArray arrayWithObject:@"yolo"],
                             };

    NSDictionary* page = @{
                           @"title" : self.titleTextField.text,
                           @"creator" : @"",
                           @"tags" : @"TestTag",
                           @"coverImg" : @"",
                           @"prompt" : prompt,
                           @"subtitle" : self.subtitileTextField.text,
                           @"textContent" : self.bodyTextField.text,
                           };
    
    
    [PFCloud callFunctionInBackground:@"createNewPost" withParameters:page block:^(id object, NSError *error){
        
    }];

}

@end
