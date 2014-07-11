//
//  DataSyncSignIn+Internal.h
//  DataSyncServices Spec
//
//  Created by DX123-XL on 2014-05-21.
//
//

#import "DataSyncSignIn.h"

@class AFOAuthCredential, DataSyncServiceClient;

@interface DataSyncSignIn ()

// The client used to make the OAuth requests to the OpenID connect server.
- (AFOAuth2Client *)authClient;

- (AFOAuthCredential *)credential;

- (AFHTTPClient *)dataServiceClient:(NSError **)error;

- (void)setCredential:(AFOAuthCredential *)credential;

- (BOOL)authenticateWithInteractiveOption:(BOOL)interactive
                                  success:(void (^)(AFOAuthCredential *credential))success
                                  failure:(void (^)(NSError *error))failure;

+ (void)setSharedInstance:(DataSyncSignIn *)sharedInstance;

@end
