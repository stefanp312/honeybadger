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
    //self.bodyField.delegate = self;
    self.promptLabel.text = [self getPrompt];
    self.tabBarController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStyleDone target:self action:@selector(doneBarButtonItemClicked)];
    
    
}

#pragma marks -Get Prompt

-(NSString*)getPrompt{
    NSString* aString = @"YOLO";
    return aString;
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
    // Provide a "Done" button for the user to select to signify completion with writing text in the text view.
    UIBarButtonItem *doneBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneBarButtonItemClicked)];
    
    [self.navigationItem setRightBarButtonItem:doneBarButtonItem animated:YES];
}

#pragma mark - Actions

- (void)doneBarButtonItemClicked{
    // Dismiss the keyboard by removing it as the first responder.
    //[self.bodyField resignFirstResponder];
    
    [self.navigationItem setRightBarButtonItem:nil animated:YES];
}


@end
