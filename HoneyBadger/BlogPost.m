//
//  blogPost.m
//  HoneyBadger
//
//  Created by Stefan Pleava on 2015-01-31.
//  Copyright (c) 2015 Stefan Pleava. All rights reserved.
//

#import "BlogPost.h"


@interface BlogPost ()

@end

@implementation BlogPost

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScreenEdgePanGestureRecognizer *leftEdge = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    leftEdge.edges = UIRectEdgeLeft;
    
    UIScreenEdgePanGestureRecognizer *rightEdge = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    rightEdge.edges = UIRectEdgeRight;
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget: self action:@selector(doDoubleTap)] ;
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
    
    
    [self.view addGestureRecognizer:leftEdge];
    [self.view addGestureRecognizer:rightEdge];
    
    self.mainTitle.text = [self.data valueForKey:@"title"];
    self.subTitle.text = [self.data valueForKey:@"subtitle"];
    self.mainTitle.layer.cornerRadius = 5;
    self.subTitle.layer.cornerRadius = 5;
    [self.mainTitle.layer setMasksToBounds:YES];
    [self.subTitle.layer setMasksToBounds:YES];
    self.body.text = [self.data valueForKey:@"textContent"];
    self.promptLabel.text =[[self.data valueForKey:@"prompt"] valueForKey:@"content"];
    //[self.textView sizeToFit];
    
    
    
    

    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleGesture:(UIScreenEdgePanGestureRecognizer*)gr{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void) doDoubleTap{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)handleEdgePan:(id)sender {
    
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
