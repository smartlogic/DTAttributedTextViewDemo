//
//  SecondViewController.h
//  attributed-text-view
//
//  Created by Tom von Schwerdtner on 2/18/13.
//  Copyright (c) 2013 Tom von Schwerdtner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTAttributedTextView.h"

@interface DemoDTViewController : UIViewController <DTAttributedTextContentViewDelegate>

@property (weak, nonatomic) IBOutlet DTAttributedTextView *textView;

@end
