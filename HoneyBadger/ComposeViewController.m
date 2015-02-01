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

}
-(void)viewDidLoad{
    
    self.bodyTextField.delegate = self;
    self.promptLabel.text = [self getPrompt];
    [self.tabBarController.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStyleDone target:self action:@selector(doneBarButtonItemClicked) ] animated:YES];
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


-(NSString*)getPrompt{
    NSString* aString = @"YOLO";
    return aString;
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    TextViewController* textViewController = [[TextViewController alloc] initWithNibName:@"TextView" bundle:nil];
    
    [self presentViewController:textViewController animated:YES completion:^{
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

- (void)doneBarButtonItemClicked{
    // Dismiss the keyboard by removing it as the first responder.
    [self.bodyTextField resignFirstResponder];
    [self makePost];
    //[self.tabBarController.navigationItem setRightBarButtonItem:nil animated:YES];
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
                             @"promptContent" : self.titleTextField.text,
                             @"type" : @"Quote",
                             //@"tags" : [NSArray arrayWithObject:@"yolo"],
                             };

    NSDictionary* page = @{
                           @"Title" : self.titleTextField.text,
                           @"creator" : @"1234",
                           @"tags" : @"TestTag",
                           @"coverImg" : @"",
                           @"promt" : prompt,
                           @"subtitle" : self.subtitileTextField.text,
                           @"textContent" : self.bodyTextField.text,
                           };
    
    
    [PFCloud callFunctionInBackground:@"createNewPrompt" withParameters:prompt block:^(id object, NSError *error){
        
    }];

}

@end
