//
//  ViewController.m
//  QRCodeScanner
//
//  Created by Mac on 15/9/1.
//  Copyright (c) 2015年 wjhg. All rights reserved.
//

#import "ViewController.h"
#import "HLQRCodeViewController.h"
#import "WebViewController.h"

#define kScannerMaxY 110
#define kGeneratorMinY 320
#define SCREEN_BOUNDS self.view.bounds
#define kScreenWidth SCREEN_BOUNDS.size.width
#define kScreenHeight SCREEN_BOUNDS.size.height

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *QRCodeScan;
@property (weak, nonatomic) IBOutlet UIButton *QRCodeGenerate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.QRCodeScan.layer.cornerRadius  = self.QRCodeScan.frame.size.width/2;
    self.QRCodeScan.layer.masksToBounds = YES;
    
    
    self.QRCodeGenerate.layer.cornerRadius  = self.QRCodeGenerate.frame.size.width/2;
    self.QRCodeGenerate.layer.masksToBounds = YES;
    
    
    self.QRCodeScan.frame = CGRectMake(kScreenWidth/2-50, -110, 100, 100);
    NSLog(@"%@",NSStringFromCGRect(self.view.bounds));
    self.QRCodeGenerate.frame = CGRectMake(kScreenWidth/2-50, 640, 100, 100);
    
    CGRect frame1 = self.QRCodeScan.frame;
    frame1.origin.y = kScannerMaxY;
    
    NSLog(@"%@",NSStringFromCGRect(frame1));
    
    [UIView animateWithDuration:3 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:2 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.QRCodeScan.frame = frame1;
    } completion:^(BOOL finished) {
//        CGRect frame2 = self.QRCodeGenerate.frame;
//        frame2.origin.y = kGeneratorMinY;
//        [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:2 options:UIViewAnimationOptionCurveEaseIn animations:^{
//            self.QRCodeGenerate.frame = frame2;
//            
//        } completion:^(BOOL finished) {
//            
//        }];
    }];
}

//读取二维码
- (IBAction)captureQRCode:(id)sender {
    HLQRCodeViewController * qrcodeVC = [[HLQRCodeViewController alloc]init];
    qrcodeVC.qrReadSuccess = ^(HLQRCodeViewController *qrVC,NSString *result){
        [qrVC dismissViewControllerAnimated:YES completion:^{
        }];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:result]];
    };
    qrcodeVC.qrReadFailure = ^(HLQRCodeViewController *qrVC){
        [qrVC dismissViewControllerAnimated:YES completion:nil];
    };
    qrcodeVC.qrReadCancel = ^(HLQRCodeViewController *qrVC){
        [qrVC dismissViewControllerAnimated:YES completion:nil];
    };
    [self presentViewController:qrcodeVC animated:YES completion:nil];
}
//生成二维码
- (IBAction)generateQRCode:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
