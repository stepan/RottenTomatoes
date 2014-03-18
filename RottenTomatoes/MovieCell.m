//
//  MovieViewCell.m
//  RottenTomatoes
//
//  Created by Stepan Grigoryan on 3/13/14.
//  Copyright (c) 2014 Stepan Grigoryan. All rights reserved.
//

#import "UIImageView+AFNetworking.h"
#import "MovieCell.h"

@interface MovieCell ()
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UILabel *castLabel;

@end

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

- (void) styleCell
{
    [self.movieTitleLabel setText:self.movie.title];
    [self.synopsisLabel setText:self.movie.synopsis];
    NSURL *url = [[NSURL alloc] initWithString:self.movie.posterUrl] ;
    [self.posterView setImageWithURL:url];
    [self.castLabel setText:self.movie.cast];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (void) setMovie:(Movie *)movie
{
    _movie = movie;
    [self styleCell];
    
}

+ (NSString *)cellIdentifier
{
    return @"MovieCell";
}

@end
