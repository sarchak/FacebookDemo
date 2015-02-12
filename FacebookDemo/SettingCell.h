//
//  SettingCell.h
//  FacebookDemo
//
//  Created by Shrikar Archak on 2/11/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingCell;

@protocol SettingCellDelegate <NSObject>

- (void)settingCell:(SettingCell *)settingCell didChangeValue:(BOOL)value;

@end

@interface SettingCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *settingLabel;
@property (weak, nonatomic) IBOutlet UISwitch *settingSwitch;
@property (nonatomic, weak) id<SettingCellDelegate> delegate;

@end


