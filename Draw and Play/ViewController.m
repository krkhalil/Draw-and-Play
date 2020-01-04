//
//  ViewController.m
//  DrawPad
//
//  Created by Ray Wenderlich on 9/3/12.
//  Copyright (c) 2012 Ray Wenderlich. All rights reserved.
//

#import "ViewController.h"
#import "Twitter/TWTweetComposeViewController.h"
//#import <GoogleMobileAds/GoogleMobileAds.h>

@interface ViewController ()
//@property(nonatomic, strong) GADBannerView *bannerView;
//@property(nonatomic, strong) GADInterstitial *interstitial;
@end

@implementation ViewController
@synthesize mainImage;
@synthesize tempDrawImage;

- (void)viewDidLoad
{
//    _red = 0.0/255.0;
//    _green = 0.0/255.0;
//    _blue = 0.0/255.0;
//    _brush = 10.0;
//    _opacity = 1.0;
    
    [super viewDidLoad];
    _brushsize = [[[NSUserDefaults standardUserDefaults] objectForKey:@"brush"] floatValue];
    _opacity =  [[[NSUserDefaults standardUserDefaults] objectForKey:@"opacity"] floatValue];
    _red =  [[[NSUserDefaults standardUserDefaults] objectForKey:@"red"] floatValue];
    _green =  [[[NSUserDefaults standardUserDefaults] objectForKey:@"green"] floatValue];
    _blue =  [[[NSUserDefaults standardUserDefaults] objectForKey:@"blue"] floatValue];
    if ([_type isEqualToString:@"free"]) {
        _sketchImageView.hidden=true;
    }
//    self.bannerView = [[GADBannerView alloc]
//                       initWithAdSize:kGADAdSizeBanner];
//    self.bannerView.adUnitID = @"";
//    self.bannerView.rootViewController = self;
//     self.bannerView.delegate = self;
//    //[self.bannerView loadRequest:[GADRequest request]];
//
//    self.interstitial = [self createAndLoadInterstitial];
   
    
}
//- (GADInterstitial *)createAndLoadInterstitial {
//    GADInterstitial *interstitial =
//    [[GADInterstitial alloc] initWithAdUnitID:@""];
//    interstitial.delegate = self;
//    [interstitial loadRequest:[GADRequest request]];
//    return interstitial;
//}

//- (void)interstitialDidDismissScreen:(GADInterstitial *)interstitial {
//   // self.interstitial = [self createAndLoadInterstitial];
//}
//-(void)adView:(GADBannerView *)bannerView didFailToReceiveAdWithError:(GADRequestError *)error
//{
//
//}
//- (void)interstitialDidReceiveAd:(GADInterstitial *)ad
//{
//    NSLog(@"interstitialDidReceiveAd");
//    if (_interstitial.isReady) {
//        [self.interstitial presentFromRootViewController:self];
//    }
//}

//- (void)interstitial:(GADInterstitial *)ad
//didFailToReceiveAdWithError:(GADRequestError *)error
//{
//    NSLog(@"interstitial:didFailToReceiveAdWithError: %@", [error localizedDescription]);
//}
//- (void)adViewDidReceiveAd:(GADBannerView *)adView
//{
//    // Add adView to view and add constraints as above.
//    [self addBannerViewToView:self.bannerView];
//}
- (void)addBannerViewToView:(UIView *)bannerView {
    bannerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:bannerView];
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:bannerView
                                                             attribute:NSLayoutAttributeTop
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.topLayoutGuide
                                                             attribute:NSLayoutAttributeBottom
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

//- (void)viewDidUnload
//{
//    [self setMainImage:nil];
//    [self setTempDrawImage:nil];
//    [super viewDidUnload];
//    // Release any retained subviews of the main view.
//}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)pencilPressed:(id)sender {
    
    UIButton * PressedButton = (UIButton*)sender;
    
    switch(PressedButton.tag)
    {
        case 0:
            _red = 0.0/255.0;
            _green = 0.0/255.0;
            _blue = 0.0/255.0;
            break;
        case 1:
            _red = 105.0/255.0;
            _green = 105.0/255.0;
            _blue = 105.0/255.0;
            break;
        case 2:
            _red = 255.0/255.0;
            _green = 0.0/255.0;
            _blue = 0.0/255.0;
            break;
        case 3:
            _red = 0.0/255.0;
            _green = 0.0/255.0;
            _blue = 255.0/255.0;
            break;
        case 4:
            _red = 102.0/255.0;
            _green = 204.0/255.0;
            _blue = 0.0/255.0;
            break;
        case 5:
            _red = 102.0/255.0;
            _green = 255.0/255.0;
            _blue = 0.0/255.0;
            break;
        case 6:
            _red = 51.0/255.0;
            _green = 204.0/255.0;
            _blue = 255.0/255.0;
            break;
        case 7:
            _red = 160.0/255.0;
            _green = 82.0/255.0;
            _blue = 45.0/255.0;
            break;
        case 8:
            _red = 255.0/255.0;
            _green = 102.0/255.0;
            _blue = 0.0/255.0;
            break;
        case 9:
            _red = 255.0/255.0;
            _green = 255.0/255.0;
            _blue = 0.0/255.0;
            break;
    }
}

- (IBAction)eraserPressed:(id)sender {
    
    _red = 255.0/255.0;
    _green = 255.0/255.0;
    _blue = 255.0/255.0;
    _opacity = 1.0;
}

- (IBAction)reset:(id)sender {
    
    self.mainImage.image = nil;
    
}

- (IBAction)settings:(id)sender {
    SettingsViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
   
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@""
                                                             delegate:self
                                                    cancelButtonTitle:nil
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Tweet it!", @"Cancel", nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        Class tweeterClass = NSClassFromString(@"TWTweetComposeViewController");
        
        if(tweeterClass != nil)
        {   // check for Twitter integration
            
            // check Twitter accessibility and at least one account is setup
            if([TWTweetComposeViewController canSendTweet]) {
                
                UIGraphicsBeginImageContextWithOptions(self.mainImage.bounds.size, NO,0.0);
                [self.mainImage.image drawInRect:CGRectMake(0, 0, self.mainImage.frame.size.width, self.mainImage.frame.size.height)];
                UIImage *SaveImage = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
                
                TWTweetComposeViewController *tweetViewController = [[TWTweetComposeViewController alloc] init];
                // set initial text
                [tweetViewController setInitialText:@"Check out this drawing I made from a tutorial on raywenderlich.com:"];
                
                // add image
                [tweetViewController addImage:SaveImage];
                tweetViewController.completionHandler = ^(TWTweetComposeViewControllerResult result) {
                    if(result == TWTweetComposeViewControllerResultDone) {
                        // the user finished composing a tweet
                    } else if(result == TWTweetComposeViewControllerResultCancelled) {
                        // the user cancelled composing a tweet
                    }
                    [self dismissViewControllerAnimated:YES completion:nil];
                };
                
                [self presentViewController:tweetViewController animated:YES completion:nil];
            } else {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"You can't send a tweet right now, make sure you have at least one Twitter account setup and your device is using iOS5" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            }
        }
        else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"You must upgrade to iOS5.0 in order to send tweets from this application" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
        
    } else if(buttonIndex == 1)
    {
        
        
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    // Was there an error?
    if (error != NULL)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Image could not be saved.Please try again"  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Close", nil];
        [alert show];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Image was successfully saved in photoalbum"  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Close", nil];
        [alert show];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    _lastPoint = [touch locationInView:self.view];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), _lastPoint.x, _lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), _brushsize );
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), _red, _green, _blue, 1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.tempDrawImage setAlpha:_opacity];
    UIGraphicsEndImageContext();
    
    _lastPoint = currentPoint;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(!mouseSwiped) {
        UIGraphicsBeginImageContext(self.view.frame.size);
        [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), _brushsize);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), _red, _green, _blue, _opacity);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), _lastPoint.x, _lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), _lastPoint.x, _lastPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    UIGraphicsBeginImageContext(self.mainImage.frame.size);
    [self.mainImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
    [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) blendMode:kCGBlendModeNormal alpha:_opacity];
    self.mainImage.image = UIGraphicsGetImageFromCurrentImageContext();
    self.tempDrawImage.image = nil;
    UIGraphicsEndImageContext();
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    SettingsViewController * settingsVC = (SettingsViewController *)segue.destinationViewController;
    settingsVC.delegate = self;
    settingsVC.brush = _brushsize;
    settingsVC.opacity = _opacity;
    settingsVC.red = _red;
    settingsVC.green = _green;
    settingsVC.blue = _blue;
    
}

#pragma mark - SettingsViewControllerDelegate methods

- (void)closeSettings:(id)sender
{
    
    _brushsize = ((SettingsViewController*)sender).brush;
    _opacity = ((SettingsViewController*)sender).opacity;
    _red = ((SettingsViewController*)sender).red;
    _green = ((SettingsViewController*)sender).green;
    _blue = ((SettingsViewController*)sender).blue;
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)closeButtonTouched:(id)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
}
-(void)viewWillAppear:(BOOL)animated
{
    _brushsize = [[[NSUserDefaults standardUserDefaults] objectForKey:@"brush"] floatValue];
    _opacity =  [[[NSUserDefaults standardUserDefaults] objectForKey:@"opacity"] floatValue];
    _red =  [[[NSUserDefaults standardUserDefaults] objectForKey:@"red"] floatValue];
    _green =  [[[NSUserDefaults standardUserDefaults] objectForKey:@"green"] floatValue];
    _blue =  [[[NSUserDefaults standardUserDefaults] objectForKey:@"blue"] floatValue];
}
@end
