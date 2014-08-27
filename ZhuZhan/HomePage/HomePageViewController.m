//
//  HomePageViewController.m
//  ZhuZhan
//
//  Created by 汪洋 on 14-8-5.
//  Copyright (c) 2014年 zpzchina. All rights reserved.
//

#import "HomePageViewController.h"
#import "LoginModel.h"
#import "AppDelegate.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    contactview = [[ContactViewController alloc] init];
    nav = [[UINavigationController alloc] initWithRootViewController:contactview];
    [nav.view setFrame:CGRectMake(0, 0, 320, 513)];
    [contentView addSubview:nav.view];
    [self.view addSubview:contentView];
    
    toolView = [[UIView alloc] initWithFrame:CGRectMake(0, 513, 320, 55)];
   [toolView setBackgroundColor:RGBCOLOR(68, 101, 175)];
    
    contactBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [contactBtn setFrame:CGRectMake(20, 10, 40, 35)];
    [contactBtn setBackgroundColor:[UIColor redColor]];
    [contactBtn setTitle:@"人脉" forState:UIControlStateNormal];
    contactBtn.tag = 0;
    [contactBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [toolView addSubview:contactBtn];
    
    projectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [projectBtn setFrame:CGRectMake(80, 10, 40, 35)];
    [projectBtn setBackgroundColor:[UIColor redColor]];
    [projectBtn setTitle:@"项目" forState:UIControlStateNormal];
    projectBtn.tag = 1;
    [projectBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [toolView addSubview:projectBtn];
    
    companyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [companyBtn setFrame:CGRectMake(190, 10, 40, 35)];
    [companyBtn setBackgroundColor:[UIColor redColor]];
    [companyBtn setTitle:@"公司" forState:UIControlStateNormal];
    companyBtn.tag = 3;
    [companyBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [toolView addSubview:companyBtn];
    
    tradeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [tradeBtn setFrame:CGRectMake(245, 10, 40, 35)];
    [tradeBtn setBackgroundColor:[UIColor redColor]];
    [tradeBtn setTitle:@"交易" forState:UIControlStateNormal];
    tradeBtn.tag = 4;
    [tradeBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [toolView addSubview:tradeBtn];
    [self.view addSubview:toolView];
    
    
    //更多按钮的实现
    UIImage *storyMenuItemImage = [UIImage imageNamed:@"bg-menuitem.png"];
    UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-menuitem-highlighted.png"];
    
    // Camera MenuItem.
    QuadCurveMenuItem *cameraMenuItem = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage
                                                                highlightedImage:storyMenuItemImagePressed
                                                                    ContentImage:[UIImage imageNamed:@"icon-star.png"]
                                                         highlightedContentImage:nil];
    // People MenuItem.
    QuadCurveMenuItem *peopleMenuItem = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage
                                                                highlightedImage:storyMenuItemImagePressed
                                                                    ContentImage:[UIImage imageNamed:@"icon-star.png"]
                                                         highlightedContentImage:nil];
    // Place MenuItem.
    QuadCurveMenuItem *placeMenuItem = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage
                                                               highlightedImage:storyMenuItemImagePressed
                                                                   ContentImage:[UIImage imageNamed:@"icon-star.png"]
                                                        highlightedContentImage:nil];
    // Music MenuItem.
    QuadCurveMenuItem *musicMenuItem = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage
                                                               highlightedImage:storyMenuItemImagePressed
                                                                   ContentImage:[UIImage imageNamed:@"icon-star.png"]
                                                        highlightedContentImage:nil];
    // Thought MenuItem.
    QuadCurveMenuItem *thoughtMenuItem = [[QuadCurveMenuItem alloc] initWithImage:storyMenuItemImage
                                                                 highlightedImage:storyMenuItemImagePressed
                                                                     ContentImage:[UIImage imageNamed:@"icon-star.png"]
                                                          highlightedContentImage:nil];
    
    NSArray *menus = [NSArray arrayWithObjects:cameraMenuItem, peopleMenuItem, placeMenuItem, musicMenuItem, thoughtMenuItem, nil];
    
    menu = [[QuadCurveMenu alloc] initWithFrame:self.view.bounds menus:menus];
    menu.delegate = self;
    [self.view addSubview:menu];
    
    [self.navigationController.navigationBar removeFromSuperview];
//    UIButton *LoginOutBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    LoginOutBtn.frame = CGRectMake(70, 20, 40, 30);
//    [LoginOutBtn setTitle:@"退出" forState:UIControlStateNormal];
//    [LoginOutBtn addTarget:self action:@selector(loginOut) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:LoginOutBtn];
//
//    UIButton *perfectBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    perfectBtn.frame = CGRectMake(70, 20, 40, 30);
//    [perfectBtn setTitle:@"完善" forState:UIControlStateNormal];
//    [perfectBtn addTarget:self action:@selector(perfect) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:perfectBtn];

    }

-(NSString *)timeConversion:(NSString *)time
{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [inputFormatter setDateFormat:@"yyyyMMdd"];
    NSDate* inputDate = [inputFormatter dateFromString:time];
    NSLog(@"date = %@", inputDate);
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *confromTimespStr = [formatter stringFromDate:inputDate];

    return confromTimespStr;
}


- (void)perfect
{
         NSString *userId = [[NSUserDefaults standardUserDefaults] objectForKey:@"userId"];
 NSMutableDictionary  *parameter = [[NSMutableDictionary alloc] initWithObjectsAndKeys:userId,@"userId",@"company",@"company",@"industry",@"industry",@"position",@"position",@"locationProvince",@"locationProvince",@"locationCity",@"locationCity",@"introduction",@"introduction",nil];
    [LoginModel PostInformationImprovedWithBlock:^(NSMutableArray *posts, NSError *error) {
        NSDictionary *responseObject = [posts objectAtIndex:0];
        NSString *statusCode = [[[responseObject objectForKey:@"d"] objectForKey:@"status"] objectForKey:@"statusCode"];
        if ([[NSString stringWithFormat:@"%@",statusCode] isEqualToString:@"1300"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"更新成功" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
            [alert show];
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"更新失败" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
            [alert show];
        }

    } dic:parameter];
    
}

-(void)loginOut
{

    NSString *userId = [[NSUserDefaults standardUserDefaults] objectForKey:@"userId"];
//    NSString *userToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"userToken"];
    NSString *deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"deviceToken"];

    
    NSMutableDictionary  *parameter = [[NSMutableDictionary alloc] initWithObjectsAndKeys:userId,@"userId",deviceToken,@"deviceToken",@"mobile",@"deviceType",nil];
    [LoginModel PostLogOutWithBlock:^(NSMutableArray *posts, NSError *error) {
        NSDictionary *responseObject = [posts objectAtIndex:0];
        NSString *statusCode = [[[responseObject objectForKey:@"d"] objectForKey:@"status"] objectForKey:@"statusCode"];
        if ([[NSString stringWithFormat:@"%@",statusCode] isEqualToString:@"1300"]) {
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注销成功" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
//            [alert show];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userName"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"isFaceRegister"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"currentFaceCount"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userId"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"deviceToken"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"firstPassWordLogin"];
            HomePageViewController *homepage = [[HomePageViewController alloc] init];
            
            CGContextRef context = UIGraphicsGetCurrentContext();
            [UIView beginAnimations:nil context:context];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            [UIView setAnimationDuration:0.7];
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[[AppDelegate instance] window] cache:YES];
            NSUInteger tview1 = [[self.view subviews] indexOfObject:[[AppDelegate instance] window]];
            NSUInteger tview2 = [[self.view subviews] indexOfObject:homepage.view];
            [self.view exchangeSubviewAtIndex:tview2 withSubviewAtIndex:tview1];
            [UIView setAnimationDelegate:self];
            [UIView commitAnimations];
            
            [[AppDelegate instance] window].rootViewController = homepage;
            [[[AppDelegate instance] window] makeKeyAndVisible];


            
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注销失败" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
            [alert show];
        }
    } dic:parameter];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)homePageTabBarHide{
    [nav.view setFrame:CGRectMake(0, 0, 320, 568)];
    toolView.hidden=YES;
    menu.hidden=YES;
}

-(void)homePageTabBarRestore{
    [nav.view setFrame:CGRectMake(0, 0, 320, 513)];
    toolView.hidden=NO;
    menu.hidden=NO;
}

-(void)BtnClick:(UIButton *)button{
    for(int i=0;i<contentView.subviews.count;i++) {
        [((UIView*)[contentView.subviews objectAtIndex:i]) removeFromSuperview];
    }
    switch (button.tag) {
        case 0:
            NSLog(@"人脉");
            contactview = [[ContactViewController alloc] init];
            nav = [[UINavigationController alloc] initWithRootViewController:contactview];
            [nav.view setFrame:CGRectMake(0, 0, 320, 513)];
            [contentView addSubview:nav.view];
            break;
        case 1:
            NSLog(@"项目");
            projectview = [[ProjectTableViewController alloc] init];
            nav = [[UINavigationController alloc] initWithRootViewController:projectview];
            [nav.view setFrame:CGRectMake(0, 0, 320, 513)];
            [contentView addSubview:nav.view];
            break;
        case 2:
            NSLog(@"更多");
            break;
        case 3:
            NSLog(@"公司");
            companyview = [[CompanyViewController alloc] init];
            nav = [[UINavigationController alloc] initWithRootViewController:companyview];
            [nav.view setFrame:CGRectMake(0, 0, 320, 513)];
            [contentView addSubview:nav.view];
            break;
        case 4:
            NSLog(@"交易");
            tradeview = [[TradeViewController alloc] init];
            nav = [[UINavigationController alloc] initWithRootViewController:tradeview];
            [nav.view setFrame:CGRectMake(0, 0, 320, 513)];
            [contentView addSubview:nav.view];
            break;
        default:
            break;
    }
}


//更多按钮的委托方法
- (void)quadCurveMenu:(QuadCurveMenu *)menu didSelectIndex:(NSInteger)idx
{
    NSLog(@"Select the index : %ld",(long)idx);
}
@end
