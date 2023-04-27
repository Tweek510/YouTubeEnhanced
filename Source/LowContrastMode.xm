#import "../Header.h"

//
static BOOL IsEnabled(NSString *key) {
    return [[NSUserDefaults standardUserDefaults] boolForKey:key];
}
static BOOL isDarkMode() {
    return ([[NSUserDefaults standardUserDefaults] integerForKey:@"page_style"] == 1);
}
static int colorContrastMode() {
    return [[NSUserDefaults standardUserDefaults] integerForKey:@"lcmColor"];
}
static BOOL defaultContrastMode() {
    return IsEnabled(@"lowContrastMode_enabled") && colorContrastMode() == 0;
}
static BOOL redContrastMode() {
    return IsEnabled(@"lowContrastMode_enabled") && colorContrastMode() == 1;
}
static BOOL blueContrastMode() {
    return IsEnabled(@"lowContrastMode_enabled") && colorContrastMode() == 2;
}
static BOOL greenContrastMode() {
    return IsEnabled(@"lowContrastMode_enabled") && colorContrastMode() == 3;
}
static BOOL yellowContrastMode() {
    return IsEnabled(@"lowContrastMode_enabled") && colorContrastMode() == 4;
}
static BOOL orangeContrastMode() {
    return IsEnabled(@"lowContrastMode_enabled") && colorContrastMode() == 5;
}
static BOOL purpleContrastMode() {
    return IsEnabled(@"lowContrastMode_enabled") && colorContrastMode() == 6;
}
static BOOL violetContrastMode() {
    return IsEnabled(@"lowContrastMode_enabled") && colorContrastMode() == 7;
}
static BOOL pinkContrastMode() {
    return IsEnabled(@"lowContrastMode_enabled") && colorContrastMode() == 8;
}

%group gLowContrastMode // Low Contrast Mode v1.2.3 (Compatible with only v15.02.1-present)
%hook UIColor
+ (UIColor *)whiteColor { // Dark Theme Color
         return [UIColor colorWithRed: 0.56 green: 0.56 blue: 0.56 alpha: 1.00];
}
+ (UIColor *)textColor {
         return [UIColor colorWithRed: 0.56 green: 0.56 blue: 0.56 alpha: 1.00];
}
+ (UIColor *)dynamicLabelColor {
         return [UIColor colorWithRed: 0.56 green: 0.56 blue: 0.56 alpha: 1.00];
}
%end

%hook YTCommonColorPalette // Changes Texts & Icons in YouTube Bottom Bar (Doesn't change Texts & Icons under the video player)
- (UIColor *)textPrimary {
    if (self.pageStyle == 1) {
        return [UIColor whiteColor]; // Dark Theme
    }
        return [UIColor colorWithRed: 0.38 green: 0.38 blue: 0.38 alpha: 1.00]; // Light Theme
}
- (UIColor *)textSecondary {
    if (self.pageStyle == 1) {
        return [UIColor whiteColor]; // Dark Theme
    }
        return [UIColor colorWithRed: 0.38 green: 0.38 blue: 0.38 alpha: 1.00]; // Light Theme
}
%end

%hook YTCollectionView  // Changes Live Chat Texts
 - (void)setTintColor:(UIColor *)color { 
     return isDarkMode() ? %orig([UIColor whiteColor]) : %orig;
}
%end

%hook YTQTMButton // Changes Tweak Icons/Texts/Images
- (UIColor *)whiteColor {
         return [UIColor whiteColor];
}
- (UIColor *)tintColor {
         return [UIColor whiteColor];
}
- (UIColor *)overflowButton {
         return [UIColor whiteColor];
}
%end

%hook ELMAnimatedVectorView // Changes the Like Button Animation Color. 
- (UIColor *)_ASDisplayView {
         return [UIColor whiteColor];
}
- (UIColor *)ELMAnimatedVectorView {
         return [UIColor whiteColor];
}
%end
%end

%group gRedContrastMode // Red Contrast Mode
%hook UIColor
+ (UIColor *)whiteColor {
         return [UIColor colorWithRed: 1.00 green: 0.31 blue: 0.27 alpha: 1.00];
}
+ (UIColor *)textColor {
         return [UIColor colorWithRed: 1.00 green: 0.31 blue: 0.27 alpha: 1.00];
}
+ (UIColor *)dynamicLabelColor {
         return [UIColor colorWithRed: 1.00 green: 0.31 blue: 0.27 alpha: 1.00];
}
%end

%hook YTCommonColorPalette
- (UIColor *)textPrimary {
     if (self.pageStyle == 1) {
         return [UIColor whiteColor]; // Dark Theme
     }
         return [UIColor colorWithRed: 0.84 green: 0.25 blue: 0.23 alpha: 1.00]; // Light Theme
 }
- (UIColor *)textSecondary {
    if (self.pageStyle == 1) {
        return [UIColor whiteColor]; // Dark Theme
     }
        return [UIColor colorWithRed: 0.84 green: 0.25 blue: 0.23 alpha: 1.00]; // Light Theme
 }
%end

%hook YTCollectionView // Changes Live Chat Texts
- (void)setTintColor:(UIColor *)color { 
    return isDarkMode() ? %orig([UIColor whiteColor]) : %orig;
}
%end

%hook YTQTMButton // Changes Tweak Icons/Texts/Images
- (UIColor *)whiteColor {
         return [UIColor whiteColor];
}
- (UIColor *)tintColor {
         return [UIColor whiteColor];
}
- (UIColor *)overflowButton {
         return [UIColor whiteColor];
}
%end

%hook ELMAnimatedVectorView // Changes the Like Button Animation Color. 
- (UIColor *)_ASDisplayView {
         return [UIColor whiteColor];
}
%end

%hook _ASDisplayView
- (void)didMoveToWindow {
    %orig;
    if ([self.accessibilityIdentifier isEqualToString:@"id.elements.components.comment_composer"]) { self.tintColor = [UIColor whiteColor]; }
    if ([self.accessibilityIdentifier isEqualToString:@"id.elements.components.video_list_entry"]) { self.tintColor = [UIColor whiteColor]; }
	if ([self.accessibilityIdentifier isEqualToString:@"eml.live_chat_text_message"]) { self.tintColor = [UIColor whiteColor]; }
}
%end
%end

%group gBlueContrastMode // Blue Contrast Mode
%hook UIColor
+ (UIColor *)whiteColor {
         return [UIColor colorWithRed: 0.04 green: 0.47 blue: 0.72 alpha: 1.00];
}
+ (UIColor *)textColor {
         return [UIColor colorWithRed: 0.04 green: 0.47 blue: 0.72 alpha: 1.00];
}
+ (UIColor *)dynamicLabelColor {
         return [UIColor colorWithRed: 0.04 green: 0.47 blue: 0.72 alpha: 1.00];
}
%end

%hook YTCommonColorPalette
- (UIColor *)textPrimary {
     if (self.pageStyle == 1) {
         return [UIColor whiteColor]; // Dark Theme
     }
         return [UIColor colorWithRed: 0.04 green: 0.41 blue: 0.62 alpha: 1.00]; // Light Theme
 }
- (UIColor *)textSecondary {
    if (self.pageStyle == 1) {
        return [UIColor whiteColor]; // Dark Theme
     }
        return [UIColor colorWithRed: 0.04 green: 0.41 blue: 0.62 alpha: 1.00]; // Light Theme
 }
%end

%hook YTCollectionView  // Changes Live Chat Texts
- (void)setTintColor:(UIColor *)color { 
    return isDarkMode() ? %orig([UIColor whiteColor]) : %orig;
}
%end

%hook YTQTMButton // Changes Tweak Icons/Texts/Images
- (UIColor *)whiteColor {
         return [UIColor whiteColor];
}
- (UIColor *)tintColor {
         return [UIColor whiteColor];
}
- (UIColor *)overflowButton {
         return [UIColor whiteColor];
}
%end

%hook ELMAnimatedVectorView // Changes the Like Button Animation Color. 
- (UIColor *)_ASDisplayView {
         return [UIColor whiteColor];
}
%end

%hook _ASDisplayView
- (void)didMoveToWindow {
    %orig;
    if ([self.accessibilityIdentifier isEqualToString:@"id.elements.components.comment_composer"]) { self.tintColor = [UIColor whiteColor]; }
    if ([self.accessibilityIdentifier isEqualToString:@"id.elements.components.video_list_entry"]) { self.tintColor = [UIColor whiteColor]; }
    if ([self.accessibilityIdentifier isEqualToString:@"eml.live_chat_text_message"]) { self.tintColor = [UIColor whiteColor]; }
}
%end
%end

%group gGreenContrastMode // Green Contrast Mode
%hook UIColor
+ (UIColor *)whiteColor {
         return [UIColor colorWithRed: 0.01 green: 0.66 blue: 0.18 alpha: 1.00];
}
+ (UIColor *)textColor {
         return [UIColor colorWithRed: 0.01 green: 0.66 blue: 0.18 alpha: 1.00];
}
+ (UIColor *)dynamicLabelColor {
         return [UIColor colorWithRed: 0.01 green: 0.66 blue: 0.18 alpha: 1.00];
}
%end

%hook YTCommonColorPalette
- (UIColor *)textPrimary {
     if (self.pageStyle == 1) {
         return [UIColor whiteColor]; // Dark Theme
     }
         return [UIColor colorWithRed: 0.00 green: 0.50 blue: 0.13 alpha: 1.00]; // Light Theme
 }
- (UIColor *)textSecondary {
    if (self.pageStyle == 1) {
        return [UIColor whiteColor]; // Dark Theme
     }
        return [UIColor colorWithRed: 0.00 green: 0.50 blue: 0.13 alpha: 1.00]; // Light Theme
 }
%end

%hook YTCollectionView  // Changes Live Chat Texts
- (void)setTintColor:(UIColor *)color { 
    return isDarkMode() ? %orig([UIColor whiteColor]) : %orig;
}
%end

%hook YTQTMButton // Changes Tweak Icons/Texts/Images
- (UIColor *)whiteColor {
         return [UIColor whiteColor];
}
- (UIColor *)tintColor {
         return [UIColor whiteColor];
}
- (UIColor *)overflowButton {
         return [UIColor whiteColor];
}
%end

%hook ELMAnimatedVectorView // Changes the Like Button Animation Color. 
- (UIColor *)_ASDisplayView {
         return [UIColor whiteColor];
}
%end

%hook _ASDisplayView
- (void)didMoveToWindow {
    %orig;
    if ([self.accessibilityIdentifier isEqualToString:@"id.elements.components.comment_composer"]) { self.tintColor = [UIColor whiteColor]; }
    if ([self.accessibilityIdentifier isEqualToString:@"id.elements.components.video_list_entry"]) { self.tintColor = [UIColor whiteColor]; }
    if ([self.accessibilityIdentifier isEqualToString:@"eml.live_chat_text_message"]) { self.tintColor = [UIColor whiteColor]; }
}
%end
%end

%group gYellowContrastMode // Yellow Contrast Mode
%hook UIColor
+ (UIColor *)whiteColor {
         return [UIColor colorWithRed: 0.89 green: 0.82 blue: 0.20 alpha: 1.00];
}
+ (UIColor *)textColor {
         return [UIColor colorWithRed: 0.89 green: 0.82 blue: 0.20 alpha: 1.00];
}
+ (UIColor *)dynamicLabelColor {
         return [UIColor colorWithRed: 0.89 green: 0.82 blue: 0.20 alpha: 1.00];
}
%end

%hook YTCommonColorPalette
- (UIColor *)textPrimary {
     if (self.pageStyle == 1) {
         return [UIColor whiteColor]; // Dark Theme
     }
         return [UIColor colorWithRed: 0.77 green: 0.71 blue: 0.14 alpha: 1.00]; // Light Theme
 }
- (UIColor *)textSecondary {
    if (self.pageStyle == 1) {
        return [UIColor whiteColor]; // Dark Theme
     }
        return [UIColor colorWithRed: 0.77 green: 0.71 blue: 0.14 alpha: 1.00]; // Light Theme
 }
%end

%hook YTCollectionView  // Changes Live Chat Texts
- (void)setTintColor:(UIColor *)color { 
    return isDarkMode() ? %orig([UIColor whiteColor]) : %orig;
}
%end

%hook YTQTMButton // Changes Tweak Icons/Texts/Images
- (UIColor *)whiteColor {
         return [UIColor whiteColor];
}
- (UIColor *)tintColor {
         return [UIColor whiteColor];
}
- (UIColor *)overflowButton {
         return [UIColor whiteColor];
}
%end

%hook ELMAnimatedVectorView // Changes the Like Button Animation Color. 
- (UIColor *)_ASDisplayView {
         return [UIColor whiteColor];
}
%end

%hook _ASDisplayView
- (void)didMoveToWindow {
    %orig;
    if ([self.accessibilityIdentifier isEqualToString:@"id.elements.components.comment_composer"]) { self.tintColor = [UIColor whiteColor]; }
    if ([self.accessibilityIdentifier isEqualToString:@"id.elements.components.video_list_entry"]) { self.tintColor = [UIColor whiteColor]; }
    if ([self.accessibilityIdentifier isEqualToString:@"eml.live_chat_text_message"]) { self.tintColor = [UIColor whiteColor]; }
}
%end
%end

%group gOrangeContrastMode // Orange Contrast Mode
%hook UIColor
+ (UIColor *)whiteColor {
         return [UIColor colorWithRed: 0.73 green: 0.45 blue: 0.05 alpha: 1.00];
}
+ (UIColor *)textColor {
         return [UIColor colorWithRed: 0.73 green: 0.45 blue: 0.05 alpha: 1.00];
}
+ (UIColor *)dynamicLabelColor {
         return [UIColor colorWithRed: 0.73 green: 0.45 blue: 0.05 alpha: 1.00];
}
%end

%hook YTCommonColorPalette
- (UIColor *)textPrimary {
     if (self.pageStyle == 1) {
         return [UIColor whiteColor]; // Dark Theme
     }
         return [UIColor colorWithRed: 0.80 green: 0.49 blue: 0.05 alpha: 1.00]; // Light Theme
 }
- (UIColor *)textSecondary {
    if (self.pageStyle == 1) {
        return [UIColor whiteColor]; // Dark Theme
     }
        return [UIColor colorWithRed: 0.80 green: 0.49 blue: 0.05 alpha: 1.00]; // Light Theme
 }
%end

%hook YTCollectionView  // Changes Live Chat Texts
- (void)setTintColor:(UIColor *)color { 
    return isDarkMode() ? %orig([UIColor whiteColor]) : %orig;
}
%end

%hook YTQTMButton // Changes Tweak Icons/Texts/Images
- (UIColor *)whiteColor {
         return [UIColor whiteColor];
}
- (UIColor *)tintColor {
         return [UIColor whiteColor];
}
- (UIColor *)overflowButton {
         return [UIColor whiteColor];
}
%end

%hook ELMAnimatedVectorView // Changes the Like Button Animation Color. 
- (UIColor *)_ASDisplayView {
         return [UIColor whiteColor];
}
%end

%hook _ASDisplayView
- (void)didMoveToWindow {
    %orig;
    if ([self.accessibilityIdentifier isEqualToString:@"id.elements.components.comment_composer"]) { self.tintColor = [UIColor whiteColor]; }
    if ([self.accessibilityIdentifier isEqualToString:@"id.elements.components.video_list_entry"]) { self.tintColor = [UIColor whiteColor]; }
    if ([self.accessibilityIdentifier isEqualToString:@"eml.live_chat_text_message"]) { self.tintColor = [UIColor whiteColor]; }
}
%end
%end

%group gPurpleContrastMode // Purple Contrast Mode
%hook UIColor
+ (UIColor *)whiteColor {
         return [UIColor colorWithRed: 0.42 green: 0.18 blue: 0.68 alpha: 1.00];
}
+ (UIColor *)textColor {
         return [UIColor colorWithRed: 0.42 green: 0.18 blue: 0.68 alpha: 1.00];
}
+ (UIColor *)dynamicLabelColor {
         return [UIColor colorWithRed: 0.42 green: 0.18 blue: 0.68 alpha: 1.00];
}
%end

%hook YTCommonColorPalette
- (UIColor *)textPrimary {
     if (self.pageStyle == 1) {
         return [UIColor whiteColor]; // Dark Theme
     }
         return [UIColor colorWithRed: 0.42 green: 0.05 blue: 0.68 alpha: 1.00]; // Light Theme
 }
- (UIColor *)textSecondary {
    if (self.pageStyle == 1) {
        return [UIColor whiteColor]; // Dark Theme
     }
        return [UIColor colorWithRed: 0.42 green: 0.05 blue: 0.68 alpha: 1.00]; // Light Theme
 }
%end

%hook YTCollectionView  // Changes Live Chat Texts
- (void)setTintColor:(UIColor *)color { 
    return isDarkMode() ? %orig([UIColor whiteColor]) : %orig;
}
%end

%hook YTQTMButton // Changes Tweak Icons/Texts/Images
- (UIColor *)whiteColor {
         return [UIColor whiteColor];
}
- (UIColor *)tintColor {
         return [UIColor whiteColor];
}
- (UIColor *)overflowButton {
         return [UIColor whiteColor];
}
%end

%hook ELMAnimatedVectorView // Changes the Like Button Animation Color. 
- (UIColor *)_ASDisplayView {
         return [UIColor whiteColor];
}
%end

%hook _ASDisplayView
- (void)didMoveToWindow {
    %orig;
    if ([self.accessibilityIdentifier isEqualToString:@"id.elements.components.comment_composer"]) { self.tintColor = [UIColor whiteColor]; }
    if ([self.accessibilityIdentifier isEqualToString:@"id.elements.components.video_list_entry"]) { self.tintColor = [UIColor whiteColor]; }
    if ([self.accessibilityIdentifier isEqualToString:@"eml.live_chat_text_message"]) { self.tintColor = [UIColor whiteColor]; }
}
%end
%end

%group gVioletContrastMode // Violet Contrast Mode
%hook UIColor
+ (UIColor *)whiteColor {
         return [UIColor colorWithRed: 0.50 green: 0.00 blue: 1.00 alpha: 1.00];
}
+ (UIColor *)textColor {
         return [UIColor colorWithRed: 0.50 green: 0.00 blue: 1.00 alpha: 1.00];
}
+ (UIColor *)dynamicLabelColor {
         return [UIColor colorWithRed: 0.50 green: 0.00 blue: 1.00 alpha: 1.00];
}
%end

%hook YTCommonColorPalette
- (UIColor *)textPrimary {
     if (self.pageStyle == 1) {
         return [UIColor whiteColor]; // Dark Theme
     }
         return [UIColor colorWithRed: 0.29 green: 0.00 blue: 0.51 alpha: 1.00]; // Light Theme
 }
- (UIColor *)textSecondary {
    if (self.pageStyle == 1) {
        return [UIColor whiteColor]; // Dark Theme
     }
        return [UIColor colorWithRed: 0.29 green: 0.00 blue: 0.51 alpha: 1.00]; // Light Theme
 }
%end

%hook YTCollectionView  // Changes Live Chat Texts
- (void)setTintColor:(UIColor *)color { 
    return isDarkMode() ? %orig([UIColor whiteColor]) : %orig;
}
%end

%hook YTQTMButton // Changes Tweak Icons/Texts/Images
- (UIColor *)whiteColor {
         return [UIColor whiteColor];
}
- (UIColor *)tintColor {
         return [UIColor whiteColor];
}
- (UIColor *)overflowButton {
         return [UIColor whiteColor];
}
%end

%hook ELMAnimatedVectorView // Changes the Like Button Animation Color. 
- (UIColor *)_ASDisplayView {
         return [UIColor whiteColor];
}
%end

%hook _ASDisplayView
- (void)didMoveToWindow {
    %orig;
    if ([self.accessibilityIdentifier isEqualToString:@"id.elements.components.comment_composer"]) { self.tintColor = [UIColor whiteColor]; }
    if ([self.accessibilityIdentifier isEqualToString:@"id.elements.components.video_list_entry"]) { self.tintColor = [UIColor whiteColor]; }
    if ([self.accessibilityIdentifier isEqualToString:@"eml.live_chat_text_message"]) { self.tintColor = [UIColor whiteColor]; }
}
%end
%end

%group gPinkContrastMode // Pink Contrast Mode
%hook UIColor
+ (UIColor *)whiteColor {
         return [UIColor colorWithRed: 0.74 green: 0.02 blue: 0.46 alpha: 1.00];
}
+ (UIColor *)textColor {
         return [UIColor colorWithRed: 0.74 green: 0.02 blue: 0.46 alpha: 1.00];
}
+ (UIColor *)dynamicLabelColor {
         return [UIColor colorWithRed: 0.74 green: 0.02 blue: 0.46 alpha: 1.00];
}
%end

%hook YTCommonColorPalette
- (UIColor *)textPrimary {
     if (self.pageStyle == 1) {
         return [UIColor whiteColor]; // Dark Theme
     }
         return [UIColor colorWithRed: 0.81 green: 0.56 blue: 0.71 alpha: 1.00]; // Light Theme
 }
- (UIColor *)textSecondary {
    if (self.pageStyle == 1) {
        return [UIColor whiteColor]; // Dark Theme
     }
        return [UIColor colorWithRed: 0.81 green: 0.56 blue: 0.71 alpha: 1.00]; // Light Theme
 }
%end

%hook YTCollectionView  // Changes Live Chat Texts
- (void)setTintColor:(UIColor *)color { 
    return isDarkMode() ? %orig([UIColor whiteColor]) : %orig;
}
%end

%hook YTQTMButton // Changes Tweak Icons/Texts/Images
- (UIColor *)whiteColor {
         return [UIColor whiteColor];
}
- (UIColor *)tintColor {
         return [UIColor whiteColor];
}
- (UIColor *)overflowButton {
         return [UIColor whiteColor];
}
%end

%hook ELMAnimatedVectorView // Changes the Like Button Animation Color. 
- (UIColor *)_ASDisplayView {
         return [UIColor whiteColor];
}
%end

%hook _ASDisplayView
- (void)didMoveToWindow {
    %orig;
    if ([self.accessibilityIdentifier isEqualToString:@"id.elements.components.comment_composer"]) { self.tintColor = [UIColor whiteColor]; }
    if ([self.accessibilityIdentifier isEqualToString:@"id.elements.components.video_list_entry"]) { self.tintColor = [UIColor whiteColor]; }
    if ([self.accessibilityIdentifier isEqualToString:@"eml.live_chat_text_message"]) { self.tintColor = [UIColor whiteColor]; }
}
%end
%end

# pragma mark - ctor
%ctor {
    %init;
    if (defaultContrastMode()) {
        %init(gLowContrastMode);
    }
    if (redContrastMode()) {
        %init(gRedContrastMode);
    }
    if (blueContrastMode()) {
        %init(gBlueContrastMode);
    }
    if (greenContrastMode()) {
        %init(gGreenContrastMode);
    }
    if (yellowContrastMode()) {
        %init(gYellowContrastMode);
    }
    if (orangeContrastMode()) {
        %init(gOrangeContrastMode);
    }
    if (purpleContrastMode()) {
        %init(gPurpleContrastMode);
    }
    if (violetContrastMode()) {
        %init(gVioletContrastMode);
    }
    if (pinkContrastMode()) {
        %init(gPinkContrastMode);
    }
}
