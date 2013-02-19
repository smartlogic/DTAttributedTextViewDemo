//
//  SecondViewController.m
//  attributed-text-view
//
//  Created by Tom von Schwerdtner on 2/18/13.
//  Copyright (c) 2013 Tom von Schwerdtner. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "SecondViewController.h"

#import "DTHTMLAttributedStringBuilder.h"
#import "DTCoreTextConstants.h"
#import "DTLinkButton.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTextView];

    self.textView.contentInset = UIEdgeInsetsMake(8, 8, 8, 8);
}

- (void)setupTextView
{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"content" ofType:@"html"];
    NSData *htmlData = [NSData dataWithContentsOfFile:filePath];

    NSDictionary *builderOptions = @{
                                     DTDefaultFontFamily: @"Helvetica",
                                     DTDefaultFontSize: @"14"
                                   };

    DTHTMLAttributedStringBuilder *stringBuilder = [[DTHTMLAttributedStringBuilder alloc] initWithHTML:htmlData
                                                                                               options:builderOptions
                                                                                    documentAttributes:nil];

    self.textView.attributedString = [stringBuilder generatedAttributedString];

    self.textView.textDelegate = self;
}

- (void)drawInnerShadow
{
//    CAShapeLayer* shadowLayer = [CAShapeLayer layer];
//    [shadowLayer setFrame:[self bounds]];
//
//    // Standard shadow stuff
//    [shadowLayer setShadowColor:[[UIColor colorWithWhite:0 alpha:1] CGColor]];
//    [shadowLayer setShadowOffset:CGSizeMake(0.0f, 0.0f)];
//    [shadowLayer setShadowOpacity:1.0f];
//    [shadowLayer setShadowRadius:5];
//
//    // Causes the inner region in this example to NOT be filled.
//    [shadowLayer setFillRule:kCAFillRuleEvenOdd];
//
//    // Create the larger rectangle path.
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddRect(path, NULL, CGRectInset(bounds, -42, -42));
//
//    // Add the inner path so it's subtracted from the outer path.
//    // someInnerPath could be a simple bounds rect, or maybe
//    // a rounded one for some extra fanciness.
//    CGPathAddPath(path, NULL, someInnerPath);
//    CGPathCloseSubpath(path);
//
//    [shadowLayer setPath:path];
//    CGPathRelease(path);
//    
//    [[self layer] addSublayer:shadowLayer];
//
//

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

- (IBAction)linkButtonClicked:(DTLinkButton *)sender
{
    [[UIApplication sharedApplication] openURL:sender.URL];
}




@end
