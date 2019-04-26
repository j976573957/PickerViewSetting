//
//  PickerViewController.m
//  PickerViewSetting
//
//  Created by Mac on 2019/4/24.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataList;

@end

@implementation PickerViewController

- (UIModalPresentationStyle)modalPresentationStyle
{
    return UIModalPresentationOverCurrentContext;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    self.cancelBtn.layer.borderWidth = 0.5;
    self.cancelBtn.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.dataList = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        NSTimeInterval curTimeInterval = [[NSDate date] timeIntervalSince1970];
        curTimeInterval += i;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:curTimeInterval];
        NSString *str = [formatter stringFromDate:date];
        [self.dataList addObject:str];
    }
}

- (IBAction)cancelBtnClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)okBtnClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIPickerDatasource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    
    return self.dataList.count;
}

#pragma mark - UIPickerViewDelegate
#pragma mark 填充文字
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component{
    if (0 == component) {
        return self.dataList[row];
    }
    return nil;
}

#pragma mark pickerView被选中
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component{

}

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row forComponent:(NSInteger)component
           reusingView:(UIView *)view{
    
    //普通状态的颜色
    UILabel* norLabel = (UILabel*)view;
    if (!norLabel){
        norLabel = [[UILabel alloc] init];
        norLabel.textColor = [UIColor grayColor];
        norLabel.adjustsFontSizeToFitWidth = YES;
        [norLabel setTextAlignment:NSTextAlignmentCenter];
        [norLabel setBackgroundColor:[UIColor blueColor]];
        [norLabel setFont:[UIFont systemFontOfSize:13]];
        
        //icon
        UIImageView *av = [[UIImageView alloc] initWithFrame:CGRectMake(30, 3, 20, 20)];
        av.image = [UIImage imageNamed:[NSString stringWithFormat:@"img_%d", (int)row%2]];
        [norLabel addSubview:av];
    }
    norLabel.text = [self pickerView:pickerView
                            titleForRow:row
                           forComponent:component];
    
    //当前选中的颜色
    UILabel *selLb = (UILabel*)[pickerView viewForRow:row forComponent:0];
    if (selLb) {
        selLb.textColor = [UIColor brownColor];
        selLb.adjustsFontSizeToFitWidth = YES;
        [selLb setTextAlignment:NSTextAlignmentCenter];
        [selLb setBackgroundColor:[UIColor purpleColor]];
        [selLb setFont:[UIFont systemFontOfSize:16]];
    }
    
    //下一个选中的颜色（为了选中状态不突兀，自己注释看看效果）
    UILabel *selLb1 = (UILabel*)[pickerView viewForRow:row + 1 forComponent:0];
    if (selLb1) {
        selLb1.textColor = [UIColor redColor];
        selLb1.adjustsFontSizeToFitWidth = YES;
        [selLb1 setTextAlignment:NSTextAlignmentCenter];
        [selLb1 setBackgroundColor:[UIColor greenColor]];
        [selLb1 setFont:[UIFont systemFontOfSize:16]];
    }
    
    //设置分割线
    for (UIView *line in pickerView.subviews) {
        if (line.frame.size.height < 1) {//0.6667
            line.backgroundColor = [UIColor blackColor];
            CGRect tempRect = line.frame;
            CGFloat lineW = 120;
            line.frame = CGRectMake((pickerView.frame.size.width - lineW) * 0.5, tempRect.origin.y, lineW, 2);
        }
    }
    
    return norLabel;
}

@end
