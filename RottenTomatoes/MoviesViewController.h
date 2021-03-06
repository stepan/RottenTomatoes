//
//  MoviesViewController.h
//  RottenTomatoes
//
//  Created by Stepan Grigoryan on 3/13/14.
//  Copyright (c) 2014 Stepan Grigoryan. All rights reserved.
//

#import <UIKit/UIKit.h>

enum MoviesViewControllerMode {
    MoviesViewControllerModeRental,
    MoviesViewControllerModeBoxOffice
};

@interface MoviesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    enum MoviesViewControllerMode mode;
}
-(id)initWithMode:(enum MoviesViewControllerMode)aMode;

@end
