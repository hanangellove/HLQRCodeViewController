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
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
    
    
}

- (IBAction)captureQRCode:(id)sender {
    HLQRCodeViewController * qrcodeVC = [[HLQRCodeViewController alloc]init];
    qrcodeVC.qrReadSuccess = ^(HLQRCodeViewController *qrVC,NSString *result){
        [qrVC dismissViewControllerAnimated:YES completion:^{
        }];
        self.resultLabel.text = result;
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:result]];
    };
    qrcodeVC.qrReadFailure = ^(HLQRCodeViewController *qrVC){
        [qrVC dismissViewControllerAnimated:YES completion:nil];
        self.resultLabel.text = @"读取失败";
    };
    qrcodeVC.qrReadCancel = ^(HLQRCodeViewController *qrVC){
        [qrVC dismissViewControllerAnimated:YES completion:nil];
        self.resultLabel.text = @"取消读取~";
    };
    [self presentViewController:qrcodeVC animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
