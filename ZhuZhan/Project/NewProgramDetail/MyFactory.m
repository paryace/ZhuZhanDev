//
//  MyFactory.m
//  test
//
//  Created by 孙元侃 on 14-8-21.
//  Copyright (c) 2014年 sunyk. All rights reserved.
//

#import "MyFactory.h"
#import "EGOImageView.h"
#import "MyView.h"
@implementation MyFactory

//program大块 三行
+(UIView*)getThreeLinesTitleViewWithTitle:(NSString*)title titleImage:(UIImage*)titleImage dataThreeStrs:(NSArray*)datas{
    UIView* view=[[UIView alloc]initWithFrame:CGRectZero];
    view.backgroundColor=RGBCOLOR(229, 229, 229);
    CGFloat height=0;//累加，最后给view
    
    //获得第一部分
    UIView* part0=[self getTitleViewWithTitleImage:titleImage title:title];
    [view addSubview: part0];
    height+=part0.frame.size.height;
    
    //获得第二部分
    UIView* part1=[self getThreeLinesWithDataThreeStrs:datas isFirst:[title isEqualToString:@"土地规划/拍卖"]?YES:NO];
    part1.center=CGPointMake(160, height+part1.frame.size.height*.5);
    [view addSubview:part1];
    height+=part1.frame.size.height;
    
    //赋值frame,返回view
    view.frame=CGRectMake(0, 0, 320, height);
    return view;
}

//获得titleView部分
+(UIView*)getTitleViewWithTitleImage:(UIImage*)titleImage title:(NSString*)title{
    UIView* view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 65)];
    
    UIImageView* shadow=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 3.5)];
    shadow.image=[GetImagePath getImagePath:@"Shadow-bottom"];
    [view addSubview:shadow];
    
    UIImageView* imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, titleImage.size.width, titleImage.size.height)];
    imageView.image=titleImage;
    imageView.center=CGPointMake(160, imageView.frame.size.height*.5+10);
    [view addSubview:imageView];
    
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
    label.center=CGPointMake(160, 45);
    label.text=title;
    label.font=[UIFont systemFontOfSize:16];
    label.textAlignment=NSTextAlignmentCenter;
    label.textColor=RGBCOLOR(82, 125, 237);
    [view addSubview:label];
    
    return view;
}

//获得titleView下面的三行strs
+(UIView*)getThreeLinesWithDataThreeStrs:(NSArray*)datas isFirst:(BOOL)isFirst{
    UIView* view=[[UIView alloc]initWithFrame:CGRectZero];
    
    //计算总高,初始值10为分割线下方的预留高度
    CGFloat height=10;
    
    //与大标题之间的分割线
    [view addSubview:[self getSeperatedLine]];
    
    //第一行str
    UIFont* font=[UIFont systemFontOfSize:18];
    CGSize size=[datas[0] boundingRectWithSize:CGSizeMake(280, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    UILabel* programName=[[UILabel alloc]initWithFrame:CGRectMake(20, height, 280, size.height)];
    programName.text=datas[0];
    programName.font=font;
    programName.numberOfLines=0;
    programName.textAlignment=NSTextAlignmentCenter;
    [view addSubview:programName];
    height+=programName.frame.size.height+5;
    
    //第二行str
    font=[UIFont systemFontOfSize:14];
    size=[datas[1] boundingRectWithSize:CGSizeMake(280, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    
    UILabel* areaLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, height, 280, size.height)];
    areaLabel.text=datas[1];
    areaLabel.numberOfLines=2;
    areaLabel.font=[UIFont systemFontOfSize:14];
    areaLabel.textAlignment=NSTextAlignmentCenter;
    [view addSubview:areaLabel];
    height+=areaLabel.frame.size.height+5;
    
    //第三行str
    font=[UIFont systemFontOfSize:13];
    size=[datas[2] boundingRectWithSize:CGSizeMake(280, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    
    UILabel* areaDetailLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, height, 280, isFirst?(size.height>20?32:size.height):size.height)];
    areaDetailLabel.text=datas[2];
    areaDetailLabel.numberOfLines=0;
    areaDetailLabel.textColor=RGBCOLOR(125, 125, 125);
    areaDetailLabel.font=[UIFont systemFontOfSize:13];
    areaDetailLabel.textAlignment=NSTextAlignmentCenter;
    [view addSubview:areaDetailLabel];
    height+=areaDetailLabel.frame.size.height+10;
    
    view.frame=CGRectMake(0, 0, 320, height);
    return view;
}

//分割线
+(UIView*)getSeperatedLine{
    UIView* view=[[UIView alloc]initWithFrame:CGRectMake(15, 0, 290, 1)];
    view.backgroundColor=RGBCOLOR(206, 206, 206);
    
    return view;
}

//program大块 二行
+(UIView*)getTwoLinesTitleViewWithTitle:(NSString*)title titleImage:(UIImage*)titleImage firstStrs:(NSArray*)firstStrs secondStrs:(NSArray*)secondStrs{
    UIView* view=[[UIView alloc]initWithFrame:CGRectZero];
    view.backgroundColor=RGBCOLOR(229, 229, 229);
    CGFloat height=0;//累加，最后给view
    
    UIView* part0=[self getTitleViewWithTitleImage:titleImage title:title];
    [view addSubview:part0];
    height+=part0.frame.size.height;
    
    UIView* part1=[self getBlackTwoLinesWithFirstStr:firstStrs secondStr:secondStrs];
    part1.backgroundColor=[UIColor clearColor];
    [part1 addSubview:[self getSeperatedLine]];
    part1.center=CGPointMake(160, height+part1.frame.size.height*.5);
    [view addSubview:part1];
    height+=part1.frame.size.height;
    
    view.frame=CGRectMake(0, 0, 320, height);
    return view;
}

//program大块 零行
+(UIView*)getNoLineTitleViewWithTitle:(NSString*)title titleImage:(UIImage*)titleImage{
    UIView* view=[self getTitleViewWithTitleImage:titleImage title:title];
    view.backgroundColor=RGBCOLOR(229, 229, 229);
    return view;
}

//图加图的数量
+(UIView*)getImageViewWithImageUrl:(NSString*)imageUrl count:(NSInteger)count{
    MyView* view=[[MyView alloc]init];
    view.frame=CGRectMake(0, 0, 320, 215.5);
    view.layer.masksToBounds=YES;
    view.backgroundColor=[UIColor grayColor];
    [view observeImage];
    view.myImageView.imageURL=[NSURL URLWithString:[NSString stringWithFormat:@"%@",imageUrl]];
    
    
    //图片数量label
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(0, 180, 70, 30)];
    label.text=[NSString stringWithFormat:@"%d张",count];
    label.textAlignment=NSTextAlignmentCenter;
    label.textColor=[UIColor whiteColor];
    label.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:.7];
    [view addSubview:label];
    
    return view;
}

+(void)addButtonToView:(UIView*)view target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    UIButton* button=[[UIButton alloc]initWithFrame:view.frame];
    button.tag=view.tag;
    [button addTarget:target action:action forControlEvents:controlEvents];
    [view addSubview:button];
}

+(UIView*)getOwnerTypeViewWithImage:(UIImage*)image owners:(NSArray*)owners{
    UIView* view=[[UIView alloc]initWithFrame:CGRectZero];
    view.backgroundColor=[UIColor whiteColor];
    
    UIImageView* imageView=[[UIImageView alloc]initWithFrame:CGRectMake(15, 0, 21, 21)];//CGRectMake(15, height+5, 21, 21)];
    imageView.image=image;
    [view addSubview:imageView];
    
    for (int i=0; i<owners.count; i++) {
        UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(45+i%3*((320-45)*1.0/3), i/3*30, 200, 20)];//CGRectMake(45, height+5, 200, 25)];
        label.text=owners[i];
        label.font=[UIFont systemFontOfSize:17];
        [view addSubview:label];
    }
    
    view.frame=CGRectMake(0, 0, 320, 35+(owners.count>0?(owners.count-1)/3*30:0));
    return view;
}

//第一行蓝，第二行黑，专门为土地信息做的view
+(UIView*)getBlueThreeTypesTwoLinesWithFirstStr:(NSArray*)firstStrs secondStr:(NSArray*)secondStrs{
    UIView* view=[[UIView alloc]initWithFrame:CGRectZero];
    view.backgroundColor=[UIColor whiteColor];
    
    //土地面积
    UILabel* areaFirstLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 160, 20)];
    areaFirstLabel.text=firstStrs[0];
    areaFirstLabel.textColor=RGBCOLOR(82, 125, 237);
    areaFirstLabel.font=[UIFont systemFontOfSize:14];
    areaFirstLabel.textAlignment=NSTextAlignmentLeft;
    [view addSubview:areaFirstLabel];
    
    UILabel* areaSecondLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 30, 160, 20)];
    areaSecondLabel.text=secondStrs[0];
    areaSecondLabel.textColor=RGBCOLOR(125, 125, 125);
    areaSecondLabel.font=[UIFont systemFontOfSize:14];
    areaSecondLabel.textAlignment=NSTextAlignmentLeft;
    [view addSubview:areaSecondLabel];

    //土地容积率
    UILabel* plotFirstLabel=[[UILabel alloc]initWithFrame:CGRectMake(160, 10, 160, 20)];
    plotFirstLabel.text=firstStrs[1];
    plotFirstLabel.textColor=RGBCOLOR(82, 125, 237);
    plotFirstLabel.font=[UIFont systemFontOfSize:14];
    plotFirstLabel.textAlignment=NSTextAlignmentCenter;
    [view addSubview:plotFirstLabel];
    
    UILabel* plotSecondLabel=[[UILabel alloc]initWithFrame:CGRectMake(160, 30, 160, 20)];
    plotSecondLabel.text=secondStrs[1];
    plotSecondLabel.textColor=RGBCOLOR(125, 125, 125);
    plotSecondLabel.font=[UIFont systemFontOfSize:14];
    plotSecondLabel.textAlignment=NSTextAlignmentCenter;
    [view addSubview:plotSecondLabel];
    
    //地块用途
    UILabel* usedFirstLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 10+60, 160, 20)];
    usedFirstLabel.text=firstStrs[2];
    usedFirstLabel.textColor=RGBCOLOR(82, 125, 237);
    usedFirstLabel.font=[UIFont systemFontOfSize:14];
    usedFirstLabel.textAlignment=NSTextAlignmentLeft;
    [view addSubview:usedFirstLabel];
    
    UILabel* usedSecondLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    usedSecondLabel.text=secondStrs[2];
    usedSecondLabel.numberOfLines=0;
    usedSecondLabel.textColor=RGBCOLOR(125, 125, 125);
    usedSecondLabel.font=[UIFont systemFontOfSize:14];
    usedSecondLabel.textAlignment=NSTextAlignmentLeft;
    CGRect bounds=[usedSecondLabel.text boundingRectWithSize:CGSizeMake( 280, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:14] forKey:NSFontAttributeName] context:nil];
    usedSecondLabel.frame=CGRectMake(20, 30+60, 280, bounds.size.height);
    [view addSubview:usedSecondLabel];
    
    view.frame=CGRectMake(0, 0, 320, 2*60+(bounds.size.height-20));
    return view;
}

//第一行蓝，第二行黑的view
+(UIView*)getBlueTwoLinesWithFirstStr:(NSArray*)firstStrs secondStr:(NSArray*)secondStrs{
    NSInteger count=firstStrs.count>=secondStrs.count?firstStrs.count:secondStrs.count;
    UIView* view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, (count+2)/3*60)];
    view.backgroundColor=[UIColor whiteColor];
    
    for (int i=0; i<firstStrs.count; i++) {
        UILabel* firstLabel=[[UILabel alloc]initWithFrame:CGRectMake(i%3*320*1.0/3, 10+i/3*60, 320*1.0/3, 20)];
        firstLabel.text=firstStrs[i];
        firstLabel.textColor=RGBCOLOR(82, 125, 237);
        firstLabel.font=[UIFont systemFontOfSize:14];
        firstLabel.textAlignment=NSTextAlignmentCenter;
        [view addSubview:firstLabel];
    }
    
    for (int i=0; i<secondStrs.count; i++) {
        UILabel* secondLabel=[[UILabel alloc]initWithFrame:CGRectMake(i%3*320*1.0/3, 30+i/3*60, 320*1.0/3, 20)];
        secondLabel.text=secondStrs[i];
        secondLabel.textColor=RGBCOLOR(125, 125, 125);
        secondLabel.font=[UIFont systemFontOfSize:14];
        secondLabel.textAlignment=NSTextAlignmentCenter;
        [view addSubview:secondLabel];
    }
    
    return view;
}

//第一行黑，第二行灰的view
+(UIView*)getBlackTwoLinesWithFirstStr:(NSArray*)firstStrs secondStr:(NSArray*)secondStrs{
    NSInteger count=firstStrs.count;
    UIView* view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 70)];
    view.backgroundColor=[UIColor whiteColor];
    
    for (int i=0; i<firstStrs.count; i++) {
        UILabel* firstLabel=[[UILabel alloc]initWithFrame:CGRectMake(i*320*1.0/count, 15, 320*1.0/count, 20)];
        firstLabel.text=firstStrs[i];
        firstLabel.textColor=[UIColor blackColor];
        firstLabel.font=[UIFont systemFontOfSize:16];
        firstLabel.textAlignment=NSTextAlignmentCenter;
        [view addSubview:firstLabel];
    }
    
    for (int i=0; i<secondStrs.count; i++) {
        UILabel* secondLabel=[[UILabel alloc]initWithFrame:CGRectMake(i*320*1.0/count, 35, 320*1.0/count, 20)];
        secondLabel.text=secondStrs[i];
        secondLabel.textColor=RGBCOLOR(125, 125, 125);
        secondLabel.font=[UIFont systemFontOfSize:14];
        secondLabel.textAlignment=NSTextAlignmentCenter;
        [view addSubview:secondLabel];
    }
    
    return view;
}

//处理model中的联系人,如果不满3个则补默认格式的联系人过去显示
+(NSArray*)loadContacts:(NSMutableArray*)contacts{
    NSMutableArray* array=[NSMutableArray arrayWithArray:contacts];
    for (int i=0; i<3-contacts.count; i++) {
        NSArray* tempAry=@[@"联系人",@"职位",@"单位名称",@"单位地址",@""];
        [array addObject:tempAry];
    }
    return array;
}

//联系人view
+(UIView*)getThreeContactsViewThreeTypesFiveStrs:(NSMutableArray*)dataAry{
    NSArray* datas=[[self loadContacts:dataAry] copy];
    
    UIView* view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, datas.count*120)];
    view.backgroundColor=[UIColor whiteColor];
    
    for (int i=0; i<datas.count; i++) {
        NSArray* array=datas[i];
        
        //名字
        UILabel* labelName=[[UILabel alloc]initWithFrame:CGRectMake(20, 14+i*120, 200, 20)];
        labelName.text=array[0];
        labelName.textAlignment=NSTextAlignmentLeft;
        labelName.textColor=RGBCOLOR(82, 125, 237);
        labelName.font=[UIFont systemFontOfSize:15];
        [view addSubview:labelName];
        
        //职位
        UILabel* jobLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 40+i*120, 150, 20)];
        jobLabel.text=array[1];
        jobLabel.font=[UIFont systemFontOfSize:14];
        [view addSubview:jobLabel];
        
        //单位名称
        UILabel* companyNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 60+i*120, 250, 20)];
        companyNameLabel.text=array[2];
        companyNameLabel.textColor=[UIColor grayColor];
        companyNameLabel.textAlignment=NSTextAlignmentLeft;
        companyNameLabel.font=[UIFont systemFontOfSize:14];
        [view addSubview:companyNameLabel];
        
        //地址
        UILabel* addressLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 80+i*120, 250, 20)];
        addressLabel.text=array[3];
        addressLabel.textColor=[UIColor grayColor];
        addressLabel.textAlignment=NSTextAlignmentLeft;
        addressLabel.font=[UIFont systemFontOfSize:14];
        [view addSubview:addressLabel];
        
        //电话图标
        UIImageView* imageView=[[UIImageView alloc]initWithFrame:CGRectMake(197, 46+i*120, 12.5, 12.5)];
        imageView.image=[GetImagePath getImagePath:@"021"];
        [view addSubview:imageView];
        
        //电话号码
        UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(215, 41+i*120, 100, 20)];
        label.text=array[4];
        label.font=[UIFont systemFontOfSize:14];
        label.textColor=[UIColor grayColor];
        [view addSubview:label];
        
        if (i!=datas.count-1) {
            //分割线1
            UIView* line1=[self getSeperatedLine];
            line1.center=CGPointMake(160, 119.5+i*120);
            [view addSubview:line1];
        }
    }
    return view;
}

//硬件设备以及yes和no  电梯,空调,供暖方式,外墙材料,钢结构,yes or no的几个view
+(UIView*)getDeviceAndBoolWithDevic:(NSArray*)devices boolStrs:(NSArray*)boolStrs{
    UIView* view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, devices.count*30)];
    view.backgroundColor=[UIColor whiteColor];
    
    //电梯,空调,供暖方式,外墙材料,钢结构 的label
    for (int i=0; i<devices.count; i++) {
        UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(20, 5+i*30, 150, 20)];
        label.text=devices[i];
        label.font=[UIFont systemFontOfSize:14];
        [view addSubview:label];
        
        //分割线
        UIView* separatorLine=[self getSeperatedLine];
        separatorLine.center=CGPointMake(160, .5+i*30);
        [view addSubview:separatorLine];
    }
    
    //yes or no的label
    for (int i=0; i<boolStrs.count; i++) {
        UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(250, 5+i*30, 50, 20)];
        label.text=boolStrs[i];
        label.font=[UIFont systemFontOfSize:14];
        label.textAlignment=NSTextAlignmentRight;
        label.textColor=[boolStrs[i] isEqualToString:@"Yes"]?[UIColor redColor]:[UIColor grayColor];
        [view addSubview:label];
    }
    
    return view;
}
@end
