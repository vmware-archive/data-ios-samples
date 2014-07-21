Pivotal Mobile Services Suite Data SDK Sample for iOS
=====================================================

The Data SDK requires iOS 6.0 or greater.

Data SDK Usage
--------------

For more information please visit the [docs site](https://github.com/cfmobile/docs-datasync-ios)


Sample Application
------------------

There is a small sample application included in this repository to demonstrate and exercise the features in the Data Client SDK.

You can use this sample application to test authorization using an OpenID Connect enabled identity server and the Pivotal Mobile Services Suite back-end server for data storage. You are able to define an MSSDataObject name and id and store and retrieve key-value data to the backend server for a given user.

Watch the log output in the sample application's display to see what the Data library is doing in the background. This log output should also be visible in the iOS device console (for debug builds), but the sample application registers a "listener" with the Data Library's logger so it can show you what's going on.