//
//  SecondViewController.m
//  attributed-text-view
//
//  Created by Tom von Schwerdtner on 2/18/13.
//  Copyright (c) 2013 Tom von Schwerdtner. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "DemoDTViewController.h"

#import "DTHTMLAttributedStringBuilder.h"
#import "DTCoreTextConstants.h"
#import "DTLinkButton.h"

@interface DemoDTViewController ()

@end

@implementation DemoDTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"content" ofType:@"html"];
    NSData *htmlData = [NSData dataWithContentsOfFile:filePath];
    
    // Set our builder to use the default native font face and size
    NSDictionary *builderOptions = @{
                                     DTDefaultFontFamily: @"Helvetica"
                                     };
    
    DTHTMLAttributedStringBuilder *stringBuilder = [[DTHTMLAttributedStringBuilder alloc] initWithHTML:htmlData
                                                                                               options:builderOptions
                                                                                    documentAttributes:nil];
    
    self.textView.attributedString = [stringBuilder generatedAttributedString];
    
    // Assign our delegate, this is required to handle link events
    self.textView.textDelegate = self;
    
    // Without this the text goes right up to the edge
    self.textView.contentInset = UIEdgeInsetsMake(6, 8, 8, 8);
}

#pragma mark - DTAttributedTextContentViewDelegate

- (UIView *)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView
                          viewForLink:(NSURL *)url
                           identifier:(NSString *)identifier
                                frame:(CGRect)frame
{
    DTLinkButton *linkButton = [[DTLinkButton alloc] initWithFrame:frame];
    linkButton.URL = url;
    [linkButton addTarget:self action:@selector(linkButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return linkButton;
}

#pragma mark - Events

- (IBAction)linkButtonClicked:(DTLinkButton *)sender
{
    [[UIApplication sharedApplication] openURL:sender.URL];
}

@end
