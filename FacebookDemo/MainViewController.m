//
//  MainViewController.m
//  FacebookDemo
//
//  Created by Timothy Lee on 10/22/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

#import "MainViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "PhotoCell.h"
#import "StatusCell.h"
#import "UIImageView+AFNetworking.h"
#import "SettingsViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray* posts;
- (void)reload;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self reload];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 90;
    // Do any additional setup after loading the view from its nib.
    [self.tableView registerNib:[UINib  nibWithNibName:@"PhotoCell" bundle:nil] forCellReuseIdentifier:@"PhotoCell"];
    [self.tableView registerNib:[UINib  nibWithNibName:@"StatusCell" bundle:nil] forCellReuseIdentifier:@"StatusCell"];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(settingsClicked)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

-(void) settingsClicked {
    
    NSLog(@"Settings clicked");
    SettingsViewController *svc = [[SettingsViewController alloc] init];
    svc.delegate = self;
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:svc];
    [self presentViewController:nvc animated:true completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

- (void)settingsViewController: (SettingsViewController*) settingsViewController didChangeSettings: (NSDictionary*) settings {
    NSLog(@"In main view controller %@", settings);
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *data = self.posts[indexPath.row];
    NSString *message = [data objectForKey:@"message"];
    NSString *picture = [data objectForKey:@"picture"];

    
    UITableViewCell *cell = nil;
    if(picture != nil) {
        PhotoCell *pcell =  [tableView dequeueReusableCellWithIdentifier:@"PhotoCell"];
        [pcell.posterImageView setImageWithURL:[NSURL URLWithString:picture]];
        pcell.statusLabel.text = message;
        cell = pcell;
    
    } else {
        StatusCell *scell = [tableView dequeueReusableCellWithIdentifier:@"StatusCell"];
        scell.statusLabel.text = message;
        cell = scell;
    }
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Private methods

- (void)reload {
    [FBRequestConnection startWithGraphPath:@"/me/home"
                                 parameters:nil
                                 HTTPMethod:@"GET"
                          completionHandler:^(
                                              FBRequestConnection *connection,
                                              id result,
                                              NSError *error
                                              ) {
                              /* handle the result */
                              NSLog(@"result: %@", result);
                              self.posts = result[@"data"];
                              [self.tableView reloadData];
                          }];
}

@end
