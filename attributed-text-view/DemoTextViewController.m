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

@interface DemoTextViewController ()

@end

@implementation DemoTextViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"content" ofType:@"html"];
    NSData *htmlData = [NSData dataWithContentsOfFile:filePath];
    
    // Set our builder to use the default native font face and size
    NSDictionary *builderOptions = @{
                                     DTUseiOS6Attributes: @YES,
                                     DTDefaultFontFamily: @"Helvetica"
                                     };
    
    DTHTMLAttributedStringBuilder *stringBuilder = [[DTHTMLAttributedStringBuilder alloc] initWithHTML:htmlData
                                                                                               options:builderOptions
                                                                                    documentAttributes:nil];

    self.textView.attributedText = [stringBuilder generatedAttributedString];
    
    // Assign our delegate, this is required to handle link events
    self.textView.delegate = self;

    // This can be done in the storyboard, but we're doing everything else in code so we'll do it here.
    self.textView.editable = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
