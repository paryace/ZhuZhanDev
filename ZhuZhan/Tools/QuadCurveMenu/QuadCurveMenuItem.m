//
//  QuadCurveMenuItem.m
//  AwesomeMenu
//
//  Created by Levey on 11/30/11.
//  Copyright (c) 2011 lunaapp.com. All rights reserved.
//

#import "QuadCurveMenuItem.h"
static inline CGRect ScaleRect(CGRect rect, float n) {return CGRectMake((rect.size.width - rect.size.width * n)/ 2, (rect.size.height - rect.size.height * n) / 2, rect.size.width * n, rect.size.height * n);}
@implementation QuadCurveMenuItem

@synthesize startPoint = _startPoint;
@synthesize endPoint = _endPoint;
@synthesize nearPoint = _nearPoint;
@synthesize farPoint = _farPoint;
@synthesize delegate  = _delegate;

#pragma mark - initialization & cleaning up
- (id)initWithImage:(UIImage *)img 
   highlightedImage:(UIImage *)himg
       ContentImage:(UIImage *)cimg
highlightedContentImage:(UIImage *)hcimg flag:(int)flag;
{
    if (self = [super init]) 
    {
        self.image = img;
        self.highlightedImage = himg;
        self.userInteractionEnabled = YES;
        _contentImageView = [[UIImageView alloc] initWithImage:cimg];
        _contentImageView.highlightedImage = hcimg;
        
        self.bounds = CGRectMake(0, 0, self.image.size.width, self.image.size.height);
        
        float width = _contentImageView.image.size.width;
        float height = _contentImageView.image.size.height;
        _contentImageView.frame = CGRectMake(self.bounds.size.width/2 - width/2, self.bounds.size.height/2 - height/2, width, height);
        
        [self addSubview:_contentImageView];
    }
    return self;
}

- (void)dealloc
{
    [_contentImageView release];
    [super dealloc];
}
#pragma mark - UIView's methods
//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    
//    self.bounds = CGRectMake(0, 0, self.image.size.width, self.image.size.height);
//    
//    float width = _contentImageView.image.size.width;
//    float height = _contentImageView.image.size.height;
//    _contentImageView.frame = CGRectMake(self.bounds.size.width/2 - width/2, self.bounds.size.height/2 - height/2, width, height);
//}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = YES;
    if ([_delegate respondsToSelector:@selector(quadCurveMenuItemTouchesBegan:)])
    {
       [_delegate quadCurveMenuItemTouchesBegan:self];
    }
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // if move out of 2x rect, cancel highlighted.
    CGPoint location = [[touches anyObject] locationInView:self];
    if (!CGRectContainsPoint(ScaleRect(self.bounds, 2.0f), location))
    {
        self.highlighted = NO;
    }
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = NO;
    // if stop in the area of 2x rect, response to the touches event.
    CGPoint location = [[touches anyObject] locationInView:self];
    if (CGRectContainsPoint(ScaleRect(self.bounds, 2.0f), location))
    {
        if ([_delegate respondsToSelector:@selector(quadCurveMenuItemTouchesEnd:)])
        {
            [_delegate quadCurveMenuItemTouchesEnd:self];
        }
    }
    
}

#pragma mark - instant methods
- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [_contentImageView setHighlighted:highlighted];
}


@end
