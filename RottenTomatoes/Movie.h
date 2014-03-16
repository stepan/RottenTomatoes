//
//  Movie.h
//  RottenTomatoes
//
//  Created by Stepan Grigoryan on 3/15/14.
//  Copyright (c) 2014 Stepan Grigoryan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSString *posterUrl;
@property (nonatomic, strong) NSString *cast;
+ (NSArray *) getMovies:(id) object;
- (id) initWithDictionary:(NSDictionary *) d;
@end
