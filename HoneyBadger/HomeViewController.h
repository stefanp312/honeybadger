//
//  HomeViewController.h
//  HoneyBadger
//
//  Created by Stefan Pleava on 2015-01-31.
//  Copyright (c) 2015 Stefan Pleava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlogPost.h"

@interface HomeViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>

@property UICollectionView* pageFeed;
@property UICollectionViewCell* pageFeedCells;

@property UIView* authorFooter;

@property NSMutableArray* pageArray;

@property BlogPost* currentPost;


@end
