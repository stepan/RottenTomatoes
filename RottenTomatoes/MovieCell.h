//
//  MovieViewCell.h
//  RottenTomatoes
//
//  Created by Stepan Grigoryan on 3/13/14.
//  Copyright (c) 2014 Stepan Grigoryan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieCell : UITableViewCell
@property (nonatomic, strong) Movie *movie;
+ (NSString *)cellIdentifier;
@end