// Copyright (c) 2019 Lightricks. All rights reserved.
// Created by Maxim Grabarnik.

#import "AudioViewController.h"

#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@implementation AudioViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:@"Dragon Ball-1" withExtension:@"mp3"];
  AVAsset *asset = [AVAsset assetWithURL:fileUrl];
  
  CMTime rangeStart = CMTimeMakeWithSeconds(13, 1);
  CMTime rangeDuration = CMTimeMakeWithSeconds(15, 1);
  CMTimeRange range = CMTimeRangeMake(rangeStart, rangeDuration);
  
  AVMutableComposition *composition = [AVMutableComposition composition];
  [self addTrackToComposition:composition fromAsset:asset timeRange:range atTime:kCMTimeZero];
  [self addTrackToComposition:composition fromAsset:asset timeRange:range atTime:rangeDuration];
  
  AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:composition];
  self.player = [AVPlayer playerWithPlayerItem:playerItem];
}

- (void)addTrackToComposition:(AVMutableComposition *)composition
                    fromAsset:(AVAsset *)asset
                    timeRange:(CMTimeRange)timeRange
                       atTime:(CMTime)time {
  AVMutableCompositionTrack* audioTrack =
      [composition addMutableTrackWithMediaType:AVMediaTypeAudio
                              preferredTrackID:kCMPersistentTrackID_Invalid];
  NSError *error;
  [audioTrack insertTimeRange:timeRange
                      ofTrack:[asset tracksWithMediaType:AVMediaTypeAudio].firstObject
                       atTime:time
                        error:&error];
  
  if (error)
  {
    NSLog(@"%@", [error localizedDescription]);
  }
}

@end

NS_ASSUME_NONNULL_END
