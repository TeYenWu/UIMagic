//
//  UINavigationButton.h
//  UIMagic
//
//  Created by 吳德彥 on 1/29/16.
//  Copyright © 2016 吳德彥. All rights reserved.
//

#ifndef UINavigationButton_h
#define UINavigationButton_h
@interface UINavigationButton : UIButton {
    UIEdgeInsets __additionalSelectionInsets;
    BOOL __barItemHidden;
    UIColor *_accessibilityBackgroundTintColor;
    Class _appearanceGuideClass;
    id _appearanceStorage;
    int _barStyle;
    CGSize _boundsAdjustment;
    int _buttonItemStyle;
    BOOL _createdByBarButtonItem;
    float _fontScaleAdjustment;
    BOOL _isFontScaleInvalid;
    float _maximumWidth;
    float _minimumWidth;
    UIColor *_navigationBarTintColor;
    UIBarButtonItem *_originatingButtonItem;
    UINavigationItem *_originatingNavigationItem;
    NSSet *_possibleSystemItems;
    NSSet *_possibleTitles;
    unsigned int _size;
    int _style;
    NSDictionary *_stylesForSizingTitles;
    BOOL _wantsBlendModeForAccessibilityBackgrounds;
    unsigned int _wantsLetterpressContent;
}

@property (setter=_setAccessibilityBackgroundTintColor:, nonatomic, retain) UIColor *_accessibilityBackgroundTintColor;
@property (setter=_setAdditionalSelectionInsets:, nonatomic) UIEdgeInsets _additionalSelectionInsets;
@property (setter=_setAppearanceGuideClass:, nonatomic, retain) Class _appearanceGuideClass;
@property (setter=_setBarItemHidden:, nonatomic) BOOL _barItemHidden;
@property (setter=_setButtonItemStyle:, nonatomic) int _buttonItemStyle;
@property (setter=_setCreatedByBarButtonItem:, nonatomic) BOOL _createdByBarButtonItem;
@property (setter=_setFontScaleAdjustment:, nonatomic) float _fontScaleAdjustment;
@property (setter=_setFontScaleInvalid:, nonatomic) BOOL _isFontScaleInvalid;
@property (setter=_setStylesForSizingTitles:, nonatomic, copy) NSDictionary *_stylesForSizingTitles;
@property (setter=_setWantsBlendModeForAccessibilityBackgrounds:, nonatomic) BOOL _wantsBlendModeForAccessibilityBackgrounds;
@property (nonatomic) int barStyle;
@property (nonatomic) int controlSize;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic) float maximumWidth;
@property (nonatomic) float minimumWidth;
@property (nonatomic) UIBarButtonItem *originatingButtonItem;
@property (nonatomic) UINavigationItem *originatingNavigationItem;
@property (nonatomic) int style;
@property (nonatomic, retain) UIColor *tintColor;
@property (nonatomic, retain) NSString *title;

+ (void)_resetRenderingModesForBackgroundImageView:(id)arg1 inBarStyle:(int)arg2 isEnabled:(BOOL)arg3 withAccessibilityBackground:(BOOL)arg4 wantsBlendModeForAccessibilityBackgrounds:(BOOL)arg5 accessibilityBackgroundTintColor:(id)arg6;
+ (id)defaultFont;

- (void)cxx_destruct;
- (void)_UIAppearance_setBackButtonBackgroundImage:(id)arg1 forState:(unsigned int)arg2 barMetrics:(int)arg3;
- (void)_UIAppearance_setBackButtonBackgroundVerticalPositionAdjustment:(float)arg1 forBarMetrics:(int)arg2;
- (void)_UIAppearance_setBackButtonTitlePositionAdjustment:(struct UIOffset { float x1; float x2; })arg1 forBarMetrics:(int)arg2;
- (void)_UIAppearance_setBackgroundImage:(id)arg1 forState:(unsigned int)arg2 barMetrics:(int)arg3;
- (void)_UIAppearance_setBackgroundImage:(id)arg1 forState:(unsigned int)arg2 style:(int)arg3 barMetrics:(int)arg4;
- (void)_UIAppearance_setBackgroundVerticalPositionAdjustment:(float)arg1 forBarMetrics:(int)arg2;
- (void)_UIAppearance_setTintColor:(id)arg1;
- (void)_UIAppearance_setTitlePositionAdjustment:(struct UIOffset { float x1; float x2; })arg1 forBarMetrics:(int)arg2;
- (void)_UIAppearance_setTitleTextAttributes:(id)arg1 forState:(unsigned int)arg2;
- (id)_accessibilityBackgroundTintColor;
- (void)_accessibilityButtonShapesDidChangeNotification:(id)arg1;
- (void)_accessibilityButtonShapesParametersDidChange;
- (int)_activeBarMetrics;
- (id)_activeVisualStyle;
- (UIEdgeInsets)_additionalSelectionInsets;
- (void)_adjustBounds;
- (id)_adjustedDefaultTitleFont;
- (Class)_appearanceGuideClass;
- (id)_appearanceStorage;
- (void)_applyBarButtonAppearanceStorage:(id)arg1 withTaggedSelectors:(id)arg2;
- (id)_backgroundImageForState:(unsigned int)arg1 barMetrics:(int)arg2;
- (float)_backgroundVerticalPositionAdjustmentForBarMetrics:(int)arg1;
- (int)_barButtonItemStyle;
- (BOOL)_barItemHidden;
- (int)_buttonItemStyle;
- (UIEdgeInsets)_buttonTitleEdgeInsets;
- (BOOL)_canHandleStatusBarTouchAtLocation:(struct CGPoint { float x1; float x2; })arg1;
- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight;
- (BOOL)_createdByBarButtonItem;
- (id)_customOrAccessibilityBackgroundImageForState:(unsigned int)arg1 style:(int)arg2 isMini:(BOOL)arg3;
- (id)_defaultTitleColorForState:(unsigned int)arg1;
- (id)_defaultTitleShadowColorForState:(unsigned int)arg1;
- (CGSize)_defaultTitleShadowOffsetForState:(unsigned int)arg1;
- (void)_didChangeFromIdiom:(int)arg1 onScreen:(id)arg2 traverseHierarchy:(BOOL)arg3;
- (void)_didMoveFromWindow:(id)arg1 toWindow:(id)arg2;
- (id)_externalUnfocusedBorderColor;
- (float)_fontScaleAdjustment;
- (BOOL)_hasBaselineAlignedAbsoluteVerticalPosition:(out float*)arg1 withinNavBar:(id)arg2 forSize:(CGSize)arg3;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)arg1;
- (BOOL)_isExternalRoundedRectButton;
- (BOOL)_isFontScaleInvalid;
- (BOOL)_isModernButton;
- (UIEdgeInsets)_pathImageEdgeInsets;
- (UIEdgeInsets)_pathTitleEdgeInsets;
- (void)_prepareToAppearInNavigationItem:(id)arg1 onLeft:(BOOL)arg2;
- (id)_scriptingInfo;
- (CGRect)_selectedIndicatorBounds;
- (void)_sendSetNeedsLayoutToSuperviewOnTitleAnimationCompletionIfNecessary;
- (void)_setAccessibilityBackgroundTintColor:(id)arg1;
- (void)_setAdditionalSelectionInsets:(UIEdgeInsets)arg1;
- (void)_setAppearanceGuideClass:(Class)arg1;
- (void)_setBackButtonBackgroundImage:(id)arg1 forState:(unsigned int)arg2 barMetrics:(int)arg3;
- (void)_setBackButtonBackgroundVerticalPositionAdjustment:(float)arg1 forBarMetrics:(int)arg2;
- (void)_setBackButtonTitlePositionAdjustment:(struct UIOffset { float x1; float x2; })arg1 forBarMetrics:(int)arg2;
- (void)_setBackgroundImage:(id)arg1 forState:(unsigned int)arg2 barMetrics:(int)arg3;
- (void)_setBackgroundImage:(id)arg1 forState:(unsigned int)arg2 style:(int)arg3 barMetrics:(int)arg4;
- (void)_setBackgroundVerticalPositionAdjustment:(float)arg1 forBarMetrics:(int)arg2;
- (void)_setBarItemHidden:(BOOL)arg1;
- (void)_setBoundsAdjustment:(CGSize)arg1;
- (void)_setButtonItemStyle:(int)arg1;
- (void)_setCreatedByBarButtonItem:(BOOL)arg1;
- (void)_setFontScaleAdjustment:(float)arg1;
- (void)_setFontScaleInvalid:(BOOL)arg1;
- (void)_setFrame:(struct CGRect { struct CGPoint { float x_1_1_1; float x_1_1_2; } x1; struct CGSize { float x_2_1_1; float x_2_1_2; } x2; })arg1 deferLayout:(BOOL)arg2;
- (void)_setGroupName:(id)arg1 forNavigationBar:(id)arg2;
- (void)_setStylesForSizingTitles:(id)arg1;
- (void)_setTintColor:(id)arg1;
- (void)_setTitleFrozen:(BOOL)arg1;
- (void)_setTitlePositionAdjustment:(struct UIOffset { float x1; float x2; })arg1 forBarMetrics:(int)arg2;
- (void)_setTitleTextAttributes:(id)arg1 forState:(unsigned int)arg2;
- (void)_setWantsBlendModeForAccessibilityBackgrounds:(BOOL)arg1;
- (void)_setWantsLetterpressContent;
- (BOOL)_showsAccessibilityBackgroundWhenEnabled;
- (id)_stylesForSizingTitles;
- (id)_tintColor;
- (UIOffset)_titlePositionAdjustmentForBarMetrics:(int)arg1;
- (id)_titleTextAttributesForState:(unsigned int)arg1;
- (void)_updateContentInsets;
- (void)_updateShadowOffsetWithAttributes:(id)arg1 forState:(unsigned int)arg2;
- (void)_updateStyle;
- (void)_updateTitleColorsForState:(unsigned int)arg1;
- (void)_updateTitleForLetterpress;
- (id)_visualStyleForMetrics:(int)arg1;
- (BOOL)_wantsAccessibilityButtonShapes;
- (BOOL)_wantsBlendModeForAccessibilityBackgrounds;
- (int)barStyle;
- (BOOL)canBecomeFocused;
- (BOOL)contentsEqualTo:(id)arg1 withStyle:(int)arg2;
- (int)controlSize;
- (void)dealloc;
- (id)image;
- (id)initWithImage:(id)arg1;
- (id)initWithImage:(id)arg1 style:(int)arg2;
- (id)initWithImage:(id)arg1 width:(float)arg2 style:(int)arg3;
- (id)initWithImage:(id)arg1 width:(float)arg2 style:(int)arg3 applyBezel:(BOOL)arg4 forBarStyle:(int)arg5 buttonItemStyle:(int)arg6;
- (id)initWithTitle:(id)arg1;
- (id)initWithTitle:(id)arg1 possibleTitles:(id)arg2 style:(int)arg3;
- (id)initWithTitle:(id)arg1 style:(int)arg2;
- (id)initWithValue:(id)arg1 width:(float)arg2 style:(int)arg3 barStyle:(int)arg4 possibleTitles:(id)arg5 possibleSystemItems:(id)arg6 tintColor:(id)arg7 applyBezel:(BOOL)arg8 forButtonItemStyle:(int)arg9;
- (id)initWithValue:(id)arg1 width:(float)arg2 style:(int)arg3 barStyle:(int)arg4 possibleTitles:(id)arg5 tintColor:(id)arg6;
- (void)layoutSubviews;
- (float)maximumWidth;
- (float)minimumWidth;
- (id)originatingButtonItem;
- (id)originatingNavigationItem;
- (void)setBarStyle:(int)arg1;
- (void)setControlSize:(int)arg1;
- (void)setEnabled:(BOOL)arg1;
- (void)setHighlighted:(BOOL)arg1;
- (void)setImage:(id)arg1;
- (void)setMaximumWidth:(float)arg1;
- (void)setMinimumWidth:(float)arg1;
- (void)setNavigationBarTintColor:(id)arg1;
- (void)setOriginatingButtonItem:(id)arg1;
- (void)setOriginatingNavigationItem:(id)arg1;
- (void)setStyle:(int)arg1;
- (void)setTitle:(id)arg1;
- (CGSize)sizeThatFits:(CGSize)arg1;
- (int)style;
- (id)title;

@end

#endif /* UINavigationButton_h */
