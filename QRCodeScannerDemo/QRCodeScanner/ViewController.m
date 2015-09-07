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
@property (weak, nonatomic) IBOutlet UIButton *QRCodeScan;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
    self.QRCodeScan.layer.cornerRadius  = self.QRCodeScan.frame.size.width/2;
    self.QRCodeScan.layer.masksToBounds = YES;
    
    
}

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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
