//
//  MenuSettingsTableViewCell.m
//  UsersDataList
//
//  Created by Eva on 29.08.2019.
//  Copyright © 2019 Eva. All rights reserved.
//

#import "MenuSettingsTableViewCell.h"
@interface MenuSettingsTableViewCell (){

    __weak IBOutlet UIImageView *imgIcon;
    __weak IBOutlet UILabel *lblMenu;
}

@end
@implementation MenuSettingsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (void)setInfo:(NSDictionary *)info{
    
    NSString *langID = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSString *lang = [[NSLocale currentLocale] displayNameForKey:NSLocaleLanguageCode value:langID];
    
    [imgIcon setImage:[UIImage imageNamed:info[@"icon"]]];
    //    imgIcon.frame = CGRectMake(imgIcon.frame.origin.x, imgIcon.frame.origin.y,img.size.width, img.size.height);
    lblMenu.text =  info[@"name"];
}

@end
