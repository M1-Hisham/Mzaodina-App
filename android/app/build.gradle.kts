import java.text.SimpleDateFormat
import java.util.Date

plugins {
    id("com.android.application")
    id("com.google.gms.google-services") // FlutterFire
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

// ✅ توليد versionCode من التاريخ بشكل آمن
val date = SimpleDateFormat("yyyyMMddHH").format(Date())  // HH لضمان فريدة كل ساعة

android {
    namespace = "com.mzaodin.app"
    compileSdk = 35
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.mzaodin.app"
        minSdk = 21
        targetSdk = 35
        versionCode = date.toInt()
        versionName = "1.0.${date.takeLast(2)}"
    }

    signingConfigs {
        create("release") {
            storeFile = file("/media/islam/islam/mzaodin-key.jks")
            storePassword = "islamroot$$"
            keyAlias = "mzaodin"
            keyPassword = "islamroot$$"
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = false
            isShrinkResources = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}
