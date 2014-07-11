//
//  DataSyncError.h
//  
//
//  Created by Elliott Garcea on 2014-06-04.
//
//

#ifndef _DataSyncError_h
#define _DataSyncError_h

OBJC_EXTERN NSString *const kOAuthCredentialID;
OBJC_EXTERN NSString *const kDataSyncServicesErrorDomain;

typedef NS_ENUM(NSInteger, DataSyncServicesErrorCode) {
    DataSyncServicesNoClientIDError,
    DataSyncServicesNoClientSecretError,
    DataSyncServicesNoOpenIDConnectURLError,
    DataSyncServicesFailedAuthenticationError,
    DataSyncServicesMalformedURLError,
    DataSyncServicesEmptyResponseData,
    DataSyncServicesMissingAccessToken,
    DataSyncServicesAuthorizationRequired,
    DataSyncServicesObjectIDRequired,
};

#endif
