//
//  SecondViewController.h
//  BlockTransferValue
//
//  Created by cbz on 8/19/15.
//  Copyright (c) 2015 zgpeace. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ReturnTextBlock)(NSString *showText);

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *text;

@property (nonatomic, copy) ReturnTextBlock returnTextBlock;

- (void)returnText:(ReturnTextBlock)block;

@end
