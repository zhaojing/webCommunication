//
//  ViewController.m
//  Betta
//
//  Created by testbetta on 6/2/16.
//  Copyright © 2016 testbetta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path =[[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:path];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    self.webView.delegate = self;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"加载完成webView");
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *requestString = [[request URL] absoluteString];
    NSArray *components = [requestString componentsSeparatedByString:@":"];
    if ([components count] > 1 &&
        [(NSString *)[components objectAtIndex:0] isEqualToString:@"betta"]) {
        NSLog(@"点击了webView = %@按钮",[components objectAtIndex:1]);
        return NO;
    }
    return YES;
}

- (IBAction)buttonTap:(id)sender {
    NSLog(@"点击原生button,在webView里的text为丁洋");
    [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('textBetta').value='丁洋'"];
}

@end
