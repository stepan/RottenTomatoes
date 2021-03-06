//
//  MoviesViewController.m
//  RottenTomatoes
//
//  Created by Stepan Grigoryan on 3/13/14.
//  Copyright (c) 2014 Stepan Grigoryan. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieCell.h"
#import "Movie.h"
#import "MovieViewController.h"
#import "MMProgressHUD.h"

@interface MoviesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *networkErrorLabel;
@property (strong, nonatomic) NSArray *movies;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) NSString *apiURL;
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

- (id) initWithMode:(enum MoviesViewControllerMode)aMode
{
    self = [self init];
    if (self) {
        if (aMode == MoviesViewControllerModeBoxOffice) {
            [self setTitle:@"Box Office"];
            self.apiURL = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
        }
        else{
            [self setTitle:@"Top Rentals"];
            self.apiURL = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
        }
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.rowHeight = 125;
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellReuseIdentifier:[MovieCell cellIdentifier]];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    [refreshControl addTarget:self action:@selector(fetchMovies) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    self.refreshControl = refreshControl;
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleFade];
    [MMProgressHUD showWithTitle:@"Loading"];
    
    [self fetchMovies];
}

- (void)fetchMovies
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.apiURL]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        [MMProgressHUD dismiss];
        if (connectionError) {
            [self.networkErrorLabel setHidden:NO];
        }
        else{
            [self.networkErrorLabel setHidden:YES];
            self.movies = [Movie getMovies:[NSJSONSerialization JSONObjectWithData:data options:0 error:nil]];
        }
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.movies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MovieCell *cell = (MovieCell *) [tableView dequeueReusableCellWithIdentifier:[MovieCell cellIdentifier] forIndexPath:indexPath];
    cell.movie = self.movies[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieViewController *movieViewController = [[MovieViewController alloc] initWithMovie:self.movies[indexPath.row]];
    [self.navigationController pushViewController:movieViewController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
