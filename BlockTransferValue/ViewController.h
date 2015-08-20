//
//  ViewController.h
//  BlockTransferValue
//
//  Created by cbz on 8/19/15.
//  Copyright (c) 2015 zgpeace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextViewDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *label;

- (IBAction)doJumpToSecondView:(id)sender;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (weak, nonatomic) IBOutlet UITextView *textViewContent;

- (IBAction)doLoading:(id)sender;
- (IBAction)doHideKewboard:(id)sender;

@end

