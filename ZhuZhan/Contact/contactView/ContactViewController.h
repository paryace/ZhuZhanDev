//
//  ContactViewController.h
//  ZhuZhan
//
//  Created by 汪洋 on 14-8-5.
//  Copyright (c) 2014年 zpzchina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHPathCover.h"
#import "ACTimeScroller.h"
#import "ShowViewController.h"
#import "CommentModel.h"
#import "CommentView.h"
#import "HeadImageDelegate.h"
#import "AddCommentViewController.h"
#import "ErrorView.h"
@interface ContactViewController : UITableViewController<ACTimeScrollerDelegate,XHPathCoverDelegate,showControllerDelegate,HeadImageDelegate,CommentViewDelegate,AddCommentDelegate,ErrorViewDelegate>{
    NSMutableArray *_datasource;
    ACTimeScroller *_timeScroller;
     NSMutableArray *chooseArray ;
    NSMutableArray *showArr;
    NSMutableArray *viewArr;
    CommentView *commentView;
    int startIndex;
    AddCommentViewController *addCommentView;
    NSIndexPath *indexpath;
    ErrorView *errorview;
}
@property (nonatomic, strong) XHPathCover *pathCover;
@property (nonatomic,strong) ShowViewController *showVC;
@property (nonatomic,strong) UIView *transparent;

@end
