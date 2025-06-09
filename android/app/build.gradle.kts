import java.util.Properties
import java.io.FileInputStream
import java.io.FileOutputStream

plugins {
    id("com.android.application")
    id("com.google.gms.google-services") // FlutterFire
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

// ✅ تحميل وتحديث version تلقائيًا
val versionPropsFile = file("../version.properties")
val versionProps = Properties()

if (versionPropsFile.exists()) {
    versionProps.load(FileInputStream(versionPropsFile))
} else {
    versionProps["VERSION_CODE"] = "4"
    versionProps["MAJOR_VERSION"] = "1"
    versionProps["MINOR_VERSION"] = "0"
}

val currentVersionCode = versionProps["VERSION_CODE"].toString().toInt()
val newVersionCode = currentVersionCode + 1
versionProps["VERSION_CODE"] = newVersionCode.toString()

val major = versionProps["MAJOR_VERSION"].toString()
val minor = versionProps["MINOR_VERSION"].toString()
val versionName = "$major.$minor.$newVersionCode" // ← تلقائي

// ✅ حفظ التحديث في الملف
versionProps.store(FileOutputStream(versionPropsFile), null)

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
        versionCode = newVersionCode
        versionName = versionName
    }

    signingConfigs {
        create("release") {
            storeFile = file("./mzaodin-key.jks")
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
