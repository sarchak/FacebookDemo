//
//  SettingCell.m
//  FacebookDemo
//
//  Created by Shrikar Archak on 2/11/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

#import "SettingCell.h"

@implementation SettingCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)valueChanged:(id)sender {
    [self.delegate settingCell:self didChangeValue:self.settingSwitch.on];
}

@end
