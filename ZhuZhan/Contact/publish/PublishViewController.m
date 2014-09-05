//
//  PublishViewController.m
//  ZhuZhan
//
//  Created by Jack on 14-8-27.
//
//

#import "PublishViewController.h"
#import "AppDelegate.h"
#import "HomePageViewController.h"

@interface PublishViewController ()

@end

@implementation PublishViewController
@synthesize toolBar,inputView,alertLabel,leftBtnImage,rightBtnImage;
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

    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(0, 5, 29, 28.5)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"icon_04.png"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    
    //RightButton设置属性
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(0, 0, 50, 19.5)];
    [rightButton setTitle:@"清空" forState:UIControlStateNormal];
    rightButton.titleLabel.textColor = [UIColor whiteColor];
    [rightButton addTarget:self action:@selector(clearAll) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
    self.title = @"发布";



    inputView = [[UITextView alloc] initWithFrame:CGRectMake(10, 44, 300, 220)];
    inputView.delegate = self;
    inputView.returnKeyType = UIReturnKeySend;
//    inputView.contentInset = UIEdgeInsetsMake(30,30,0,0.0);
    inputView.font = [UIFont systemFontOfSize:16];
    inputView.text =@"             ";
//    inputView.backgroundColor = [UIColor redColor];
    [inputView becomeFirstResponder];
    [self.view addSubview:inputView];
    
    alertLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 110, 120, 30)];
    alertLabel.text = @"您在做什么?";
    alertLabel.textColor = GrayColor;
    alertLabel.alpha = 0.6;
    alertLabel.textAlignment =NSTextAlignmentLeft;
    [self.view addSubview:alertLabel];
    

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 74.5, 60, 60)];
    imageView.image = [UIImage imageNamed:@"人脉－发布动态_03a"];
    [self.view addSubview:imageView];
    
    toolBar = [[UIView alloc] initWithFrame:CGRectMake(0, 312, 320, 40)];
    [self.view addSubview:toolBar];


    UIButton *textBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    textBtn.frame = CGRectMake(0, 0, 158, 40);
    leftBtnImage = [[UIImageView alloc] initWithFrame:CGRectMake(25, 11.5, 19, 17)];
    leftBtnImage.image = [UIImage imageNamed:@"人脉－发布动态_09a"];
    leftBtnImage.userInteractionEnabled = YES;
    [textBtn addSubview:leftBtnImage];
    UILabel *leftBtnLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 5, 100, 30)];
    leftBtnLabel.text = @"想说些什么...";
    [textBtn addSubview:leftBtnLabel];
    
    [textBtn addTarget:self action:@selector(publshText) forControlEvents:UIControlEventTouchUpInside];
    [toolBar addSubview:textBtn];
    
    UIButton *photoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    photoBtn.frame = CGRectMake(162, 0, 160, 40);
    rightBtnImage = [[UIImageView alloc] initWithFrame:CGRectMake(25, 11.5, 19, 17)];
    rightBtnImage.image = [UIImage imageNamed:@"人脉－发布动态_13a"];
    rightBtnImage.userInteractionEnabled = YES;
    [photoBtn addSubview:rightBtnImage];
    UILabel *rightBtnLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 5, 100, 30)];
    rightBtnLabel.text = @"产品信息";
    [photoBtn addSubview:rightBtnLabel];
    [photoBtn addTarget:self action:@selector(publshPhoto) forControlEvents:UIControlEventTouchUpInside];
    [toolBar addSubview:photoBtn];


    

}


-(void)publshText
{
    NSLog(@"发布文字信息");
leftBtnImage.image = [UIImage imageNamed:@"人脉－发布动态_07a"];
}

-(void)publshPhoto{
  NSLog(@"发布图片信息");
    
leftBtnImage.image = [UIImage imageNamed:@"人脉－发布动态_09a"];
    
}

-(void)leftBtnClick{
    
    [self.navigationController popViewControllerAnimated:YES];
}



-(void)clearAll
{
    inputView.text =@"             ";
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text; {
    
//    NSLog(@"Text **%@mm",text);

    alertLabel.hidden = YES;
    if ([@"\n" isEqualToString:text] == YES) { //发送的操作
        if ([inputView.text length] <13) {
            inputView.text =@"             ";
        }
        inputView.text = [inputView.text substringFromIndex:13];
//        NSLog(@"inputView.text  %@",inputView.text);
        inputView.text =@"             ";
        return NO;
    }
    if ([@"" isEqualToString:text] == YES) {
        CGPoint cursorPosition = [textView caretRectForPosition:textView.selectedTextRange.start].origin;
        NSLog(@"===%lf,%f",cursorPosition.x,cursorPosition.y);
        if ((cursorPosition.x==58.720001 &&cursorPosition.y==7)||(cursorPosition.x==63.279999 &&cursorPosition.y==7)) {
            if ([inputView.text length] <14) {
               inputView.text =@"             ";
                return NO;
            }
            
            [@" " stringByAppendingString:inputView.text];
            return NO;

        }

        else if(cursorPosition.x<63.281014 && cursorPosition.y==7){
            NSLog(@"韩海龙");
            [@" " stringByAppendingString:inputView.text];
            return NO;
        }
        
    }
    
    return YES;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
