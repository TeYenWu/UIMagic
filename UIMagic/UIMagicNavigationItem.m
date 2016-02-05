//
//  UIMagicNavigationItem.m
//  UIMagic
//
//  Created by 吳德彥 on 2/2/16.
//  Copyright © 2016 吳德彥. All rights reserved.
//

#import "UIMagicNavigationItem.h"
@interface UIMagicNavigationItem()

@property(nonatomic)UIMagicPlaceHolder *leftTempPlaceHolder;

@property(nonatomic)UIMagicPlaceHolder *rightTempPlaceHolder;

@property (nonatomic) int tempItemWidth;

@property (nonatomic) int tempItemHeight;

@end


@implementation UIMagicNavigationItem
{

}

@synthesize leftPlaceHolders;

- (NSMutableArray<UIMagicPlaceHolder *> *)leftPlaceHolders
{
    
    if (leftPlaceHolders == nil) {
        
        leftPlaceHolders = [NSMutableArray array];
    }
    
    for (int i = 0; i < self.leftBarButtonItems.count; i++)
    {
        UIMagicPlaceHolder * placeholder = [leftPlaceHolders safeObjectAtIndex:i];
        if (placeholder) {
            placeholder.barItem = self.leftBarButtonItems[i];
        }
        else
        {
            placeholder = (UIMagicPlaceHolder *)[[UIMagicPlaceHolder alloc ]init];
            placeholder.barItem = self.leftBarButtonItems[i];
            placeholder.placeholderManager = self;
            [leftPlaceHolders addObject:placeholder];
        }
    }
    
    if (leftPlaceHolders.count > self.leftBarButtonItems.count) {
        for (int i = 0; i < leftPlaceHolders.count - self.leftBarButtonItems.count; i++) {
            [leftPlaceHolders.lastObject removeFromSuperview];
            [leftPlaceHolders removeLastObject];
        }
    }
    
    return leftPlaceHolders;
}

@synthesize rightPlaceHolders;

- (NSMutableArray<UIMagicPlaceHolder *> *)rightPlaceHolders
{
    if (rightPlaceHolders == nil) {
        
        rightPlaceHolders = [NSMutableArray array];
    }
    
    for (int i = 0; i < self.rightBarButtonItems.count; i++)
    {
        UIMagicPlaceHolder * placeholder = [rightPlaceHolders safeObjectAtIndex:i];
        if (placeholder) {
            placeholder.barItem = self.rightBarButtonItems[i];
        }
        else
        {
            placeholder = (UIMagicPlaceHolder *)[[UIMagicPlaceHolder alloc ]init];
            placeholder.barItem = self.rightBarButtonItems[i];
            placeholder.placeholderManager = self;
            [rightPlaceHolders addObject:placeholder];
        }
    }
    
    if (rightPlaceHolders.count > self.rightBarButtonItems.count) {
        for (int i = 0; i < rightPlaceHolders.count - self.rightBarButtonItems.count; i++) {
            [rightPlaceHolders.lastObject removeFromSuperview];
            [rightPlaceHolders removeLastObject];
        }
    }
    
    return rightPlaceHolders;
}

@synthesize leftTempPlaceHolder;
-(UIMagicPlaceHolder *)leftTempPlaceHolder
{
    if (leftPlaceHolders.count < _maxofLeftItemPlaceHolders ) {
        if (leftTempPlaceHolder == nil) {
            leftTempPlaceHolder = [(UIMagicPlaceHolder *)[UIMagicPlaceHolder alloc] init];
            leftTempPlaceHolder.placeholderManager = self;
        }
        return leftTempPlaceHolder;
    }
    else
    {
        if (leftTempPlaceHolder) {
            [leftTempPlaceHolder removeFromSuperview];
        }
    }
    return nil;
}

@synthesize rightTempPlaceHolder;
-(UIMagicPlaceHolder *)rightTempPlaceHolder
{
    if (rightPlaceHolders.count < _maxofRightItemPlaceHolders ) {
        if (rightTempPlaceHolder == nil) {
            rightTempPlaceHolder = [(UIMagicPlaceHolder *)[UIMagicPlaceHolder alloc] init];
            rightTempPlaceHolder.placeholderManager = self;
        }
        return rightTempPlaceHolder;
    }
    else
    {
        if (rightTempPlaceHolder) {
            [rightTempPlaceHolder removeFromSuperview];
        }
        
    }
    return nil;
}

//-(void)setRightTempPlaceHolder:(UIMagicPlaceHolder *)newTempPlaceHolder
//{
//    if (newTempPlaceHolder == nil) {
//        NSMutableArray *newRightBarButtonItems = [NSMutableArray arrayWithArray:self.rightBarButtonItems];
//        [newRightBarButtonItems removeObject:rightTempPlaceHolder.barItem];
//        self.rightBarButtonItems = newRightBarButtonItems;
//        [rightTempPlaceHolder removeFromSuperview];
//    }
//    rightTempPlaceHolder = newTempPlaceHolder;
//}

-(int)tempItemHeight
{
    if (self.navigationBar) {
        return self.navigationBar.frame.size.height - 15;
    }
    else
    {
        return 20;
    }
}

-(int)tempItemWidth
{
    return 40;
}


-(void) connectBarItemsToRuntimeViews: (NSArray *)subviews inNavigationBar:(UINavigationBar *)navigationBar
{
    self.navigationBar = navigationBar;
    
    for (UIMagicPlaceHolder * placeholder in self.leftPlaceHolders)
    {
        if (placeholder.barItem) {
            UINavigationButton * navigationButton = [self searchUINavigationButtonOfBaritem: placeholder.barItem inViews:subviews];
            if (navigationButton) {
                placeholder.content = navigationButton;
            }
        }
        [self.navigationBar addSubview:placeholder];
    }
    
    for (UIMagicPlaceHolder * placeholder in self.rightPlaceHolders)
    {
        if (placeholder.barItem) {
            UINavigationButton * navigationButton = [self searchUINavigationButtonOfBaritem: placeholder.barItem inViews:subviews];
            if (navigationButton) {
                placeholder.content = navigationButton;
            }
        }
        [self.navigationBar addSubview:placeholder];
    }
    
    if (self.leftTempPlaceHolder) {
        if (self.leftTempPlaceHolder.superview != self.navigationBar) {
             [self.navigationBar addSubview:self.leftTempPlaceHolder];
        }
        
        CGRect preframe = CGRectMake(0, 0.5 , 0, 0);
        if (self.leftPlaceHolders.count > 0) {
            preframe = [self.leftPlaceHolders lastObject].frame;
        }
        
        CGRect frame = CGRectMake(CGRectGetMaxX(preframe), CGRectGetMinY(preframe), self.tempItemWidth, self.tempItemHeight);
        [self.leftTempPlaceHolder setFrame: frame];
        
        
    }
    
    
    if (self.rightTempPlaceHolder) {
        
        if (self.rightTempPlaceHolder.superview != self.navigationBar) {
            [self.navigationBar addSubview:self.rightTempPlaceHolder];
        }
        
        CGRect preframe = CGRectMake(self.navigationBar.frame.size.width, 0.5 , 0, 0);
        if (self.rightPlaceHolders.count > 0) {
            preframe = [self.rightPlaceHolders lastObject].frame;
        }
        
        CGRect frame = CGRectMake(CGRectGetMinX(preframe) - self.tempItemWidth, CGRectGetMinY(preframe), self.tempItemWidth, self.tempItemHeight);
        [self.rightTempPlaceHolder setFrame: frame];
        
    }
    ////    if (leftPlaceHolders.count < self.maxofLeftItemPlaceHolders) {
//    for (UIView *view in subviews)
//    {
//        if ([view isMemberOfClass:[UINavigationButton class]])
//        {
//            UINavigationButton *button = (UINavigationButton *)view;
//            
//            BOOL isEqualPreviousView = NO;
//            
//            for (UIMagicPlaceHolder * placeholder in placeholders){
//                if ([placeholder.barItem isEqual: button.originatingButtonItem])
//                {
//                    placeholder.content = button;
//                    isEqualPreviousView = YES;
//                    break;
//                }
//            }
//            
//            if (isEqualPreviousView)
//                continue;
//            
//            UIMagicPlaceHolder * placeholder = (UIMagicPlaceHolder *)[UIMagicPlaceHolder initWithContent:button];
//            
//            if (placeholder) {
//                placeholder.placeholderManager = self;
//                placeholder.barItem = button.originatingButtonItem;
//                [placeholders addObject:placeholder];
//                [self.navigationBar addSubview:placeholder];
//            }
//        }
//    }
}

-(UIMagicPlaceHolder *)placeholderAtPoint:(CGPoint)point
{
    NSMutableArray * placeholders = [NSMutableArray array];
    
    [placeholders addObjectsFromArray:self.leftPlaceHolders];
    
    [placeholders addObjectsFromArray:self.rightPlaceHolders];
    
    if (self.leftTempPlaceHolder) {
        [placeholders addObject:self.leftTempPlaceHolder];

    }
    if (self.rightTempPlaceHolder) {
        [placeholders addObject:self.rightTempPlaceHolder];
    }
    
    for (UIMagicPlaceHolder * placeholder in placeholders) {
        if ([placeholder pointInside:point]) {
            return placeholder;
        }
    }

    return nil;
}


-(void)moveContent:(UIView *)content fromSourcePlaceHolder:(UIMagicPlaceHolder *)sourcePlaceHolder toProposedPlaceHolder:(UIMagicPlaceHolder *)proposedDestinationPlaceHolder
{
//    if (proposedDestinationPlaceHolder == nil)
//    {
//        if (!CGRectContainsPoint(self.navigationBar.bounds, content.center))
//        {
//            UIMagicTopView* magicTopView = [UIMagicTopView sharedUIMagicTopView];
//            [magicTopView addFBSPlaceHolder];
//        }
//    }
    
    [self moveInPlaceholders:self.leftPlaceHolders withTempPlaceHolder:self.leftTempPlaceHolder fromSourcePlaceHolder:sourcePlaceHolder toProposedPlaceHolder:proposedDestinationPlaceHolder];
    
    [self moveInPlaceholders:self.rightPlaceHolders withTempPlaceHolder:self.rightTempPlaceHolder fromSourcePlaceHolder:sourcePlaceHolder toProposedPlaceHolder:proposedDestinationPlaceHolder];
}

-(void)exchangeContenstInSourcePlaceHolder:(UIMagicPlaceHolder *)sourcePlaceHolder toTargetPlaceHolder:(UIMagicPlaceHolder *)proposedDestinationPlaceHolder
{
    
    
    if (sourcePlaceHolder == self.fbsPlaceHolder) {
        self.fbsPlaceHolder.content.center = [self.fbsPlaceHolder centerOfContentClone];
        self.fbsPlaceHolder.content = self.fbsPlaceHolder.content;
        [self.fbsPlaceHolder retreiveContentCloneWithAnimated:false];
        return;
    }
    
    if (proposedDestinationPlaceHolder == nil)
    {
        UIMagicTopView * magicTopView = [UIMagicTopView sharedUIMagicTopView];
        CGPoint locationInView = [self.navigationBar convertPoint:[sourcePlaceHolder centerOfContentClone] fromView:magicTopView];
        if (!CGRectContainsPoint(self.navigationBar.bounds, locationInView))
        {
            self.fbsPlaceHolder = [magicTopView addFBSPlaceHolderFromSourcePlaceHolder:sourcePlaceHolder inPlaceHolderManager:self];
            
            [sourcePlaceHolder retreiveContentCloneWithAnimated:false];
        }
        else
        {
            [self resetPositionOfAllPlaceHolders];
            return;
        }
    }
    
    
    
    NSMutableArray<UIBarButtonItem *> * leftBarItems = [NSMutableArray array];
    for (UIMagicPlaceHolder* placeholder in self.leftPlaceHolders) {
        UINavigationButton *button;
        if (placeholder.soucePlaceHolder) {
            button = (UINavigationButton *) placeholder.soucePlaceHolder.content;
            [placeholder.soucePlaceHolder retreiveContentCloneWithAnimated:false];
        }
        else
        {
            if (placeholder != sourcePlaceHolder) {
                button = (UINavigationButton *) placeholder.content;
            }
        }
        if (button.originatingButtonItem && [leftBarItems indexOfObject:button.originatingButtonItem] == NSNotFound) {
            [leftBarItems addObject:button.originatingButtonItem];
        }
    }
    
    if (self.leftTempPlaceHolder) {
        UINavigationButton *button;
        if (self.leftTempPlaceHolder.soucePlaceHolder) {
            button = (UINavigationButton *) self.leftTempPlaceHolder.soucePlaceHolder.content;
            [self.leftTempPlaceHolder.soucePlaceHolder retreiveContentCloneWithAnimated:false];
        }
        if (button.originatingButtonItem) {
            [leftBarItems addObject:button.originatingButtonItem];
        }
    }
    
    NSMutableArray<UIBarButtonItem *> * rightBarItems = [NSMutableArray array];
    for (UIMagicPlaceHolder* placeholder in self.rightPlaceHolders) {
        UINavigationButton *button;
        if (placeholder.soucePlaceHolder) {
            button = (UINavigationButton *) placeholder.soucePlaceHolder.content;
            [placeholder.soucePlaceHolder retreiveContentCloneWithAnimated:false];
        }
        else
        {
            if (placeholder != sourcePlaceHolder) {
                 button = (UINavigationButton *) placeholder.content;
            }
        }
        if (button.originatingButtonItem  && [rightBarItems indexOfObject:button.originatingButtonItem] == NSNotFound) {
            [rightBarItems addObject:button.originatingButtonItem];
        }
        
    }
    
    if (self.rightTempPlaceHolder) {
        UINavigationButton *button;
        if (self.rightTempPlaceHolder.soucePlaceHolder) {
            button = (UINavigationButton *) self.rightTempPlaceHolder.soucePlaceHolder.content;
            [self.rightTempPlaceHolder.soucePlaceHolder retreiveContentCloneWithAnimated:false];
        }
        if (button.originatingButtonItem) {
            [rightBarItems addObject:button.originatingButtonItem];
        }
    }
    
    self.rightBarButtonItems = rightBarItems;
    self.leftBarButtonItems = leftBarItems;
    
}

-(void)resetPositionOfAllPlaceHolders
{
    for (UIMagicPlaceHolder* placeholder in self.leftPlaceHolders) {
        [placeholder retreiveContentCloneWithAnimated:false];
    }
    
    if (self.leftTempPlaceHolder) {
        [self.leftTempPlaceHolder retreiveContentCloneWithAnimated:false];
    }
    
    for (UIMagicPlaceHolder* placeholder in self.rightPlaceHolders) {
        [placeholder retreiveContentCloneWithAnimated:false];
    }
    
    if (self.rightTempPlaceHolder) {
        [self.rightTempPlaceHolder retreiveContentCloneWithAnimated:false];
    }
    
}

-(void)moveInPlaceholders: (NSMutableArray *)placeholders withTempPlaceHolder: (UIMagicPlaceHolder *) tempPlaceHolder fromSourcePlaceHolder: (UIMagicPlaceHolder *)sourcePlaceHolder toProposedPlaceHolder: (UIMagicPlaceHolder *)proposedDestinationPlaceHolder
{
    NSMutableArray<UIMagicPlaceHolder *> *moveBackPHArray = [NSMutableArray array];
    NSMutableArray<UIMagicPlaceHolder *> *moveFrontPHArray = [NSMutableArray array];
    
    [moveBackPHArray addObject:sourcePlaceHolder];
    [moveFrontPHArray addObject:sourcePlaceHolder];
    
    BOOL isDestinationFound = false;
    BOOL isSourceFound = false;
    for (int i = 0; i < placeholders.count; i++) {
        if (proposedDestinationPlaceHolder == placeholders[i])
        {
            isDestinationFound = true;
        }
        else if(sourcePlaceHolder == placeholders[i])
        {
            isSourceFound = true;
        }
        
        if (isDestinationFound && isSourceFound) {
            if (placeholders[i] == proposedDestinationPlaceHolder) {
                [moveBackPHArray addObject: placeholders[i]];
                [moveFrontPHArray addObject: placeholders[i]];
            }
            else if (placeholders[i] == sourcePlaceHolder)
            {
                [moveBackPHArray addObject:placeholders[i]];
            }
        }
        else if (isDestinationFound) {
            [moveBackPHArray addObject: placeholders[i]];
        }
        else if (isSourceFound){
            if (placeholders[i] != sourcePlaceHolder) {
                [moveFrontPHArray addObject:placeholders[i]];
            }
        }
        
        else
        {
            if(placeholders[i] != sourcePlaceHolder)
                [placeholders[i] retreiveContentCloneWithAnimated:true];
        }
    }
    if (tempPlaceHolder) {
        if ((isDestinationFound && !isSourceFound) || proposedDestinationPlaceHolder == tempPlaceHolder) {
            [moveBackPHArray addObject:tempPlaceHolder];
        }
    }
    else
    {
        if ((isDestinationFound && !isSourceFound)) {
            [moveBackPHArray removeAllObjects];
        }
    }
    
    if (moveBackPHArray.count > 1) {
        for (int i = 0; i < moveBackPHArray.count; i++) {
            if (i + 1 == moveBackPHArray.count) break;
            UIMagicPlaceHolder *sourcePH = [moveBackPHArray safeObjectAtIndex:i];
            UIMagicPlaceHolder *targetPH = [moveBackPHArray safeObjectAtIndex:i + 1];
            
            [sourcePH moveContentClonetoTargetPlaceHolder:targetPH animated:YES];
        }
    }
    
    if (moveFrontPHArray.count > 1) {
        for (int i = moveFrontPHArray.count - 1; i >= 0 ; i--) {
            if (i - 1 == -1) break;
            UIMagicPlaceHolder *sourcePH = [moveFrontPHArray safeObjectAtIndex:i];
            UIMagicPlaceHolder *targetPH = [moveFrontPHArray safeObjectAtIndex:i-1];
            
            [sourcePH moveContentClonetoTargetPlaceHolder:targetPH animated:YES];
        }
    }
}

- (UINavigationButton *)searchUINavigationButtonOfBaritem: (UIBarItem *)barItem inViews:(NSArray *)views
{
    for (UIView* view in views) {
        if ([view isMemberOfClass:[UINavigationButton class]])
        {
            UINavigationButton * navigationButton = (UINavigationButton *) view;
            if (navigationButton.originatingButtonItem == barItem) {
                return navigationButton;
            }
        }
    }
    return nil;
}

-(void)appendBarItemInLeft: (UIBarButtonItem*) item
{
    NSMutableArray *barItems = [NSMutableArray arrayWithArray:self.leftBarButtonItems];
    [barItems addObject:item];
    
    [self setLeftBarButtonItems:barItems];
}

-(void)appendBarItemInRight: (UIBarButtonItem*) item
{
    NSMutableArray *barItems = [NSMutableArray arrayWithArray:self.rightBarButtonItems];
    [barItems addObject:item];
    
    [self setRightBarButtonItems:barItems];
}
@end

