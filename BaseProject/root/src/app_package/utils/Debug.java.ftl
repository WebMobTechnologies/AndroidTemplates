package ${packageName}.utils;

import android.util.Log;
/**
 * Developed at WebMobTechnologies
 *
 * @author @milaptank and @jaymin_wmt
 *         Debug Logs 
 */
public class Debug {
    public static final boolean debug = BuildConfig.DEBUG;
    public static final String TAG = Debug.class.getSimpleName();

    public static void i(String tag, String message) {
        if (debug) {
            Log.i(tag, message);
        }
    }

    public static void i(String message) {
        Debug.i(TAG, message);
    }

    public static void e(String tag, String message) {
        if (debug) {
            Log.e(tag, message);
        }
    }

    public static void e(String message) {
        Debug.e(TAG, message);
    }

    public static void e(String tag, String message, Exception e) {
        if (debug) {
            Log.e(tag, message);
            e.printStackTrace();
        }
    }
}
