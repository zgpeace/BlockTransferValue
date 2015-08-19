//
//  SecondViewController.m
//  BlockTransferValue
//
//  Created by cbz on 8/19/15.
//  Copyright (c) 2015 zgpeace. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)returnText:(ReturnTextBlock)block
{
    self.returnTextBlock = block;
}

- (void)viewWillDisappear:(BOOL)animated
{
    if (self.returnTextBlock != nil) {
        self.returnTextBlock(self.text.text);
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
