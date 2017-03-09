//
//  ViewController.m
//  First-iOS
//
//  Created by jackiege on 04/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//
#import <objc/runtime.h>
#import "ViewController.h"
#import "Car.h"
#import "Car+Contact.h"
#import "NSString+Other.h"


@interface ViewController () <Runnable>

@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UIButton *btnShowTime;

@end

typedef void (^block_t) (void);

@implementation ViewController

- (void)runDistance:(double)meters {
    NSLog(@"run %lf meters", meters);
    
}

- (void)writeLog:(NSString*)log {
    NSLog(@"%@", log);
}

- (void)stop {
    NSLog(@"stopped");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // self.view.backgroundColor = [UIColor yellowColor];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)showTime:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"www.baidu.com"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSLog(@"Begin to get www.baidu.com");
    if (error) {
        NSLog(@"%@", [error description]);
    } else {
        
    }

    
    NSString *myString0 = @"Jackie Ge ";
    NSLog(@"appended string = %@", [myString0 addSix]);
    __block int aNum = 1000;
    block_t block = ^{
        aNum++;
        NSLog(@"runing in a block, the num inside block = %d", aNum);
    };
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, block);
    //[self.lblTime setText:@"123"];
    // NSDate *date = [NSDate new];
    //NSString *string = [[NSString alloc] initWithFormat:@"%1$@ %2$@" arguments:@"Hello",@"world"];
    NSString *fullName = [[NSString alloc] initWithFormat:@"%1$@ %2$@", @"Jackie", @"Ge"];
    
    Car *car = [[Car alloc] init];
    car.brand = @"BMW";
    car.price = 300000.0;
    [car run:1000];
    [car fuleUp:30];
    NSLog(@"Car info: %@", [car getCarInfo]);
    
    NSString *parameter1 = @"1";
    NSString *parameter2 = @"2";
    
    NSString *myString;
    myString = [NSString stringWithFormat:@"I want to print parameter1 here: %1$@, parameter2 here: %2$@ and now access parameter1 again: %1$@ _without_ passing it again.",parameter1, parameter2];
    [self.lblTime setText:fullName];
    
    if ([self respondsToSelector:NSSelectorFromString(@"runDistance:")]) {
        NSLog(@"runDistance implements");
    }
    
    unsigned int ivarCount;
    Ivar *ivar = class_copyIvarList([self class], &ivarCount);
    NSMutableArray *ivarList = [NSMutableArray arrayWithCapacity:ivarCount];
    for (int i = 0; i < ivarCount; i++) {
        Ivar var = ivar[i];
        const char *name = ivar_getName(var);
        const char *type = ivar_getTypeEncoding(var);
        NSMutableDictionary<NSString*, NSString*> *md = [NSMutableDictionary<NSString*, NSString*> dictionaryWithCapacity:2];
        md[@"name"] = [NSString stringWithUTF8String:name];
        [md setObject:[NSString stringWithUTF8String:type] forKey:@"type"];
        ivarList[i] = md;
    }
    free(ivar);
    
    
    for(int i = 0; i < [ivarList count]; i++) {
        NSMutableDictionary<NSString*, NSString*> *md = (NSMutableDictionary<NSString*, NSString*> *)ivarList[i];
        NSLog(@"name:%@, type:%@", md[@"name"], md[@"type"]);
    }
    
    if ([self respondsToSelector:@selector(stop)]) {
        NSLog(@"stop implements");
    }
    
    [ivarList exchangeObjectAtIndex:0 withObjectAtIndex:1];
    
    Method method = class_getInstanceMethod([self class], @selector(showTime:));
    //SEL methodName = method_getName(method);
    const char* methodType = method_getTypeEncoding(method);
    NSLog(@"----> method type = %s, method name = ", methodType);
    
    [self performSelector:@selector(writeLog:) withObject:@"Hello -----"];
    
}

- (IBAction)showCurrentTime:(id)sender {
    [ self.lblTime setText:@"getting time..." ];
}

@end
