android {
    buildTypes {
        release {
            shrinkResources true
            zipAlignEnabled true
            debuggable false
            jniDebuggable false
            renderscriptDebuggable false
        }
        debug{
        	debuggable true
            jniDebuggable true
            renderscriptDebuggable true
        }
    }
    productFlavors {
        dev {
            applicationId "${packageName}.dev"
        }

        prod {
            applicationId "${packageName}"
        }
    }
}
