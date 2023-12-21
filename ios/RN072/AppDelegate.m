#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>
@import ReactNativeHost;

static NSString *const kRNConcurrentRoot = @"concurrentRoot";

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
      self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  
    ReactNativeHost *host = [[ReactNativeHost alloc] initWithConfig:self];
    UIView *rootView = [host viewWithModuleName:@"RN072"
                                initialProperties:[self prepareInitialProps]];

  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];

  return YES;
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

- (NSDictionary *)prepareInitialProps
{
  NSMutableDictionary *initProps = [NSMutableDictionary new];

#ifdef RN_FABRIC_ENABLED
  initProps[kRNConcurrentRoot] = @YES;
#endif

  return initProps;
}


@end
