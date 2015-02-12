//
//  SettingsViewController.m
//  FacebookDemo
//
//  Created by Shrikar Archak on 2/11/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingCell.h"

@interface SettingsViewController ()
@property (nonatomic, strong) NSArray *settings;
@property (nonatomic, strong) NSDictionary *settingState;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.settings = @[@"Links", @"Statuses", @"Photos", @"Videos"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SettingCell" bundle:nil] forCellReuseIdentifier:@"SettingCell"];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelClicked)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(applyClicked)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
}

- (void)applyClicked {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cancelClicked {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.settings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell"];
    
    cell.delegate = self;
    cell.settingLabel.text = self.settings[indexPath.row];
    
    return cell;
}

- (void)settingCell:(SettingCell *)settingCell didChangeValue:(BOOL)value {
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:settingCell];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
