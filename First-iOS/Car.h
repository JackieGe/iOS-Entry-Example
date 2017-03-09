//
//  Car.h
//  First-iOS
//
//  Created by jackiege on 04/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
/*
 */
@property (nonatomic, copy) NSString *brand;

/*
 */
@property (nonatomic, assign) double price;

- (void)run:(double)kilometers;
- (void)fuleUp:(double)petrolVolume;
@end
