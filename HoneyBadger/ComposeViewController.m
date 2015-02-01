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




- (void)textFieldDidEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    [textView resignFirstResponder];
}

#pragma mark - Actions
- (IBAction)newPromptAction:(id)sender {
    [self getPrompt];
}

- (void)doneBarButtonItemClicked{
    // Dismiss the keyboard by removing it as the first responder.
    [self.bodyTextField resignFirstResponder];
    if ((![self.titleTextField.text isEqualToString:@""])&&(![self.subtitileTextField.text isEqualToString:@""])&&(![self.bodyTextField.text isEqualToString:@""])) {
        [self makePost];
    }else if([self.titleTextField.text isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oh no..."
                                                        message:@"You must have a title to make a post."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
        [alert show];
    }else if([self.subtitileTextField.text isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oh no..."
                                                        message:@"You must have a subtitle to make a post."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else if([self.bodyTextField.text isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oh no..."
                                                        message:@"You must write something!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
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
