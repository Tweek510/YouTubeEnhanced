#import "Tweaks/YouTubeHeader/YTPlayerViewController.h"
#import "Tweaks/YouTubeHeader/YTQTMButton.h"

#define LOC(x) [tweakBundle localizedStringForKey:x value:nil table:nil]
#define YT_BUNDLE_ID @"com.google.ios.youtube"
#define YT_NAME @"YouTube"
#define DEMC_UNSUPPORTED_DEVICES @[@"iPhone14,3", @"iPhone14,6", @"iPhone14,8"] // DontEatMycontent
#define DEMC_THRESHOLD 1.99 // DontEatMycontent

// YTSpeed
@interface YTVarispeedSwitchControllerOption : NSObject
- (id)initWithTitle:(id)title rate:(float)rate;
@end

@interface MLHAMQueuePlayer : NSObject
@property id playerEventCenter;
@property id delegate;
- (void)setRate:(float)rate;
- (void)internalSetRate;
@end

@interface MLPlayerStickySettings : NSObject
- (void)setRate:(float)rate;
@end

@interface MLPlayerEventCenter : NSObject
- (void)broadcastRateChange:(float)rate;
@end

@interface HAMPlayerInternal : NSObject
- (void)setRate:(float)rate;
@end

// YouTubePlus
@interface YTChipCloudCell : UIView
@end

@interface YTPlayabilityResolutionUserActionUIController : NSObject // Skips content warning before playing *some videos - @PoomSmart
- (void)confirmAlertDidPressConfirm;
@end 

@interface YTMainAppControlsOverlayView : UIView
@end

@interface YTTransportControlsButtonView : UIView
@end

@interface YTPlaybackButton : UIControl
@end

@interface YTSegmentableInlinePlayerBarView
@property (nonatomic, assign, readwrite) BOOL enableSnapToChapter;
@end

@interface YTRightNavigationButtons : UIView
@property YTQTMButton *notificationButton;
@property YTQTMButton *sponsorBlockButton;
@end

// IAmYouTube
@interface SSOConfiguration : NSObject
@end

// BigYTMiniPlayer
@interface YTMainAppVideoPlayerOverlayView : UIView
- (UIViewController *)_viewControllerForAncestor;
@end

@interface YTWatchMiniBarView : UIView
@end

// YTAutoFullscreen
@interface YTPlayerViewController (YTAFS)
- (void)autoFullscreen;
- (id)activeVideoPlayerOverlay; // DontEatMycontent
- (id)playerView; // DontEatMycontent
@end

// YTNoShorts
@interface ELMCellNode
@end

@interface _ASCollectionViewCell : UICollectionViewCell
- (id)node;
@end

@interface YTAsyncCollectionView : UICollectionView
- (void)removeShortsCellAtIndexPath:(NSIndexPath *)indexPath;
@end

// DontEatMyContent
BOOL DEMC_deviceIsSupported();
void DEMC_activate();
void DEMC_deactivate(); 
void DEMC_centerRenderingView();

@interface YTPlayerView : UIView
- (id)renderingView;
@end

@interface YTMainAppVideoPlayerOverlayViewController : UIViewController
- (BOOL)isFullscreen;
@end

@interface HAMSBDLSampleBufferRenderingView : UIView
@end

@interface MLHAMSBDLSampleBufferRenderingView : HAMSBDLSampleBufferRenderingView
@end

@interface YTMainAppEngagementPanelViewController : UIViewController
- (BOOL)isLandscapeEngagementPanel;
- (BOOL)isPeekingSupported;
@end

@interface YTEngagementPanelContainerViewController : UIViewController
- (BOOL)isLandscapeEngagementPanel;
- (BOOL)isPeekingSupported;
@end

// App Theme
@interface YCHLiveChatView : UIView
@end

@interface YTFullscreenEngagementOverlayView : UIView
@end

@interface YTRelatedVideosView : UIView
@end

@interface ELMView: UIView
@end

@interface ASWAppSwitcherCollectionViewCell: UIView
@end

@interface ASScrollView : UIView
@end

@interface UIKeyboardLayoutStar : UIView
@end

@interface UIKeyboardDockView : UIView
@end

@interface _ASDisplayView : UIView
@end

@interface YTCommentDetailHeaderCell : UIView
@end

@interface SponsorBlockSettingsController : UITableViewController 
@end

@interface SponsorBlockViewController : UIViewController
@end

@interface UICandidateViewController : UIViewController
@end

@interface UIPredictionViewController : UIViewController
@end
