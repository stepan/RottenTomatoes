//
//  Movie.m
//  RottenTomatoes
//
//  Created by Stepan Grigoryan on 3/15/14.
//  Copyright (c) 2014 Stepan Grigoryan. All rights reserved.
//

#import "Movie.h"

@implementation Movie

+ (NSArray *) getMovies:(id) object
{
    NSMutableArray *movies = [[NSMutableArray alloc] init];
    for(NSDictionary *dictionary in object[@"movies"])
    {
        Movie *movie = [[Movie alloc] initWithDictionary:dictionary];
        [movies addObject:movie];
    }
    return [movies copy];
}

- (id) initWithDictionary:(NSDictionary *) d
{
    self = [super init];
    if (self) {
        self.title = d[@"title"];
        self.synopsis = d[@"synopsis"];
        self.posterUrl = d[@"posters"][@"original"];
        self.cast = [self getCast:d];
    }
    return self;
}

- (NSString *)getCast:(NSDictionary *) dictionary
{
//    NSMutableArray *array = [[NSMutableArray alloc] init];
//    for(NSDictionary *castDictionary in dictionary[@"abridged_cast"])
//    {
//        [array addObject:castDictionary[@"name"]];
//    }
//    NsArray *array =
    return [[dictionary[@"abridged_cast"] valueForKey:@"name"] componentsJoinedByString:@", "];
}
@end
