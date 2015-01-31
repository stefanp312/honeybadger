//
//  ComposeViewController.h
//  HoneyBadger
//
//  Created by Stefan Pleava on 2015-01-31.
//  Copyright (c) 2015 Stefan Pleava. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComposeViewController : UIViewController <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *promptLabel;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *subtitileTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextField;

@property BOOL hasTitle;
@property BOOL hasSubtitle;
@property BOOL hasBody;



@end
