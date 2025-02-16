//
//  TopicsTableViewCell.m
//  ZhuZhan
//
//  Created by 汪洋 on 14-8-27.
//
//

#import "TopicsTableViewCell.h"

@implementation TopicsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(TopicsModel *)model
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //618,210  264,210
        self.backgroundColor = RGBCOLOR(239, 237, 237);
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

-(void)addContent:(TopicsModel *)model{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(2, 5, 316, 111)];
    UIImageView *bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 316, 111)];
    [bgImage setImage:[GetImagePath getImagePath:@"项目－项目专题_02a"]];
    [bgView addSubview:bgImage];
    
    [self.contentView addSubview:bgView];
    
    headImageView = [[EGOImageView alloc] initWithPlaceholderImage:[GetImagePath getImagePath:@"＋项目－项目专题_11a"]];
    [headImageView setFrame:CGRectMake(3, 2, 132, 106)];
    headImageView.showActivityIndicator = YES;
    NSLog(@"%@",model.a_image);
    headImageView.imageURL = [NSURL URLWithString:model.a_image];
    [bgView addSubview:headImageView];
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(147, 8, 157, 30)];
    titleLabel.text = model.a_title;
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textColor = BlueColor;
    [bgView addSubview:titleLabel];
    
    contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(147, 28, 157, 50)];
    contentLabel.numberOfLines = 2;
    contentLabel.text = model.a_content;
    contentLabel.font = [UIFont systemFontOfSize:12];
    [bgView addSubview:contentLabel];
    
    UIImageView *countImage = [[UIImageView alloc] initWithFrame:CGRectMake(147, 87, 11, 13)];
    [countImage setImage:[GetImagePath getImagePath:@"项目－项目专题_03a"]];
    [bgView addSubview:countImage];
    
    projectCount = [[UILabel alloc] initWithFrame:CGRectMake(170, 83, 100, 20)];
    projectCount.text = model.a_projectCount;
    projectCount.font = [UIFont systemFontOfSize:14];
    projectCount.textColor = [UIColor redColor];
    [bgView addSubview:projectCount];
    
    dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(225, 83, 100, 20)];
    dateLabel.text = model.a_publishTime;
    dateLabel.font = [UIFont systemFontOfSize:14];
    dateLabel.textColor = [UIColor grayColor];
    [bgView addSubview:dateLabel];
}
@end
