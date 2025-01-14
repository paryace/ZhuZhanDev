//
//  ProjectTableViewCell.m
//  ZhuZhan
//
//  Created by 汪洋 on 14-8-26.
//
//

#import "ProjectTableViewCell.h"
#import "ProjectStage.h"
@implementation ProjectTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(projectModel *)model fromView:(NSString *)fromView
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = RGBCOLOR(239, 237, 237);
        if([fromView isEqualToString:@"project"]){
            flag = 0;
        }else if([fromView isEqualToString:@"topics"]){
            flag = 1;
        }
        [self addContent:model];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)addContent:(projectModel *)model{
    UIImageView *bgImgView = [[UIImageView alloc] init];
    if(flag == 0){
        [bgImgView setFrame:CGRectMake(15,0,291.5,260)];
    }else if(flag == 1){
        [bgImgView setFrame:CGRectMake(15,10,291.5,260)];
    }
    [bgImgView setImage:[GetImagePath getImagePath:@"全部项目_10"]];
    [self addSubview:bgImgView];
    
    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,5,160,36)];
    nameLabel.font = [UIFont fontWithName:@"GurmukhiMN-Bold" size:15];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.text = model.a_projectName;
    [bgImgView addSubview:nameLabel];
    
    investmentLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,55,85,20)];
    investmentLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
    investmentLabel.textColor = BlueColor;
    investmentLabel.text = @"投资额(百万)";
    [bgImgView addSubview:investmentLabel];
    
    investmentcountLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,75,90,20)];
    investmentcountLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
    investmentcountLabel.textColor = [UIColor blackColor];
    investmentcountLabel.text = [NSString stringWithFormat:@"%@",model.a_investment];
    [bgImgView addSubview:investmentcountLabel];
    
    areaLabel = [[UILabel alloc] initWithFrame:CGRectMake(130,55,75,20)];
    areaLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
    areaLabel.textColor = BlueColor;
    areaLabel.text = @"建筑面积㎡";
    [bgImgView addSubview:areaLabel];
    
    areacountLabel = [[UILabel alloc] initWithFrame:CGRectMake(130,75,90,20)];
    areacountLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
    areacountLabel.textColor = [UIColor blackColor];
    areacountLabel.text = [NSString stringWithFormat:@"%@",model.a_area];
    [bgImgView addSubview:areacountLabel];
    
    progressImage = [[UIImageView alloc] initWithFrame:CGRectMake(215,10,52,52)];
    if([model.a_projectstage isEqualToString:@"1"]){
        [progressImage setImage:[GetImagePath getImagePath:@"+项目-首页_21a"]];
    }else if([model.a_projectstage isEqualToString:@"2"]){
        [progressImage setImage:[GetImagePath getImagePath:@"+项目-首页_23a"]];
    }else if([model.a_projectstage isEqualToString:@"3"]){
        [progressImage setImage:[GetImagePath getImagePath:@"+项目-首页_25a"]];
    }else{
        [progressImage setImage:[GetImagePath getImagePath:@"+项目-首页_27a"]];
    }
    [bgImgView addSubview:progressImage];
    
    startdateLabel = [[UILabel alloc] initWithFrame:CGRectMake(210,62,65,20)];
    startdateLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    startdateLabel.textColor = GrayColor;
    startdateLabel.text = [model.a_exceptStartTime stringByReplacingOccurrencesOfString:@"-" withString:@"/"];
    [bgImgView addSubview:startdateLabel];
    
    enddateLabel = [[UILabel alloc] initWithFrame:CGRectMake(210,75,65,20)];
    enddateLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:12];
    enddateLabel.textColor = [UIColor orangeColor];
    enddateLabel.text = [model.a_exceptFinishTime stringByReplacingOccurrencesOfString:@"-" withString:@"/"];
    [bgImgView addSubview:enddateLabel];
    
    UIImageView *bigImage = [[UIImageView alloc] initWithFrame:CGRectMake(2.5,100,286.5,109.5)];
    [bigImage setImage:[GetImagePath getImagePath:@"全部项目_37"]];
    [bgImgView addSubview:bigImage];
    
    UIImageView *arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(13,225,16,20)];
    [arrowImage setImage:[GetImagePath getImagePath:@"全部项目_17"]];
    [bgImgView addSubview:arrowImage];
    
    UIImageView *dianImage = [[UIImageView alloc] initWithFrame:CGRectMake(275,225,18,20)];
    [dianImage setImage:[UIImage imageNamed:@"项目-首页_18a"]];
    [self addSubview:dianImage];
    
    UIButton *dianBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [dianBtn setFrame:CGRectMake(265,220,30,30)];
    //dianBtn.backgroundColor = [UIColor redColor];
    [dianBtn addTarget:self action:@selector(dianBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:dianBtn];
    
    
    zoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(35,225,60,20)];
    zoneLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
    zoneLabel.textColor = BlueColor;
    zoneLabel.text = @"华南区 -";
    [bgImgView addSubview:zoneLabel];
    
    addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(90,225,160,20)];
    addressLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
    addressLabel.textColor = [UIColor blackColor];
    addressLabel.text = model.a_landAddress;
    [bgImgView addSubview:addressLabel];
    
    NSLog(@"%f",dianBtn.frame.origin.y);
}

-(void)dianBtnClick{
    if([self.delegate respondsToSelector:@selector(addProjectCommentView:)]){
        [self.delegate addProjectCommentView:self.indexRow];
    }
}

-(void)setModel:(projectModel *)model{
    nameLabel.text = model.a_projectName;
    NSString* investmentHead=[model.a_investment isEqualToString:@""]?@"":@"￥";
    investmentcountLabel.text = [investmentHead stringByAppendingString:model.a_investment];
    
    NSString* areacountExtra=[model.a_area isEqualToString:@""]?@"":@"㎡";
    areacountLabel.text = [model.a_area stringByAppendingString:areacountExtra];
;
    NSLog(@"%@",model.a_projectstage);
    if([model.a_projectstage isEqualToString:@"1"]){
        [progressImage setImage:[GetImagePath getImagePath:@"+项目-首页_21a"]];
    }else if([model.a_projectstage isEqualToString:@"2"]){
        [progressImage setImage:[GetImagePath getImagePath:@"+项目-首页_23a"]];
    }else if([model.a_projectstage isEqualToString:@"3"]){
        [progressImage setImage:[GetImagePath getImagePath:@"+项目-首页_25a"]];
    }else if([model.a_projectstage isEqualToString:@"4"]){
        [progressImage setImage:[GetImagePath getImagePath:@"+项目-首页_27a"]];
    }else{
        [progressImage setImage:[GetImagePath getImagePath:@"+项目-首页_21a"]];
    }
    
    startdateLabel.text = [model.a_exceptStartTime stringByReplacingOccurrencesOfString:@"-" withString:@"/"];
    enddateLabel.text = [model.a_exceptFinishTime stringByReplacingOccurrencesOfString:@"-" withString:@"/"];
    addressLabel.text = model.a_landAddress;
    zoneLabel.text = [model.a_district isEqualToString:@""]?model.a_district:[NSString stringWithFormat:@"%@ - ",model.a_district];
}
@end
