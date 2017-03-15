//
//  MyWebViewController.m
//  First-iOS
//
//  Created by jackiege on 15/03/2017.
//  Copyright © 2017 jackiege. All rights reserved.
//

#import "MyWebViewController.h"

@interface MyWebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView1;

@end

@implementation MyWebViewController


- (BOOL)webView:(UIWebView *)webView
        shouldStartLoadWithRequest:(NSURLRequest *)request
        navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"WebView started loading");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"WebView finished loading");

}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"WebView loaded with error %@", error.description);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.webView1.delegate = self;
    [self.webView1 loadRequest:request];
    [self.view bringSubviewToFront:self.webView1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
