//
//  MovieViewController.m
//  RottenTomatoes
//
//  Created by Stepan Grigoryan on 3/15/14.
//  Copyright (c) 2014 Stepan Grigoryan. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "MovieViewController.h"

@interface MovieViewController ()
@property (nonatomic, strong) Movie *movie;
@end

@implementation MovieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = self.movie.title;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.castLabel setText:self.movie.cast];
    [self.synopsisLabel setText:self.movie.synopsis];
    NSURL *url = [[NSURL alloc] initWithString:self.movie.posterUrl];
    [self.poster setImageWithURL:url];
    self.poster.contentMode = UIViewContentModeScaleAspectFill;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id) initWithMovie:(Movie *) movie
{
    self = [super init];
    if (self) {
        self.movie = movie;
    }
    return self;
}

@end
