//
//  firstScreenViewController.m
//  Draw and Play
//
//  Created by Pasha on 17/10/2018.
//  Copyright © 2018 Pasha. All rights reserved.
//

#import "firstScreenViewController.h"

#import "ViewController.h"
//#import "SketchTypesViewController.h"
#import "SettingsViewController.h"
@interface firstScreenViewController () <SettingsViewControllerDelegate>
@property  CGPoint lastPoint;
@property  CGFloat red;
@property   CGFloat green;
@property  CGFloat blue;
@property  CGFloat brush;
@property  CGFloat opacity;

@end

@implementation firstScreenViewController

- (void)closeSettings:(id)sender
{
    
    _brush = ((SettingsViewController*)sender).brush;
    _opacity = ((SettingsViewController*)sender).opacity;
    _red = ((SettingsViewController*)sender).red;
    _green = ((SettingsViewController*)sender).green;
    _blue = ((SettingsViewController*)sender).blue;
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.bannerView = [[GADBannerView alloc]
//                       initWithAdSize:kGADAdSizeBanner];
//    self.bannerView.adUnitID = @"";
//    self.bannerView.rootViewController = self;
//    self.bannerView.delegate = self;
//    [self.bannerView loadRequest:[GADRequest request]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)adView:(GADBannerView *)bannerView didFailToReceiveAdWithError:(GADRequestError *)error
//{
//
//}
//- (void)adViewDidReceiveAd:(GADBannerView *)adView
//{
//    // Add adView to view and add constraints as above.
//   // [self addBannerViewToView:self.bannerView];
//}
- (void)addBannerViewToView:(UIView *)bannerView
{
    bannerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:bannerView];
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:bannerView
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.bottomLayoutGuide
                                                             attribute:NSLayoutAttributeTop
                                                            multiplier:1
                                                              constant:0],
                                [NSLayoutConstraint constraintWithItem:bannerView
                                                             attribute:NSLayoutAttributeCenterX
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeCenterX
                                                            multiplier:1
                                                              constant:0]
                                ]];
}
- (IBAction)drawFreeButtonTouched:(id)sender
{
    ViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"DrawingVC"];
    vc.type=@"free";
//    vc.brushsize = ((SettingsViewController*)sender).brush;
//    vc.opacity = ((SettingsViewController*)sender).opacity;
//    vc.red = ((SettingsViewController*)sender).red;
//    vc.green = ((SettingsViewController*)sender).green;
//    vc.blue = ((SettingsViewController*)sender).blue;
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)settingsButtonTouched:(id)sender
{
    SettingsViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
//    vc.brush = ((SettingsViewController*)sender).brush;
//    vc.opacity = ((SettingsViewController*)sender).opacity;
//    vc.red = ((SettingsViewController*)sender).red;
//    vc.green = ((SettingsViewController*)sender).green;
//    vc.blue = ((SettingsViewController*)sender).blue;
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)doodlesButtonTouched:(id)sender
{
    
}
- (IBAction)sketchButtonTouched:(id)sender
{
//    SketchTypesViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"SketchTypesViewController"];
//    
//     [self presentViewController:vc animated:YES completion:nil];
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
