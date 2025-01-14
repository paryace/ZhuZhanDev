//
//  TopicsModel.m
//  ZhuZhan
//
//  Created by 汪洋 on 14-8-27.
//
//

#import "TopicsModel.h"
#import "ProjectStage.h"
@implementation TopicsModel
-(void)setDict:(NSDictionary *)dict{
    _dict = dict;
    self.a_id = [ProjectStage ProjectStrStage:dict[@"id"]];
    self.a_title = [ProjectStage ProjectStrStage:dict[@"seminarName"]];
    self.a_content = [ProjectStage ProjectStrStage:dict[@"seminarDescription"]];
    if(![[ProjectStage ProjectStrStage:dict[@"seminarPictureLocation"]] isEqualToString:@""]){
        self.a_image = [NSString stringWithFormat:@"%s%@",serverAddress,[ProjectStage ProjectStrStage:dict[@"seminarPictureLocation"]]];
    }else{
        self.a_image = [ProjectStage ProjectStrStage:dict[@"seminarPictureLocation"]];
    }
    self.a_projectCount = [ProjectStage ProjectStrStage:[NSString stringWithFormat:@"%@",dict[@"projectCounts"]]];
    self.a_publishTime = [ProjectStage ProjectTimeStage:dict[@"createTime"]];
}
@end
