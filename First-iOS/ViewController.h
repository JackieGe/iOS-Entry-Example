//
//  ViewController.h
//  First-iOS
//
//  Created by jackiege on 04/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h> 


@protocol Runnable <NSObject>

- (void)runDistance:(double)meters;
- (void)stop;

@end

@interface ViewController : UIViewController
@end



