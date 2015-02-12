//
//  PhotoCell.h
//  FacebookDemo
//
//  Created by Shrikar Archak on 2/11/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end
