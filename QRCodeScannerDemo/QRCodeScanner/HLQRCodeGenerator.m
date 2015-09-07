//
//  HLQRCodeGenerator.m
//  QRCodeScanner
//
//  Created by Han liu on 15/9/7.
//  Copyright © 2015年 wjhg. All rights reserved.
//

#import "HLQRCodeGenerator.h"


//设备宽/高/坐标
#define kDeviceWidth    [UIScreen mainScreen].bounds.size.width
#define KDeviceHeight   [UIScreen mainScreen].bounds.size.height
#define KDeviceFrame    [UIScreen mainScreen].bounds

@interface HLQRCodeGenerator ()

@property (strong,nonatomic)UITextField * textField;
@property (strong,nonatomic)UIButton    * generatorBtn;
@property (strong,nonatomic)UIImageView * QRCodeImgV;
@property (strong,nonatomic)UISlider    * slider;

@end

@implementation HLQRCodeGenerator

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initNav];
}

//创建一个类似导航栏
- (void)initNav{
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 64)];
    if (self.color) {
        bgView.backgroundColor = self.color;
        
    }else{
        bgView.backgroundColor = [UIColor colorWithRed:0.22 green:0.67 blue:0.94 alpha:1];
    }
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(kDeviceWidth/2-50, 24, 100, 30)];
    title.text = @"生成二维码";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor whiteColor];
    [bgView addSubview:title];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(20, 28, 60, 24);
    [back setImage:[UIImage imageNamed:@"bar_back"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(cancelQRCodeGenerating) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:back];
    
    [self.view addSubview:bgView];
    
}

- (void)cancelQRCodeGenerating{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
