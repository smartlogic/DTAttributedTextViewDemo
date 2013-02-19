//
//  FirstViewController.m
//  attributed-text-view
//
//  Created by Tom von Schwerdtner on 2/18/13.
//  Copyright (c) 2013 Tom von Schwerdtner. All rights reserved.
//

#import "DemoWebViewController.h"

@interface DemoWebViewController ()

@end

@implementation DemoWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"content" ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    // Wrap our HTML content in the default native font face and size
    NSString *wrappedHTMLString = [NSString stringWithFormat:@""
                                   "<html><head>"
                                   "<style type='text/css'>"
                                   "* { font-family: helvetica; font-size: 12px; }"
                                   "</style>"
                                   "</head><body>"
                                   "%@"                             
                                   "</body></html>"
                                   "",
                                   htmlString
                                   ];
    
    [self.webView loadHTMLString:wrappedHTMLString baseURL:nil];
    
    // Assign our delegate so we can handle opening links in Mobile Safari
    self.webView.delegate = self;
    
    // Remove the shadow that is displayed when scrolling past the bounds
    for (UIView *shadowView in self.webView.scrollView.subviews) {
        if ([shadowView isKindOfClass:[UIImageView class]]) {
            [shadowView setHidden:YES];
        }
    }
    
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if(navigationType == UIWebViewNavigationTypeLinkClicked) {
        [[UIApplication sharedApplication] openURL:[request URL]];
        return NO;
    }
    
    return YES;
}

@end
