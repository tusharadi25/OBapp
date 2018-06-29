//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <cloud_firestore/CloudFirestorePlugin.h>
#import <firebase_analytics/FirebaseAnalyticsPlugin.h>
#import <firebase_auth/FirebaseAuthPlugin.h>
#import <firebase_core/FirebaseCorePlugin.h>
#import <firebase_database/FirebaseDatabasePlugin.h>
#import <firebase_messaging/FirebaseMessagingPlugin.h>
#import <firebase_storage/FirebaseStoragePlugin.h>
#import <google_sign_in/GoogleSignInPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTCloudFirestorePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTCloudFirestorePlugin"]];
  [FirebaseAnalyticsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FirebaseAnalyticsPlugin"]];
  [FirebaseAuthPlugin registerWithRegistrar:[registry registrarForPlugin:@"FirebaseAuthPlugin"]];
  [FLTFirebaseCorePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseCorePlugin"]];
  [FirebaseDatabasePlugin registerWithRegistrar:[registry registrarForPlugin:@"FirebaseDatabasePlugin"]];
  [FirebaseMessagingPlugin registerWithRegistrar:[registry registrarForPlugin:@"FirebaseMessagingPlugin"]];
  [FirebaseStoragePlugin registerWithRegistrar:[registry registrarForPlugin:@"FirebaseStoragePlugin"]];
  [GoogleSignInPlugin registerWithRegistrar:[registry registrarForPlugin:@"GoogleSignInPlugin"]];
}

@end
