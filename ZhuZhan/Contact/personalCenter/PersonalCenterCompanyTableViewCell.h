//
//  PersonalCenterCompanyTableViewCell.h
//  ZhuZhan
//
//  Created by 汪洋 on 14/12/22.
//
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"
@interface PersonalCenterCompanyTableViewCell : UITableViewCell{
    EGOImageView *headImage;
    UILabel *titleLabel;
    UILabel *contentLabel;
}
@property(nonatomic,strong)NSString *companyName;
@property(nonatomic,strong)NSString *imageUrl;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
