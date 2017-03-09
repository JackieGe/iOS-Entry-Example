//
//  Car.m
//  First-iOS
//
//  Created by jackiege on 04/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "Car.h"

@interface Car ()
// -(void) eat;
@end

@implementation Car
- (void)run:(double)kilometers {
    NSLog(@"run %lf", kilometers);
}

- (void)fuleUp:(double)petrolVolume {
     NSLog(@"fuel up %lf", petrolVolume);
}

- (void) eat {
    
}
@end
