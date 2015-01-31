//
//  ComposeViewController.m
//  HoneyBadger
//
//  Created by Stefan Pleava on 2015-01-31.
//  Copyright (c) 2015 Stefan Pleava. All rights reserved.
//

#import "ComposeViewController.h"

@implementation ComposeViewController 

-(void)viewDidAppear:(BOOL)animated{
    
    
    self.tabBarController.title = self.title;
    self.bodyTextField.delegate = self;
    self.promptLabel.text = [self getPrompt];
    self.tabBarController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleDone target:self action:@selector(nextBarButtonItemClicked)];


    
}

#pragma marks -Get Prompt
- (IBAction)hasTitle:(UITextField*)sender {
    if (![sender.text isEqualToString:@""]) {
        self.hasTitle=true;
    }
    [sender resignFirstResponder];
}
- (IBAction)hasSubtitle:(UITextField *)sender {
    if (![sender.text isEqualToString:@""]) {
        self.hasSubtitle=true;
    }
    [sender resignFirstResponder];
}


-(NSString*)getPrompt{
    NSString* aString = @"YOLO";
    return aString;
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
}

#pragma mark - Actions

- (void)doneBarButtonItemClicked{
    // Dismiss the keyboard by removing it as the first responder.
    [self.bodyTextField resignFirstResponder];
    
    [self.tabBarController.navigationItem setRightBarButtonItem:nil animated:YES];
}
- (void)nextBarButtonItemClicked{
    // Dismiss the keyboard by removing it as the first responder.

    
    if ((self.hasSubtitle)&&(self.hasTitle)) {
        [self.tabBarController.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStyleDone target:self action:@selector(doneBarButtonItemClicked)]
 animated:YES];
    }
    
}


@end
