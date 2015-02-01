//
//  HomeViewController.m
//  HoneyBadger
//
//  Created by Stefan Pleava on 2015-01-31.
//  Copyright (c) 2015 Stefan Pleava. All rights reserved.
//

#import "HomeViewController.h"
#import "MainFeedPageCell.h"
#import "blogPost.h"
#import <Parse/Parse.h>

@implementation HomeViewController

-(void)viewDidLoad{
    
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navigationController.navigationBar.frame), self.view.frame.size.width,self.view.frame.size.height-self.navigationController.navigationBar.frame.size.height-self.tabBarController.tabBar.frame.size.height)];
    scrollView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:scrollView];
    [self createHomeFeedCollectionView:scrollView];
    [self initPageArray];
    
        
    [scrollView setScrollEnabled:NO];
    //scrollView.backgroundColor = [UIColor colorWithRed:(150/255) green:(121/255) blue:(105/255) alpha:1];

}

-(void)viewDidAppear:(BOOL)animated{
    
    self.tabBarController.title = self.title;

}

#pragma mark getData

-(void)initPageArray{
    
    NSDictionary* myPage = @{
                           @"Title": @"That Title Man",
                           @"Subtitle": @"Wow Header Too",
                           @"Image": @1,
                           @"Body": @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam felis tortor, lacinia id malesuada sagittis, sodales non nulla. Ut aliquam, nibh eu laoreet tincidunt, orci mauris fermentum massa, id lobortis dui dui vitae diam. Nulla commodo efficitur ante at dignissim. In quam nulla, tristique non congue a, rutrum in odio. Donec non dignissim risus, quis iaculis arcu. Nullam feugiat, justo sit amet interdum bibendum, nibh erat vestibulum risus, ac faucibus enim lorem id ante. Curabitur at ante vulputate, auctor ligula quis, fermentum lacus. Curabitur egestas bibendum lectus id pretium. Quisque sollicitudin ultricies libero, eu ornare velit blandit posuere. Phasellus in accumsan risus. Phasellus at metus erat. Nulla quis tortor non erat facilisis fermentum."
                           };
    self.pageArray = [NSArray arrayWithObjects:myPage,myPage,myPage, nil].mutableCopy;

}

-(void)refreshPageArray{
    
    NSDictionary* myPage = @{
                             @"Title": @"That Title Man",
                             @"Subtitle": @"Wow Header Too",
                             @"Image": @1,
                             @"Body": @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam felis tortor, lacinia id malesuada sagittis, sodales non nulla. Ut aliquam, nibh eu laoreet tincidunt, orci mauris fermentum massa, id lobortis dui dui vitae diam. Nulla commodo efficitur ante at dignissim. In quam nulla, tristique non congue a, rutrum in odio. Donec non dignissim risus, quis iaculis arcu. Nullam feugiat, justo sit amet interdum bibendum, nibh erat vestibulum risus, ac faucibus enim lorem id ante. Curabitur at ante vulputate, auctor ligula quis, fermentum lacus. Curabitur egestas bibendum lectus id pretium. Quisque sollicitudin ultricies libero, eu ornare velit blandit posuere. Phasellus in accumsan risus. Phasellus at metus erat. Nulla quis tortor non erat facilisis fermentum."
                             };

    self.pageArray = [NSArray arrayWithObjects:myPage,myPage,myPage, nil].mutableCopy;
    
}



#pragma mark CreateUI

-(void)createHomeFeedCollectionView:(UIView*)addTo{
    
    UICollectionViewFlowLayout* flowBro = [[UICollectionViewFlowLayout alloc] init];
    flowBro.itemSize = CGSizeMake(addTo.frame.size.width, 200);
    flowBro.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowBro.minimumLineSpacing = 20;
    
    self.pageFeed = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, addTo.frame.size.width, addTo.frame.size.height)collectionViewLayout:flowBro];
    [self.pageFeed registerNib:[UINib nibWithNibName:@"mainFeedPageCell" bundle:nil] forCellWithReuseIdentifier:@"page"];
    [self.pageFeed registerClass:[MainFeedPageCell class] forCellWithReuseIdentifier:@"pagex"];
    self.pageFeed.backgroundColor = [UIColor brownColor];
    self.pageFeed.delegate = self;
    self.pageFeed.dataSource = self;
    
    [addTo addSubview:self.pageFeed];

}


#pragma mark CollectionViewFunctions
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.pageArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MainFeedPageCell* pageCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"page" forIndexPath:indexPath];
    pageCell.backgroundColor = [UIColor whiteColor];
    pageCell.layer.borderWidth = 1;
    pageCell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    pageCell.title.text = [[self.pageArray objectAtIndex:indexPath.row] valueForKey:@"Title"];
    pageCell.subTitle.text = [[self.pageArray objectAtIndex:indexPath.row] valueForKey:@"Subtitle"];
    
    return ((UICollectionViewCell*)pageCell);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.currentPost = [[BlogPost alloc]initWithNibName:@"blogPost" bundle:nil];
    self.currentPost.data = [self.pageArray objectAtIndex:indexPath.row] ;
    NSLog(@"working");
    [self presentViewController:self.currentPost animated:YES completion:nil];
    //custom animations could happen here if there is time
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}





@end
