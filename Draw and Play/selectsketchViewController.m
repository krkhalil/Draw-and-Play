//
//  selectsketchViewController.m
//  Draw and Play
//
//  Created by Pasha on 07/04/2019.
//  Copyright © 2019 Pasha. All rights reserved.
//

#import "selectsketchViewController.h"
#import "SketchtypeCollectionViewCell.h"
#import "ViewController.h"

@interface selectsketchViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation selectsketchViewController
NSArray *sketcharray;
- (IBAction)crossbuttonTouched:(id)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     sketcharray=[[NSArray alloc] initWithObjects:@"shapes.png",@"animals logo.png",@"fruitslogo.jpg",@"carslogo.png",nil];
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    // Do any additional setup after loading the view.
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SketchtypeCollectionViewCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:@"SketchCollectionViewCell" forIndexPath:indexPath];
    //cell.nameLabel.text=[typeNames objectAtIndex:indexPath.row];
    cell.sketchImageView.image=[UIImage imageNamed:[sketcharray objectAtIndex:indexPath.row]];
    cell.bgView.layer.shadowRadius  = 1.5f;
    cell.bgView.layer.shadowColor   = [UIColor colorWithRed:176.f/255.f green:199.f/255.f blue:226.f/255.f alpha:1.f].CGColor;
    cell.bgView.layer.shadowOffset  = CGSizeMake(0.0f, 0.0f);
    cell.bgView.layer.shadowOpacity = 0.9f;
    cell.bgView.layer.masksToBounds = NO;
    
    UIEdgeInsets shadowInsets     = UIEdgeInsetsMake(0, 0, -1.5f, 0);
    UIBezierPath *shadowPath      = [UIBezierPath bezierPathWithRect:UIEdgeInsetsInsetRect(cell.bgView.bounds, shadowInsets)];
    cell.bgView.layer.shadowPath    = shadowPath.CGPath;
    return cell;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return sketcharray.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"DrawingVC"];
    vc.type=@"notfree";
    [self presentViewController:vc animated:YES completion:nil];
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
