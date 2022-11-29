#import "RNDriveKitCore.h"
#import "RNDriveKitCore-Swift.h"

@implementation RNDriveKitCore
{
  bool hasListeners;
}

- (id)init {
    self = [super init];
    if(self){
        [RNCoreEventEmitter.shared registerEventEmitterWithEventEmitter:self];
    }
    return self;
}

+ (BOOL)requiresMainQueueSetup
{
    return NO;
}

- (NSArray<NSString *>*)supportedEvents {
    return RNCoreEventEmitter.allEvents;
}

-(void)startObserving {
    hasListeners = YES;
}

-(void)stopObserving {
    hasListeners = NO;
}

RCT_EXPORT_MODULE()

RCT_REMAP_METHOD(getApiKey, getApiKeyWithResolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
{
    [self getApiKey:resolve reject:reject];
}

RCT_REMAP_METHOD(setApiKey, setApiKeyWithKey:(NSString *)key resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
{
    [self setApiKey:key resolve:resolve reject:reject];
}

RCT_REMAP_METHOD(getUserId, getUserIdWithResolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
{
    [self getUserId:resolve reject:reject];
}

RCT_REMAP_METHOD(setUserId, setUserIdWithUserId:(NSString *)userId resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
{
    [self setUserId:userId resolve:resolve reject:reject];
}

RCT_REMAP_METHOD(updateUserId, updateUserIdWithUserId:(NSString *)userId resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
{
    [self updateUserId:userId resolve:resolve reject:reject];
}

RCT_REMAP_METHOD(deleteAccount, deleteAccountWithInstantDeletion:(nonnull NSNumber *)instantDeletion resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
{
    [self deleteAccount:instantDeletion resolve:resolve reject:reject];
}

RCT_REMAP_METHOD(isTokenValid, isTokenValidWithResolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
{
    [self isTokenValid:resolve reject:reject];
}

RCT_REMAP_METHOD(enableSandboxMode, enableSandboxModeWithEnable:(nonnull NSNumber *)enable resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
{
    [self enableSandboxMode:enable resolve:resolve reject:reject];
}

RCT_REMAP_METHOD(reset, resetCore:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
{
    [self reset:resolve reject:reject];
}

RCT_REMAP_METHOD(enableLogging, enableLoggingWithOptions:(NSDictionary *)options resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    [self enableLoggingWithOptions:options resolve:resolve reject:reject];
}

RCT_REMAP_METHOD(disableLogging, disableLoggingWithOptions:(NSDictionary *)options resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
    [self disableLoggingWithOptions:options resolve:resolve reject:reject];
}

RCT_REMAP_METHOD(getUriLogFile, getUriLogFileWithResolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
{
    [self getUriLogFile:resolve reject:reject];
}

RCT_REMAP_METHOD(getUserInfo, getUserInfoWithSynchronizationType:(NSString *)synchronizationType withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)
{
   [self getUserInfo:synchronizationType resolver:resolve rejecter:reject];
}

RCT_REMAP_METHOD(updateUserInfo, updateUserInfoWithUserInfo:(NSDictionary *)userInfo withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)
{
   [self updateUserInfo:userInfo resolver:resolve rejecter:reject];
}

RCT_REMAP_METHOD(composeDiagnosisMail, composeDiagnosisMailWithOptions:(NSDictionary *)options withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject){
    if ([self composeDiagnosisMail:options]) {
        resolve(nil);
    } else {
        reject(@"MAIL_COMPOSER_ERROR", @"CAN_SEND_MAIL_IS_FALSE", nil);
    };
}


- (void)getApiKey:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    NSString *apiKey = [RNDriveKitCoreWrapper.shared getApiKey];
    resolve(apiKey);
}

- (void)setApiKey:(NSString *)key resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    [RNDriveKitCoreWrapper.shared setApiKeyWithKey:key];
    resolve(nil);
}

- (void)getUserId:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    NSString *userId = [RNDriveKitCoreWrapper.shared getUserId];
    resolve(userId);
}


- (void)setUserId:(NSString *)userId resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    [RNDriveKitCoreWrapper.shared setUserIdWithUserId:userId];
    resolve(nil);
}


- (void)updateUserId:(NSString *)userId resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    [RNDriveKitCoreWrapper.shared updateUserIdWithUserId:userId];
    resolve(nil);
}

- (void)deleteAccount:(BOOL)instantDeletion resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    // TODO: check type
    NSNumber *param = instantDeletion ? @1 : @0;
    [RNDriveKitCoreWrapper.shared deleteAccountWithInstantDeletion:param];
    resolve(nil);
}


- (void)enableSandboxMode:(BOOL)enable resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    // TODO: check type
    NSNumber *param  = enable ? @1 : @0;
    [RNDriveKitCoreWrapper.shared enableSandboxModeWithEnable:param];
    resolve(nil);
}


- (void)isTokenValid:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    // TODO: check type
    NSNumber * isTokenValid = [RNDriveKitCoreWrapper.shared isTokenValid];
    resolve(isTokenValid);
}


- (void)reset:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    [RNDriveKitCoreWrapper.shared reset];
    resolve(nil);
}

- (void)disableLoggingWithOptions:(NSDictionary *)options {
    [RNDriveKitCoreWrapper.shared disableLoggingWithShowInConsole:options[@"showInConsole"]];
}

- (void)disableLogging:(JS::NativeCore::SpecDisableLoggingOptions &)options resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    NSNumber *param = options.showInConsole().value() ? @1 : @0;
    [RNDriveKitCoreWrapper.shared disableLoggingWithShowInConsole:param];
    resolve(nil);
}

- (void)enableLoggingWithOptions:(NSDictionary *)options {
    [RNDriveKitCoreWrapper.shared enableLoggingWithShowInConsole:options[@"showInConsole"]];
}

- (void)enableLogging:(JS::NativeCore::SpecEnableLoggingOptions &)options resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    NSDictionary *params = @{@"logPath": options.logPath(), @"showInConsole": options.showInConsole().value() ? @1 : @0};
    [self enableLoggingWithOptions:params resolve:resolve reject:reject];
}


- (void)getUriLogFile:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject {
    NSURL *logFileUrl = [RNDriveKitCoreWrapper.shared getUriLogFile];
    resolve([NSDictionary dictionaryWithObject:logFileUrl.path
                                        forKey:@"uri"]);
}

- (void)composeDiagnosisMail:(JS::NativeCore::SpecComposeDiagnosisMailOptions &)options {
    <#code#>
}


- (void)getUserInfo:(NSString *)synchronizationType resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject {
    [RNDriveKitCoreWrapper.shared getUserInfoWithSynchronizationType:synchronizationType resolver:resolve rejecter:reject];
}

- (void)updateUserInfo:(NSDictionary *)userInfo resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject {
    [RNDriveKitCoreWrapper.shared updateUserInfoWithUserInfo:userInfo resolver:resolve rejecter:reject];
}


// Don't compile this code when we build for the old architecture.
#ifdef RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeCoreSpecJSI>(params);
}
#endif

@end
