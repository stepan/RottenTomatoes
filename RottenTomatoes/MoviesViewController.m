//
//  MoviesViewController.m
//  RottenTomatoes
//
//  Created by Stepan Grigoryan on 3/13/14.
//  Copyright (c) 2014 Stepan Grigoryan. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"

@interface MoviesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *movies;
@end

@implementation MoviesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setTitle:@"Movies"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 125;
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellReuseIdentifier:@"MovieCell"];

    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            UILabel *networkErrorLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 65, 320, 30)];
            [networkErrorLabel setText:@"Network Error"];
            networkErrorLabel.textColor = [UIColor whiteColor];
            networkErrorLabel.backgroundColor = [UIColor blackColor];
            networkErrorLabel.alpha = 0.5;
            networkErrorLabel.textAlignment = NSTextAlignmentCenter;
            [networkErrorLabel setFont:[UIFont systemFontOfSize:14]];
            [self.view addSubview:networkErrorLabel];
        }
        else{
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            self.movies = object[@"movies"];
            [self.tableView reloadData];
        }

    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.movies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MovieCell *cell = (MovieCell *) [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
    NSDictionary *movie = self.movies[indexPath.row];
    [cell.titleLabel setText:movie[@"title"]];
    [cell.synopsisLabel setText:movie[@"synopsis"]];
    NSURL *url = [[NSURL alloc] initWithString:movie[@"posters"][@"original"]] ;
    [cell.poster setImageWithURL:url];
    return cell;
}

@end
