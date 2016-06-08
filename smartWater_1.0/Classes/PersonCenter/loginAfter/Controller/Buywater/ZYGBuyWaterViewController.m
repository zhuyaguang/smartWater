//
//  ZYGBuyWaterViewController.m
//  饮水机系统
//
//  Created by 朱亚光 on 16/5/13.
//  Copyright © 2016年 朱亚光. All rights reserved.
//

#import "ZYGBuyWaterViewController.h"
#import "MBProgressHUD+Extend.h"
#import "ZYGInputPayPassWordViewController.h"
#import "MTBBarcodeScanner.h"

@interface ZYGBuyWaterViewController ()<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *previewView;
@property (weak, nonatomic) IBOutlet UIView *controllerView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;

@property (weak, nonatomic) IBOutlet UITextField *waterNumberField;
@property (strong, nonatomic)  MTBBarcodeScanner *myScanner;
@end

@implementation ZYGBuyWaterViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   // [MBProgressHUD showMessage:@"正在扫描饮水机二维码。。。"];
    self.pickView.delegate =self;
      self.controllerView.alpha = 0;
    
   _myScanner = [[MTBBarcodeScanner alloc]initWithPreviewView:self.previewView];
    
    MTBBarcodeScanner *myScanner1 = [[MTBBarcodeScanner alloc]
                                     initWithMetadataObjectTypes:@[AVMetadataObjectTypeQRCode] previewView:self.previewView];
    
    [MTBBarcodeScanner requestCameraPermissionWithSuccess:^(BOOL success) {
        if(success){
          
            [self.myScanner startScanningWithResultBlock:^(NSArray *codes) {
                AVMetadataMachineReadableCodeObject *code =[codes firstObject];
                
                NSLog(@"found code:%@",code.stringValue);
                NSString *stringValue = [NSString stringWithFormat:@"二维码是：%@",code.stringValue];
              
                [self.myScanner stopScanning];
                
                [MBProgressHUD showError:stringValue];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                     self.controllerView.alpha = 1;
                });
                
            }];
        }else{
            [MBProgressHUD showError:@"扫描失败"];
        }
    }];
    
    
    
 
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressHUD hideHUD];
//        [MBProgressHUD showSuccess:@"扫描完成！"];
//    });
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 3;
}
#pragma mark - 代理


- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 80;
}


- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch (row) {
        case 0:
            return @"水杯";
            break;
        case 1:
            return @"水壶";
            break;
        case 2:
            return @"马克杯";
            break;
    }
   return @"dd";
}



- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (row == 0) {
        self.waterNumberField.text = @"300ml";
    }else if(row == 1){
         self.waterNumberField.text = @"1000ml";
    }else{
        self.waterNumberField.text = @"150ml";
    }
    
}
- (IBAction)buyWaterButtonClick:(id)sender {
    
    ZYGInputPayPassWordViewController *vc =[[ZYGInputPayPassWordViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self.view endEditing:YES];
    return YES;
}

@end
