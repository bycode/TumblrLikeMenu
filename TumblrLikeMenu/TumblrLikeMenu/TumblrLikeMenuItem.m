//
//  TumblrLikeMenuItem.m
//  TumblrLikeMenu
//
//  Created by Tu You on 12/18/13.
//  Copyright (c) 2013 Tu You. All rights reserved.
//

#import "TumblrLikeMenuItem.h"

@interface TumblrLikeMenuItem ()
{
    UILabel *_menuLabel;
}

@property (nonatomic, retain) UIButton *menuButton;

@end

@implementation TumblrLikeMenuItem

@synthesize menuLabel = _menuLabel;

- (id)initWithImage:(UIImage *)image
   highlightedImage:(UIImage *)highlightedImage
               text:(NSString *)text
{
    self = [super init];
    if (self)
    {
        _image = image;
        _highlightedImage = highlightedImage;
        
        self.frame = [self bounds];
        
        self.menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.image.size.width, self.image.size.height)];
        [self.menuButton setImage:self.image forState:UIControlStateNormal];
        [self.menuButton setImage:self.highlightedImage forState:UIControlStateHighlighted];
        [self.menuButton addTarget:self action:@selector(tapAt:) forControlEvents:UIControlEventTouchUpInside];
        _menuLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.image.size.height + 5, self.frame.size.width, 18)];
        self.menuLabel.textColor = [UIColor whiteColor];
        self.menuLabel.font = [UIFont fontWithName:@"MarkerFelt-Wide" size:13];
        self.menuLabel.textAlignment = NSTextAlignmentCenter;
        self.menuLabel.backgroundColor = [UIColor clearColor];
        self.menuLabel.text = text;
        
        [self addSubview:self.menuButton];
        [self addSubview:self.menuLabel];
    }
    return self;
}

- (void)tapAt:(UIButton *)sender
{
    if (self.selectBlock) {
        self.selectBlock(self);
    }
}

- (void)setImage:(UIImage *)image
{
    if (image != _image) {
        _image = nil;
        _image = image;
        [self.menuButton setImage:self.image forState:UIControlStateNormal];
    }
}

- (void)setHighlightedImage:(UIImage *)highlightedImage
{
    if (highlightedImage != _highlightedImage) {
        _highlightedImage = nil;
        _highlightedImage = highlightedImage;
        [self.menuButton setImage:self.highlightedImage forState:UIControlStateHighlighted];
    }
}

- (CGRect)bounds
{
    CGRect rect = CGRectZero;
    rect.size.width = self.image.size.width;
    rect.size.height = self.image.size.height + 18;
    return rect;
}

@end