//
//  HomeViewController.m
//  HoneyBadger
//
//  Created by Stefan Pleava on 2015-01-31.
//  Copyright (c) 2015 Stefan Pleava. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController

-(void)viewDidAppear:(BOOL)animated{
    
    self.tabBarController.title = self.title;

}
@end
