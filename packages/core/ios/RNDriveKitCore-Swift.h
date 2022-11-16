@class RNDriveKitCoreWrapper;

@interface RNDriveKitCoreWrapper : NSObject
@property (nonatomic, class, readonly, strong) RNDriveKitCoreWrapper * _Nonnull shared;
- (void)initialize;
- (NSString *)getApiKeyWithKey;
- (void)setApiKeyWithKey:(NSString * _Nonnull)key;
- (NSString *)getUserIdWithKey;
- (void)setUserIdWithUserId:(NSString * _Nonnull)userId;
- (void)updateUserIdWithUserId:(NSString * _Nonnull)userId;
- (void)deleteAccountWithInstantDeletion:(NSNumber * _Nonnull)instantDeletion;
- (NSNumber * _Nonnull)isTokenValid;
- (void)enableSandboxModeWithEnable:(NSNumber * _Nonnull)enable;
- (void)reset;
- (void)enableLoggingWithShowInConsole:(NSNumber * _Nullable)showInConsole;
- (void)disableLoggingWithShowInConsole:(NSNumber * _Nullable)showInConsole;
@end
