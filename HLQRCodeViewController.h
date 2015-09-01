//
//  HLQRCodeViewController.h
//  QRCodeScanner
//
//  Created by Mac on 15/9/1.
//  Copyright (c) 2015年 wjhg. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HLQRCodeViewController;

typedef void(^QRCodeReadCancel) (HLQRCodeViewController *);
typedef void(^QRCodeReadSuccess)(HLQRCodeViewController *,NSString *);
typedef void(^QRCodeReadFailure)(HLQRCodeViewController *);

@interface HLQRCodeViewController : UIViewController

@property (nonatomic,copy)QRCodeReadCancel  qrReadCancel;
@property (nonatomic,copy)QRCodeReadSuccess qrReadSuccess;
@property (nonatomic,copy)QRCodeReadFailure qrReadFailure;

/**
 *  自定义二维码框下方的提示文字
 */
@property (nonatomic,strong)NSString *tipText;
/**
 *  自定义整个二维码视图的颜色
 */
@property (nonatomic,strong)UIColor  *color;

@end
