//
//  CustomAnnotitionView.m
//  NewGps2012
//
//  Created by TR on 13-2-21.
//  Copyright (c) 2013年 thinkrace. All rights reserved.
//

#import "CustomAnnotitionView.h"
#define ICON_WIDTH  20
#define ICON_HEIGHT 20

@implementation CustomAnnotitionView

- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.frame = CGRectMake(0.0f, 0.0f, 140.0f, 276.0f);
        
        UIImage *popImage = [[UIImage imageNamed:@"map_popup_2.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 20, 10) resizingMode:UIImageResizingModeStretch];
        self.imageView = [[UIImageView alloc] initWithImage:popImage];
        self.imageView.hidden = YES;
        self.imageView.userInteractionEnabled = YES;
        self.imageView.frame = CGRectMake(0, 0, 140, 125);
        
        self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 2, 130.0f, 110.0f)];
        _messageLabel.backgroundColor = [UIColor clearColor];
        self.messageLabel.textColor = [UIColor blackColor];
        self.messageLabel.textAlignment = NSTextAlignmentLeft;
        self.messageLabel.lineBreakMode = NSLineBreakByCharWrapping;
        self.messageLabel.numberOfLines = 0;
        self.messageLabel.font = [UIFont systemFontOfSize:11.0f];
        self.messageLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
        [_imageView addSubview:_messageLabel];
        [self addSubview:_imageView];
        
        self.carIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_carIconStr]];
        self.carIcon.frame = CGRectMake((self.frame.size.width-ICON_WIDTH)/2, (self.frame.size.height-ICON_HEIGHT-4)/2, ICON_WIDTH, ICON_HEIGHT);
        [self addSubview:_carIcon];
        
        //详情按钮
        self.detailButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _detailButton.frame = CGRectMake(110, 5, 25, 25);
        [_detailButton setBackgroundImage:[UIImage imageNamed:@"detail"] forState:UIControlStateNormal];
        [_imageView addSubview:_detailButton];
    }
    
    return self;
}

- (void)setMessage:(NSString *)message
{
    [_messageLabel setText:message];
}

- (void)setCarIconStr:(NSString *)carIconStr
{
    [_carIcon setImage:[UIImage imageNamed:carIconStr]];
}

- (void)setShowTrackInfo:(BOOL)showTrackInfo
{
    _showTrackInfo = showTrackInfo;
    if (showTrackInfo) {
        _imageView.hidden = NO;
    } else {
        _imageView.hidden = YES;
    }
}

@end
