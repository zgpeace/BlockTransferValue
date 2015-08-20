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

static NSOperationQueue *queue;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.indicator.hidden = YES;
    self.textViewContent.delegate = self;
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //当触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
}

- (void)keyboardHide:(UITapGestureRecognizer *)tap
{
    [self.textViewContent resignFirstResponder];
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

- (void)loadingUseNSOperation {
    self.indicator.hidden = NO;
    [self.indicator startAnimating];
    queue = [[NSOperationQueue alloc] init];
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download) object:nil];
    [queue addOperation:op];
}

- (void)loadingUseGCD {
    // 原代码块一
    self.indicator.hidden = NO;
    [self.indicator startAnimating];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 原代码块二
        NSURL *url = [NSURL URLWithString:@"https://www.github.com/zgpeace"];
        NSError *error;
        NSString *data = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
        if (data != nil) {
            // 原代码块三
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.indicator stopAnimating];
                self.indicator.hidden = YES;
                self.textViewContent.text = data;
            });
        } else {
            NSLog(@"error when download: %@", error);
        }
    });
}

- (void)blockBackground {
   
    
    
    void (^loggerBlock)(void);
    loggerBlock = ^{
        NSLog(@"Hello World");
    };
    
    loggerBlock();
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"Hello World too background execute");
    });
}

- (void)blockExamples:(dispatch_once_t *)onceToken_p {
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"main queue running");
    });
    
    
    dispatch_once(&(*onceToken_p), ^{
        NSLog(@"dispatch once only");
    });
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        NSLog(@"delay two seconds is that right ?");
    });
    
    dispatch_queue_t urls_queue = dispatch_queue_create("zgpeace.github.io", NULL);
    dispatch_async(urls_queue, ^{
        NSLog(@"definition a dispatch_queue_t by myself");
    });
    
    __block int i = 0;
    __block int j = 0;
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(2, 0), ^{
        i = i + 3;
        NSLog(@"dispatch group 1");
        NSLog(@"i: %d", i);
    });
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        j = j + 5;
        NSLog(@"dispatch group 2");
        NSLog(@"j: %d", j);
    });
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"dispatch group notify");
        NSLog(@"i + j = %d", (i + j));
    });
}

- (IBAction)doLoading:(id)sender {
    //    [self loadingUseNSOperation];
        [self loadingUseGCD];
    //    [self blockBackground];
//    static dispatch_once_t onceToken;
//    [self blockExamples:&onceToken];
    
}

- (IBAction)doHideKewboard:(id)sender {
//    [self.view endEditing:YES];
}

- (void)download
{
    NSURL *url = [NSURL URLWithString:@"https://github.com/zgpeace"];
    NSError *error;
    NSString *data = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    if (data != nil) {
        [self performSelectorOnMainThread:@selector(download_completed:) withObject:data waitUntilDone:NO];
    } else {
        NSLog(@"error when download:%@", error);
        
    }
}

- (void)download_completed:(NSString *)data
{
    NSLog(@"call back");
    [self.indicator stopAnimating];
    self.indicator.hidden = YES;
    self.textViewContent.text = data;
    NSLog(@"data: %@", data);
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
//    [self.view endEditing:YES];
    return NO;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
//    [self.view endEditing:YES];
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
//    [self.view endEditing:YES];
}


@end
































