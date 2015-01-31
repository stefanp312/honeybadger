//
//  ProfileViewController.h
//  HoneyBadger
//
//  Created by Stefan Pleava on 2015-01-31.
//  Copyright (c) 2015 Stefan Pleava. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *contentPicker;
@property (weak, nonatomic) IBOutlet UILabel *contentPickerLabel;
@property (weak, nonatomic) IBOutlet UILabel *bio;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
