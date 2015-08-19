//
//  ViewController.m
//  BlockTransferValue
//
//  Created by cbz on 8/19/15.
//  Copyright (c) 2015 zgpeace. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doJumpToSecondView:(id)sender {
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    SecondViewController *secondViewcontroller = segue.destinationViewController;
    
    [secondViewcontroller returnText:^(NSString *showText) {
        self.label.text = showText;
    }];
    
}

@end
























