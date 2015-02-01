//
//  ProfileViewController.m
//  HoneyBadger
//
//  Created by Stefan Pleava on 2015-01-31.
//  Copyright (c) 2015 Stefan Pleava. All rights reserved.
//

#import "ProfileViewController.h"

@implementation ProfileViewController

-(void)viewDidAppear:(BOOL)animated{
    
    self.tabBarController.title = self.title;

}

-(void)viewDidLoad{
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    
}
- (IBAction)changedContentAction:(UISegmentedControl*)sender {
    _contentPickerLabel.text = [sender titleForSegmentAtIndex:sender.selectedSegmentIndex];
}
@end
