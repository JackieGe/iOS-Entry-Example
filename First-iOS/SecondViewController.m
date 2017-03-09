//
//  SecondViewController.m
//  First-iOS
//
//  Created by jackiege on 05/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lbTime;
@property (weak, nonatomic) IBOutlet UIButton *btnClick;

@property (weak, nonatomic) IBOutlet UITextField *txtName;


// - (void)showCurrentTime;

@end



@implementation SecondViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view1 = [ [UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view1];
    
    UIView *view2 = [ [UIView alloc] initWithFrame:CGRectMake(200, 300, 100, 100)];
    view2.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:view2];
    
    view1.alpha = 0.3;
    view1.tag  = 1;
    view2.tag = 2;
    UIView *foundChild = [self.view viewWithTag:1];
    foundChild.backgroundColor = [UIColor blackColor];
    [self.view bringSubviewToFront:foundChild];
    [self.view sendSubviewToBack:foundChild];
    // view2.hidden = true;
    // view2.center = self.view.center;
    // [self showCurrentTime];
    // NSLog(@"viewDidLoad executed");
    // Do any additional setup after loading the view from its nib.
}



- (void) viewWillDisappear:(BOOL)animated {
    [self showCurrentTime];
    NSLog(@"viewWillDisappear executed");
   
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"viewWillDisappear executed");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showTime:(id)sender {
    NSURL *url = [NSURL URLWithString:@"www.baidu.com"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"GET"];
    // [request setValue:<#(nullable NSString *)#> forHTTPHeaderField:<#(nonnull NSString *)#>]
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error) {
        NSLog(@"%@", [error description]);
    } else {
        
    }
    [self showCurrentTime];
}

- (IBAction)txtNameEditingDidEnd:(id)sender {
    UITextField *txtField = (UITextField *)sender;
    self.lbTime.text = txtField.text;
    NSLog(@"txtNameEditingDidEnd");
}

- (IBAction)txtNameEditingChanged:(id)sender {
    UITextField *txtField = (UITextField *)sender;
    self.lbTime.text = txtField.text;
    //[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}
- (IBAction)txtNameEditingDidBegin:(id)sender {
    NSLog(@"txtNameEditingDidBegin");
}


- (void)showCurrentTime {
    NSDate *date = [[NSDate alloc] init];
    //[self.lbTime setText:[date time]];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *currentTimeString = [format stringFromDate:date];
    //[self.lbTime setText:currentTimeString];
    self.lbTime.text = currentTimeString;
    self.lbTime.textAlignment = NSTextAlignmentCenter;
    self.lbTime.textColor = [UIColor redColor];
    // self.lbTime.textAlignment = NSTextAlignmentCenter;
    self.lbTime.font  = [UIFont systemFontOfSize:20];
    self.lbTime.shadowColor = [UIColor yellowColor];
    _lbTime.shadowOffset = CGSizeMake(2, 2);
    _lbTime.contentMode = UIViewContentModeCenter;
    _lbTime.numberOfLines = 5;
    [self.view bringSubviewToFront:self.lbTime];
    _lbTime.layer.cornerRadius = 20;
    _lbTime.layer.masksToBounds = true;
     [self.view endEditing:YES];
    
    int count = 10;
    
    NSMutableArray<NSString*>* myarrary = [[NSMutableArray<NSString*> alloc] initWithCapacity:count];
    
    /*
    for (int i = 0; i < count; i ++) {
        NSString * str = [NSString stringWithFormat:@"string %d", i];
        myarrary[i] = str;
    }
     */
    
    for (int i = 0; i < count; i ++) {
        NSString *str = [[NSString alloc] initWithFormat:@"string %d", i];
        [myarrary addObject:str];
    }
    
    for (NSString * str in myarrary) {
        NSLog(@"%@",str);
    }
    
    NSArray<NSNumber*> *array = @[@1, @3, @2];
    NSUInteger count2 = [array count];
    for ( int i = 0; i < count2; i++) {
        NSLog(@"%@", [array[i] stringValue]);
    }
    
    NSLog(@"ouput array2 elements again");
    for (NSNumber *number in array) {
        NSLog(@"%@", number);
    }
    
    NSMutableArray<NSNumber *> *mArray = [array mutableCopy];
    [mArray insertObject:@101 atIndex:1];
    NSLog(@"created mutable copy and insert new object");
    for (NSNumber *number in mArray) {
        NSLog(@"%@", number);
    }
    
    bool has101 =  [mArray containsObject:@101];
    if(has101) {
        NSLog(@"101 is contained");
    }
    
    NSArray *arr = [NSArray arrayWithObjects:@12,@"123", nil];
    NSUInteger count3 = [array count];
    for ( int i = 0; i < count3 - 1; i++) {
        if(arr[i]) {
            NSLog(@"%@", arr[i]);
        }
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
