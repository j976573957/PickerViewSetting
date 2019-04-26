//
//  ViewController.m
//  PickerViewSetting
//
//  Created by Mac on 2019/4/24.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "ViewController.h"
#import "PickerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)pickerBtnClicked:(id)sender {
    PickerViewController *vc = [[PickerViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
