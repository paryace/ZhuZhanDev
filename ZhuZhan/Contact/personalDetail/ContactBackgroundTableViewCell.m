//
//  ContactBackgroundTableViewCell.m
//  ZhuZhan
//
//  Created by 汪洋 on 14/10/28.
//
//

#import "ContactBackgroundTableViewCell.h"

@implementation ContactBackgroundTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIView *back = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        back.backgroundColor = [UIColor colorWithPatternImage:[GetImagePath getImagePath:@"grayColor"]];
        [self addSubview:back];
        
        UIImageView *topLineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 5)];
        [topLineImage setImage:[UIImage imageNamed:@"项目－高级搜索－2_15a"]];
        [back addSubview:topLineImage];
        
        UIImageView *imgaeView = [[UIImageView alloc] initWithFrame:CGRectMake(129, 8, 52, 34)];
        imgaeView.image = [GetImagePath getImagePath:@"人脉－账号设置_10a"];
        [back addSubview:imgaeView];
        
        UILabel *realNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 55, 100, 30)];
        realNameLabel.text = @"真实姓名";
        realNameLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
        [self.contentView addSubview:realNameLabel];
        
        realName = [[UILabel alloc] initWithFrame:CGRectMake(110, 55, 100, 30)];
        realName.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
        realName.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:realName];
        
        UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(20, 90, 280, 1)];
        line.backgroundColor = [UIColor blackColor];
        [self addSubview:line];
        line.alpha = 0.2;
        
        UILabel *sexLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 95, 100, 30)];
        sexLabel.text = @"性       别";
        sexLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
        [self.contentView addSubview:sexLabel];
        
        sex = [[UILabel alloc] initWithFrame:CGRectMake(110, 95, 100, 30)];
        sex.textColor = [UIColor lightGrayColor];
        sex.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
        [self.contentView addSubview:sex];
        
        UIImageView *line2 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 130, 280, 1)];
        line2.backgroundColor = [UIColor blackColor];
        [self addSubview:line2];
        line2.alpha = 0.2;
        
        UILabel *locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 135, 100, 30)];
        locationLabel.text = @"所  在  地";
        locationLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
        [self.contentView addSubview:locationLabel];
        
        location = [[UILabel alloc] initWithFrame:CGRectMake(110, 135, 150, 30)];
        location.textColor = [UIColor lightGrayColor];
        location.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
        [self.contentView addSubview:location];
        
        UIImageView *line3 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 170, 280, 1)];
        line3.backgroundColor = [UIColor blackColor];
        [self addSubview:line3];
        line3.alpha = 0.2;
        
        UILabel *birthdayLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 175, 100, 30)];
        birthdayLabel.text = @"生        日";
        birthdayLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
        [self.contentView addSubview:birthdayLabel];
        
        birthday = [[UILabel alloc] initWithFrame:CGRectMake(110, 175, 100, 30)];
        birthday.textColor = [UIColor lightGrayColor];
        birthday.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
        [self.contentView addSubview:birthday];
        
        UIImageView *line4 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 210, 280, 1)];
        line4.backgroundColor = [UIColor blackColor];
        [self addSubview:line4];
        line4.alpha = 0.2;
        
        UILabel *constellationLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 215, 100, 30)];
        constellationLabel.text = @"星        座";
        constellationLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
        [self.contentView addSubview:constellationLabel];
        
        constellation = [[UILabel alloc] initWithFrame:CGRectMake(110, 215, 100, 30)];
        constellation.textColor = [UIColor lightGrayColor];
        constellation.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
        [self.contentView addSubview:constellation];
        
        UIImageView *line5 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 245, 280, 1)];
        line5.backgroundColor = [UIColor blackColor];
        [self addSubview:line5];
        line5.alpha = 0.2;
        
        UILabel *bloodTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 250, 100, 30)];
        bloodTypeLabel.text = @"血        型";
        bloodTypeLabel.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
        [self.contentView addSubview:bloodTypeLabel];
        
        bloodType = [[UILabel alloc] initWithFrame:CGRectMake(110, 250, 100, 30)];
        bloodType.textColor = [UIColor lightGrayColor];
        bloodType.font = [UIFont fontWithName:@"GurmukhiMN" size:14];
        [self.contentView addSubview:bloodType];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(MyCenterModel *)model{
    realName.text = model.a_realName;
    sex.text = model.a_sex;
    location.text = model.a_location;
    birthday.text = model.a_birthday;
    constellation.text = model.a_constellation;
    bloodType.text = model.a_bloodType;
}
@end
