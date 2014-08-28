//
//  ViewController.m
//  CycleScrollDemo
//
//  Created by Weever Lu on 12-6-14.
//  Copyright (c) 2012年 linkcity. All rights reserved.
//

#import "ViewController.h"
#import "CycleScrollView.h"
#import "AppDelegate.h"
#import "HomePageViewController.h"
@interface ViewController ()

@end

@implementation ViewController

//-(BOOL)prefersStatusBarHidden{
//    return YES;
//}

-(instancetype)init{
    if ([super init]) {
        self.imagesArray=[NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton* button=[[UIButton alloc]initWithFrame:self.view.frame];
    button.backgroundColor=[UIColor clearColor];
    [button addTarget:self action:@selector(cycleScrollViewDelegate:didSelectImageView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    CycleScrollView *cycle = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)
                                                     cycleDirection:CycleDirectionLandscape
                                                           pictures:self.imagesArray];
    cycle.center=CGPointMake(160, 250);
    cycle.delegate = self;
    
    self.view.backgroundColor=[UIColor blackColor];
    
    [self.view addSubview:cycle];
    [cycle release];
    
}

#pragma mark - CycleScrollViewDelegate
- (void)cycleScrollViewDelegate:(CycleScrollView *)cycleScrollView didSelectImageView:(int)index {
    //[self.navigationController popViewControllerAnimated:NO];
    //[self.view removeFromSuperview];
    //self.view.alpha=0;
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)cycleScrollViewDelegate:(CycleScrollView *)cycleScrollView didScrollImageView:(int)index {

   // self.title = [NSString stringWithFormat:@"第%d张", index];
}
#pragma mark CycleScrollViewDelegate End -

- (void)dealloc
{
    
    [super dealloc];
    NSLog(@"viewControllerDealloc");
}

@end