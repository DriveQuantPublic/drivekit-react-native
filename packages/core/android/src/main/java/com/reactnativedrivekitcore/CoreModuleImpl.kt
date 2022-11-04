package com.reactnativedrivekitcore;

import com.drivequant.drivekit.core.DriveKit
import com.facebook.react.bridge.Promise

/**
 * This is where the module implementation lives
 * The exposed methods can be defined in the `turbo` and `legacy` folders
 */
object CoreModuleImpl {
    const val NAME = "RNDriveKitCore"

    fun initialize(application: android.app.Application){
      DriveKit.initialize(application)
    }

    fun setApiKey(key: String){
      DriveKit.setApiKey(key);
    }

    fun setUserId(userId: String){
      DriveKit.setUserId(userId)
    }

    fun multiply(a: Double, b: Double, promise: Promise) {
        promise.resolve(a * b)
    }
}
