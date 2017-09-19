//
//  ViewController.m
//  GradientLine
//
//  Created by zhang ming on 2017/9/19.
//  Copyright © 2017年 ios. All rights reserved.
//
#import "GradientShotViewController.h"
#import "ViewController.h"
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tfAR;
@property (weak, nonatomic) IBOutlet UITextField *tfAG;
@property (weak, nonatomic) IBOutlet UITextField *tfAB;
@property (weak, nonatomic) IBOutlet UITextField *tfAA;


@property (weak, nonatomic) IBOutlet UITextField *tfBG;
@property (weak, nonatomic) IBOutlet UITextField *tfBR;
@property (weak, nonatomic) IBOutlet UITextField *tfBB;
@property (weak, nonatomic) IBOutlet UITextField *tfBA;

@end

@implementation ViewController
- (IBAction)outPut:(id)sender {
    CGFloat aR = [self.tfAR.text floatValue];
    CGFloat aG = [self.tfAG.text floatValue];
    CGFloat aB = [self.tfAB.text floatValue];
    CGFloat aA = [self.tfAA.text floatValue];
    
    CGFloat bR = [self.tfBR.text floatValue];
    CGFloat bG = [self.tfBG.text floatValue];
    CGFloat bB = [self.tfBA.text floatValue];
    CGFloat bA = [self.tfBA.text floatValue];
    GradientShotViewController* outpt = [[GradientShotViewController alloc]initWithColorA:RGBA(aR, aG, aB, aA) colorB:RGBA(bR, bG, bB, bA)];
    [self presentViewController:outpt animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)]];
}

- (void)tapped{
    for (UIView* view in self.view.subviews) {
        if ([view isKindOfClass:[UITextField class]]&& [view isFirstResponder]) {
            [view resignFirstResponder];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
