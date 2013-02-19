//
//  DemoTextViewController.h
//  attributed-text-view
//
//  Created by Tom von Schwerdtner on 2/19/13.
//  Copyright (c) 2013 Tom von Schwerdtner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoTextViewController : UIViewController <UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *textView;

@end
