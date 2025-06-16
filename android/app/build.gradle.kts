
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Properties
import java.io.FileInputStream
import java.io.FileOutputStream

plugins {
    id("com.android.application")
    id("com.google.gms.google-services") // FlutterFire
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

// ✅ توليد versionCode من التاريخ بشكل آمن
val date = SimpleDateFormat("yyyyMMddHH").format(Date())  // HH لضمان فريدة كل ساعة
val versionPropsFile = rootProject.file("local.properties")
val versionProps = Properties()

if (versionPropsFile.exists()) {
    versionProps.load(versionPropsFile.inputStream())
} else {
    versionProps["MAJOR_VERSION"] = "1"
    versionProps["MINOR_VERSION"] = "0"
    versionProps["VERSION_CODE"] = "1"
}

val majorVersion = (versionProps["MAJOR_VERSION"] as String).toInt()
val minorVersion = (versionProps["MINOR_VERSION"] as String).toInt()
val currentVersionCode = (versionProps["VERSION_CODE"] as String).toInt()
val nextVersionCode = currentVersionCode + 1

// ✅ إنشاء versionName بصيغة 1.0
val versionName = "$majorVersion.$minorVersion.$nextVersionCode"
println("Current Version: $versionName (Code: $currentVersionCode)")

// ✅ حفظ النسخة الجديدة في الملف
versionProps["VERSION_CODE"] = nextVersionCode.toString()
versionProps.store(versionPropsFile.outputStream(), null)
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
        versionCode = date.toInt()+ nextVersionCode
        versionName = "$majorVersion.$minorVersion.$nextVersionCode"

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
