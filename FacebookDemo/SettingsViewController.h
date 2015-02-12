//
//  SettingsViewController.h
//  FacebookDemo
//
//  Created by Shrikar Archak on 2/11/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingCell.h"

@class SettingsViewController;

@protocol SettingsViewControllerDelegate <NSObject>

- (void)settingsViewController: (SettingsViewController*) settingsViewController didChangeSettings: (NSDictionary*) settings;

@end

@interface SettingsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, SettingCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,weak) id<SettingsViewControllerDelegate> delegate;
@end
