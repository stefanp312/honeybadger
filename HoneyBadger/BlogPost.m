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
    
    [self.view addGestureRecognizer:leftEdge];
    [self.view addGestureRecognizer:rightEdge];
    
    NSLog(@"%@",self.data);
    self.mainTitle.text = [self.data valueForKey:@"Title"];
    self.subTitle.text = [self.data valueForKey:@"Subtitle"];

    self.subTitle.backgroundColor = [UIColor grayColor];
    self.body.text = [self.data valueForKey:@"Body"];
    

    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleGesture:(UIScreenEdgePanGestureRecognizer*)gr{
    
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
