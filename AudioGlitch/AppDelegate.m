// Copyright (c) 2019 Lightricks. All rights reserved.
// Created by Maxim Grabarnik.

#import "AppDelegate.h"

#import "AudioViewController.h"

NS_ASSUME_NONNULL_BEGIN

@implementation AppDelegate

- (BOOL)application:(UIApplication * __unused)application
    didFinishLaunchingWithOptions:(NSDictionary * _Nullable __unused)launchOptions {
  self.window = [[UIWindow alloc] init];
  self.window.rootViewController = [[AudioViewController alloc] init];
  [self.window makeKeyAndVisible];
  return YES;
}

@end

NS_ASSUME_NONNULL_END
