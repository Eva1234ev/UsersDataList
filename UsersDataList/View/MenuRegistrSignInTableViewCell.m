//
//  MenuRegistrSignInTableViewCell.m
//  
//
//  Created by Eva on 29.08.2019.
//

#import "MenuRegistrSignInTableViewCell.h"

@implementation MenuRegistrSignInTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
 
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)registartionButtonAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(registrationProfile)]) {
        [self.delegate registrationProfile];
    }
}

- (IBAction)signInButtonAction:(UIButton *)sender {
}
@end
