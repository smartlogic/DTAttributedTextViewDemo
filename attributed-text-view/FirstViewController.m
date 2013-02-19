//
//  FirstViewController.m
//  attributed-text-view
//
//  Created by Tom von Schwerdtner on 2/18/13.
//  Copyright (c) 2013 Tom von Schwerdtner. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupTextView];
}

- (void)setupTextView
{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"content" ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];

    NSString *wrappedHTMLString = [NSString stringWithFormat:@""
                           "<html><head>"
                           "<style type='text/css'>"
                           "* { font-family: helvetica; font-size: 14px; }"
                           "</style>"
                           "</head><body>"
                           "%@"                             
                           "</body></html>"
                           "",
                           htmlString
                           ];

    [self.webView loadHTMLString:wrappedHTMLString baseURL:nil];
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
