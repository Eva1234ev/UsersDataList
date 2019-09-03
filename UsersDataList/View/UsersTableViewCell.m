//
//  UsersTableViewCell.m
//  UsersDataList
//
//  Created by Eva on 27.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import "UsersTableViewCell.h"
#import <SDWebImage/SDWebImage.h>
#import "UserData.h"
@interface UsersTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *userEmailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userAvatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *userFirstLastNameLabel;
@property (weak, nonatomic) IBOutlet UIView *view;
@end
@implementation UsersTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.userAvatarImageView.layer.cornerRadius =  self.userAvatarImageView.frame.size.width/2;
    self.userAvatarImageView.layer.masksToBounds=YES;
    self.view.layer.cornerRadius =  10;
    self.view.layer.masksToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)userData:(UserData *) user{
    
    self.userEmailLabel.text = user.email;
    self.userFirstLastNameLabel.text= [NSString stringWithFormat:@"%@ %@",user.first_name, user.last_name];
    [self.userAvatarImageView sd_setImageWithURL:[NSURL URLWithString:user.avatar]
                  placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
}
@end
