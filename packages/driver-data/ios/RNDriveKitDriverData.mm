#import "RNDriveKitDriverData.h"
#import "RNDriveKitDriverData-Swift.h"

@implementation RNDriveKitDriverData
RCT_EXPORT_MODULE()

RCT_REMAP_METHOD(initialize, initializeWithResolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
{
    [self initialize];
    resolve(nil);
}

-(void)initialize {
    [RNDriveKitDriverDataWrapper.shared initialize];
}

RCT_REMAP_METHOD(reset, resetCore:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
{
    [self reset];
    resolve(nil);
}

- (void)reset {
    [RNDriveKitDriverDataWrapper.shared reset];
}

RCT_REMAP_METHOD(deleteTrip, deleteTripWithId:(NSString *)tripId resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
{
    [self deleteTripWithTripId:tripId resolver:resolve rejecter:reject];
}

-(void)deleteTripWithTripId:(NSString *)tripId resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject {
    [RNDriveKitDriverDataWrapper.shared deleteTripWithTripId:tripId resolver:resolve rejecter:reject];
}

// Don't compile this code when we build for the old architecture.
#ifdef RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeDriverDataSpecJSI>(params);
}
#endif

@end
