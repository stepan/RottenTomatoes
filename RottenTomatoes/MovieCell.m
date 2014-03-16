//
//  MovieViewCell.m
//  RottenTomatoes
//
//  Created by Stepan Grigoryan on 3/13/14.
//  Copyright (c) 2014 Stepan Grigoryan. All rights reserved.
//

#import "UIImageView+AFNetworking.h"
#import "MovieCell.h"

@implementation MovieCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setData:(Movie *) movie
{
    [self.titleLabel setText:movie.title];
    [self.synopsisLabel setText:movie.synopsis];
    NSURL *url = [[NSURL alloc] initWithString:movie.posterUrl] ;
    [self.poster setImageWithURL:url];
    [self.castLabel setText:movie.cast];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

@end
