//
//  GradientShotViewController.m
//  GradientLine
//
//  Created by zhang ming on 2017/9/19.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "GradientShotViewController.h"
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface GradientShotViewController ()
@property (nonatomic, strong)UIColor *colorA;
@property (nonatomic, strong)UIColor *colorB;
@end

@implementation GradientShotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)self.colorA.CGColor, (__bridge id)self.colorB.CGColor];
    gradientLayer.locations = @[@0, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    gradientLayer.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height);
    [self.view.layer addSublayer:gradientLayer];
    
    UIGraphicsBeginImageContext([UIScreen mainScreen].bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [gradientLayer renderInContext:context];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImage * img_png = [UIImage imageWithData:UIImagePNGRepresentation(img)];
    UIImageWriteToSavedPhotosAlbum(img_png, nil, nil, nil);

    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
    
}


- (void)tap{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (instancetype)initWithColorA:(UIColor *)colorA colorB:(UIColor *)colorB{
    self = [super init];
    self.colorA = colorA;
    self.colorB = colorB;
    return self;
}

@end
