//
//  DemoTextViewController.m
//  attributed-text-view
//
//  Created by Tom von Schwerdtner on 2/19/13.
//  Copyright (c) 2013 Tom von Schwerdtner. All rights reserved.
//

#import "DemoTextViewController.h"

#import "DTHTMLAttributedStringBuilder.h"
#import "DTCoreTextConstants.h"

@implementation DemoTextViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"content" ofType:@"html"];
    NSData *htmlData = [NSData dataWithContentsOfFile:filePath];
    
    // Set our builder to use the default native font face and size. We also set the
    // DTUseiOS6Attributes boolean, which is required when using an attributed string
    // from this builder in a native iOS view.
    NSDictionary *builderOptions = @{
                                     DTDefaultFontFamily: @"Helvetica",
                                     DTUseiOS6Attributes: @YES
                                     };
    
    DTHTMLAttributedStringBuilder *stringBuilder = [[DTHTMLAttributedStringBuilder alloc] initWithHTML:htmlData
                                                                                               options:builderOptions
                                                                                    documentAttributes:nil];
    
    self.textView.attributedText = [stringBuilder generatedAttributedString];
    
    // Assign our delegate, this is required to handle link events
    self.textView.delegate = self;
    
    // Fort the sake of the demo, adjust content inset to match other tabs.
    self.textView.contentInset = UIEdgeInsetsMake(8, 0, 0, 0);
}

@end
