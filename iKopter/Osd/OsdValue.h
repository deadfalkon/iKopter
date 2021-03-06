///////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2010, Frank Blumenberg
//
// See License.txt for complete licensing and attribution information.
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
///////////////////////////////////////////////////////////////////////////////////////////////////

#import <Foundation/Foundation.h>
#import "IKMkDatatypes.h"
#import "IKNaviData.h"

@class OsdValue;

@protocol OsdValueDelegate

- (void) newValue:(OsdValue*)value;

@optional - (void) noDataAvailable;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////

@class NCLogSession;
@class IKDebugData;

@interface OsdValue : NSObject {
  
  int requestCount;
  NSTimer* requestTimer;
  NSTimer* logTimer;
  NSTimer* followMeTimer;
  
  id<OsdValueDelegate> _delegate;
  IKNaviData* _data;
  NCLogSession* _ncLogSession;
  NSTimeInterval _logInterval;
  BOOL _logActive;

  BOOL _followMe;
  BOOL _followMeCanStart;
}



@property(retain) NCLogSession* ncLogSession;
@property(assign) id<OsdValueDelegate> delegate;
@property(readonly,retain) IKNaviData* data;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property(readonly) BOOL areEnginesOn;
@property(readonly) BOOL isFlying;
@property(readonly) BOOL isCalibrating;
@property(readonly) BOOL isStarting;
@property(readonly) BOOL isEmergencyLanding;
@property(readonly) BOOL isLowBat;
@property(readonly) BOOL isFreeModeEnabled;
@property(readonly) BOOL isPositionHoldEnabled;
@property(readonly) BOOL isComingHomeEnabled;
@property(readonly) BOOL isRangeLimitReached;
@property(readonly) BOOL isTargetReached;
@property(readonly) BOOL isManualControlEnabled;
@property(readonly) BOOL isGpsOk;
@property(readonly) BOOL isCareFreeOn;
@property(readonly) BOOL isAltControlOn;
@property(readonly) NSInteger poiIndex;

@property(readonly) const NSString* currentErrorMessage;

@property(assign) BOOL followMe;
@property(readonly) BOOL canFollowMe;
@property(readonly) NSInteger followMeRequests;
@property(readonly) BOOL followMeActive;
@property(readonly) double followMeHorizontalAccuracy;

- (void) startRequesting;
- (void) stopRequesting;

@end
