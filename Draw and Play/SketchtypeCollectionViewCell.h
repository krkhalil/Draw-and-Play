//
//  SketchtypeCollectionViewCell.h
//  Draw and Play
//
//  Created by Pasha on 12/11/2018.
//  Copyright © 2018 Pasha. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SketchtypeCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *sketchImageView;

@end

NS_ASSUME_NONNULL_END
