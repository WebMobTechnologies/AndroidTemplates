package ${packageName}.utils;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.content.res.Resources;
import android.graphics.Color;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.support.design.widget.Snackbar;

import android.support.v4.content.ContextCompat;
import android.text.TextUtils;
import android.util.Base64;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.NetworkError;
import com.android.volley.NetworkResponse;
import com.android.volley.NoConnectionError;
import com.android.volley.ParseError;
import com.android.volley.ServerError;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import ${packageName}.${appName};
import ${packageName}.R;


import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Locale;
/**
 * Developed at WebMobTechnologies
 * @author @milaptank and @jaymin_wmt
 * Base Activity.
 */
public class CommonUtils {

    private static Context mContext;

    public static void init(Context context) {
        mContext = context;
    }

    public static void showToast(String msg) {
        Toast.makeText(mContext, msg, Toast.LENGTH_SHORT).show();
    }

    public static void showSnackbar(View view, String msg) {
        Snackbar.make(view, msg, Snackbar.LENGTH_LONG)
                .show(); // Don’t forget to show!
    }

    static ProgressDialog pDialog;


    public static void showProgressDialog(Activity activity, String msg) {
        pDialog = new ProgressDialog(activity);
        pDialog.setMessage(msg);
        pDialog.show();
    }

    public static void ChangeProgressDialogMsg(String msg) {
        if (pDialog != null && pDialog.isShowing())
            pDialog.setMessage(msg);
    }

    public static void showProgressDialog(Activity activity, String msg, boolean isCancel) {
        pDialog = new ProgressDialog(activity);
        pDialog.setMessage(msg);
        pDialog.show();
        pDialog.setCancelable(isCancel);
    }

    public static void cancelProgressDialog() {
        if (pDialog != null && pDialog.isShowing())
            pDialog.dismiss();
    }

    public static final int getColor(Context context, int resColor) {

        try {
            final int version = Build.VERSION.SDK_INT;
            if (version >= 23) {
                return ContextCompat.getColor(context, resColor);
            } else {
                return context.getResources().getColor(resColor);
            }
        } catch (Resources.NotFoundException e) {
            return resColor;
        }
    }

    public static final int parseColor(String strColor) {
        try {
            return Color.parseColor(strColor);
        } catch (IllegalArgumentException e) {
            CommonUtils.showToast("Invalid Color Code");
        }
        return Color.BLACK;
    }





    public static void volleyErrorHandle(VolleyError volleyError,
                                         View view) {

        NetworkResponse response = null;

        if (volleyError instanceof TimeoutError
                || volleyError instanceof NoConnectionError) {
            response = volleyError.networkResponse;
        } else if (volleyError instanceof AuthFailureError) {
            response = volleyError.networkResponse;
        } else if (volleyError instanceof ServerError) {
            response = volleyError.networkResponse;
        } else if (volleyError instanceof NetworkError) {
            response = volleyError.networkResponse;
        } else if (volleyError instanceof ParseError) {
            String error = volleyError.getMessage();
            //CommonUtil.ShowAlert(activity, "Server Error");

        }

        if (response != null && response.data != null) {

            switch (response.statusCode) {
                case 404:
                    showAlert(String.format(Locale.getDefault(),
                            "CODE:%d %s", response.statusCode, ${appName}.getAppInstance().getString(R.string.error_not_found)), view);
                    break;
                case 500:
                    showAlert(String.format(Locale.getDefault(),
                            "CODE:%d %s", response.statusCode, ${appName}.getAppInstance().getString(R.string.error_server_error)), view);
                    break;
                default:
                    //	CommonUtil.ShowAlert(activity, "Error");
                    break;
            }
        }
    }

    public static boolean isValidEmail(CharSequence strEmail) {
        return !TextUtils.isEmpty(strEmail)
                && android.util.Patterns.EMAIL_ADDRESS.matcher(strEmail)
                .matches();
    }

    public static boolean isInternetAvailable(Context context) {

        if (isInternet()) {
            return true;

        } else {
            ConnectivityManager cm = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
            NetworkInfo activeNetwork = cm.getActiveNetworkInfo();
            if (activeNetwork != null) {
                if (activeNetwork.getType() == ConnectivityManager.TYPE_WIFI) {
                    return activeNetwork.getState() == NetworkInfo.State.CONNECTED;
                } else if (activeNetwork.getType() == ConnectivityManager.TYPE_MOBILE) {
                    return activeNetwork.getState() == NetworkInfo.State.CONNECTED;
                }
            } else {
                return false;
            }
        }
        return false;
    }

    private static boolean isInternet() {

        Runtime runtime = Runtime.getRuntime();
        try {
            Process ipProcess = runtime.exec("/system/bin/ping -c 1 8.8.8.8");
            int exitValue = ipProcess.waitFor();
            Debug.i(exitValue + "");
            return (exitValue == 0);


        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }

        return false;
    }

    private static void showAlert(String message, View view) {
        if (view != null)
            showSnackbar(view, message);
        else
            showToast(message);
    }
    public static void showSoftKeyboard(Activity activity) {
        InputMethodManager inputMethodManager = (InputMethodManager) activity.getSystemService(Activity.INPUT_METHOD_SERVICE);
        inputMethodManager.toggleSoftInput(InputMethodManager.SHOW_FORCED, InputMethodManager.HIDE_IMPLICIT_ONLY);
    }

    public static void hideSoftKeyboard(Activity activity) {
        InputMethodManager inputMethodManager = (InputMethodManager) activity.getSystemService(Activity.INPUT_METHOD_SERVICE);
        inputMethodManager.hideSoftInputFromWindow(activity.getCurrentFocus().getWindowToken(), 0);
    }


}
