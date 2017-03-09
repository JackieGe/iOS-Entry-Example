//
//  Car+Contact.m
//  First-iOS
//
//  Created by jackiege on 05/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "Car+Contact.h"

@implementation Car (Contact)
- (NSString *)getCarInfo {
    return  [[NSString alloc] initWithFormat:@"brand: %@, price: %lf", self.brand, self.price];
}
@end
