//
//  PickerViewController.h
//  PickerViewSetting
//
//  Created by Mac on 2019/4/24.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PickerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *okBtn;

@end

NS_ASSUME_NONNULL_END
