//
//  SendPapCell.m
//  MVP
//
//  Created by Darshan on 27/06/16.
//  Copyright © 2016 Darshan. All rights reserved.
//

#import "SendPapCell.h"

@implementation SendPapCell

//UIView
@synthesize backView;

//UILabel
@synthesize lblUserName;
@synthesize lblUserComment;
@synthesize lblUserCommentTime;

@synthesize imgAsync;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    backView.layer.cornerRadius = 30.0f;
    backView.clipsToBounds = YES;
    backView.layer.borderWidth = 1.0f;
    backView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    
    imgAsync.layer.cornerRadius = 30.0f;
    imgAsync.clipsToBounds = YES;

}

-(void)setPapChatData:(PapChat*)objPap
{
    
    NSString *imageName;
    
    if (objPap.img_url == nil || [objPap.img_url isEqualToString:@""]) {
        imgAsync.image = [UIImage imageNamed:@"btnPlaceHolder.png"];
    }else{
        imageName = [NSString stringWithFormat:@"%@",objPap.img_url];
        [imgAsync loadImageFromStringforUserimg:imageName];
    }
    
    lblUserName.text = objPap.name;
    lblUserComment.text = objPap.item_type;
    
    NSArray *components = [objPap.DtStamp componentsSeparatedByString:@" "];
    NSString *time = components[1];
    
    NSDateFormatter *dateF = [[NSDateFormatter alloc] init];
    [dateF setDateFormat:@"HH:mm:ss"];
    NSDate *date = [dateF dateFromString:time];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm"];
    
    NSString *strTime = [dateFormat stringFromDate:date];
    
    NSArray *timeComponent = [strTime componentsSeparatedByString:@":"];
    NSString *hour = timeComponent[0];
    
    int value = [hour intValue];
    
    if (value > 12) {
        lblUserCommentTime.text = [NSString stringWithFormat:@"%@ PM",strTime];
    }else{
        lblUserCommentTime.text = [NSString stringWithFormat:@"%@ AM",strTime];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
