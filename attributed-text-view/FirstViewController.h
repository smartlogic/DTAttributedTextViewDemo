//
//  FirstViewController.h
//  attributed-text-view
//
//  Created by Tom von Schwerdtner on 2/18/13.
//  Copyright (c) 2013 Tom von Schwerdtner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
