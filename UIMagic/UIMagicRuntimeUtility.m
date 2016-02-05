//
//  UIMagicRuntimeUtility.m
//  UIMagic
//
//  Created by 吳德彥 on 2/4/16.
//  Copyright © 2016 吳德彥. All rights reserved.
//

#import "UIMagicRuntimeUtility.h"

@implementation UIMagicRuntimeUtility

+ (BOOL)isRuntimeView: (UIView *) view
{
    if ([view isMemberOfClass:[UINavigationButton class]]) {
        return YES;
    }
    return NO;
}

+ (UIBarItem *)getOriginalBarItemFromRuntimeView:(UIView *) view;
{
    if ([UIMagicRuntimeUtility isRuntimeView:view]) {
        if ([self isMemberOfClass:[UINavigationButton class]]) {
            UINavigationButton *button = (UINavigationButton *)self;
            return button.originatingButtonItem;
        }
    }
    return nil;
}

+ (UIView *)cloneGeneralViewFromRuntimeView:(UIView *)view
{
    if ([UIMagicRuntimeUtility isRuntimeView:view]) {
        if ([view isMemberOfClass:[UINavigationButton class]]) {
            UINavigationButton *navigationButton = (UINavigationButton *)view;
            
//            NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject: navigationButton];
            
            UIButton *button = [[UIButton alloc] init];
            
            NSLog(@"%@",navigationButton.title);

            NSLog(@"%@",navigationButton.tintColor);

            NSLog(@"%@",navigationButton.image);
            
            NSLog(@"%@",NSStringFromSelector(navigationButton.originatingButtonItem.action));

            
            navigationButton.hidden = false;
            
            navigationButton.alpha = 1;
            
            button.frame = navigationButton.frame;
            
            if (navigationButton.originatingButtonItem.image == nil) {
                if ( navigationButton.imageView.image) {
                    UIImage *image = navigationButton.imageView.image;
                    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
                    UIGraphicsBeginImageContext(rect.size);
                    CGContextRef context = UIGraphicsGetCurrentContext();
                    CGContextClipToMask(context, rect, image.CGImage);
                    CGContextSetFillColorWithColor(context, navigationButton.imageView.tintColor.CGColor);
                    CGContextFillRect(context, rect);
                    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
                    UIGraphicsEndImageContext();
                    
                    image = [UIImage imageWithCGImage:img.CGImage
                                                scale:1.0 orientation: UIImageOrientationDownMirrored];
                    
                    [button setImage:image forState:UIControlStateNormal];
                }
            }
            else
            {
                [button setImage:navigationButton.imageView.image forState:UIControlStateNormal];
            }
            
            if (navigationButton.originatingButtonItem.customView) {
                [button addSubview:navigationButton.originatingButtonItem.customView];
            }
//            UIImage *image = [[UIImage alloc] initWithCGImage:[navigationButton.imageView.image copy]]
            
//            [button setImage:navigationButton.imageView.image forState:UIControlStateNormal];
            
            [button setImage:navigationButton.imageView.highlightedImage forState:UIControlStateHighlighted];

            [button setTitle:navigationButton.title forState:UIControlStateNormal];
            
            [button setTitleColor:navigationButton.tintColor forState:UIControlStateNormal];
            
            [button setTitleColor:[navigationButton titleColorForState:UIControlStateSelected] forState:UIControlStateSelected];
            
            button.tintColor = navigationButton.tintColor;
            
            button.titleEdgeInsets = navigationButton.titleEdgeInsets;
            
            button.contentEdgeInsets = navigationButton.contentEdgeInsets;
            
            button.imageEdgeInsets = navigationButton.imageEdgeInsets;
            
//            button.a
            
//            for (id target in navigationButton.originatingButtonItem) {
//                NSArray *actions = [navigationButton actionsForTarget:target
//                                            forControlEvent:UIControlEventTouchUpInside];
//                for (NSString *action in actions) {
//                    [button addTarget:target action:NSSelectorFromString(action) forControlEvents:UIControlEventTouchUpInside];
//                }
//            }
            [button addTarget:navigationButton.originatingButtonItem.target action:navigationButton.originatingButtonItem.action forControlEvents:UIControlEventTouchUpInside];
//            [button addTarget:navigationButton.originatingButtonItem.target action:navigationButton.originatingButtonItem.action forControlEvents:forControlEvents:UIControlEventTouchUpInside];
            
            return button;
        }
    }
    return nil;
}


@end
