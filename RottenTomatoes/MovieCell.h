//
//  MovieViewCell.h
//  RottenTomatoes
//
//  Created by Stepan Grigoryan on 3/13/14.
//  Copyright (c) 2014 Stepan Grigoryan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UITextView *synopsis;
@property (weak, nonatomic) IBOutlet UITextView *cast;

@end