package ${packageName}.utils.http;

import android.content.Context;
import android.text.TextUtils;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.ImageLoader;
import ${packageName}.utils.http.imageutil.BitmapCache;
import ${packageName}.utils.http.imageutil.BitmapUtil;
import ${packageName}.utils.http.imageutil.DiskBitmapCache;

/**
 * Developed at WebMobTechnologies
 * @author @milaptank and @jaymin_wmt
 * VolleyUtils
 */
public class VolleyUtils {
    public static final String TAG = VolleyUtils.class.getSimpleName();

    private static Context mContext;
    private static ImageLoader imageLoader;
    private static RequestQueue requestQueue;

    public static void initVolley(Context context) {
        mContext = context;
    }
 public static VolleyUtils getInstance() {
        return new VolleyUtils();
    }

    /**
     * Gets volley request queue.
     *
     * @return the request queue
     */
    public static RequestQueue getRequestQueue() throws Exception {

        try {
            if (requestQueue == null) {
                requestQueue = Volley.newRequestQueue(mContext);
            }
            return requestQueue;
        } catch (Exception npe) {
            throw new Exception("must init VolleyUtils#initVolley(this) in Application class");
        }

    }

    public ImageLoader getDiskImageLoader() throws Exception {
        getRequestQueue();
        if (imageLoader == null) {
            imageLoader = new ImageLoader(requestQueue,
                    new DiskBitmapCache(mContext.getCacheDir(),
                            BitmapUtil.MAX_CATCH_SIZE));
        }
        return imageLoader;
    }

    public ImageLoader getCacheImageLoader() throws Exception {
        getRequestQueue();
        if (imageLoader == null) {
            imageLoader = new ImageLoader(requestQueue, new BitmapCache(
                    BitmapUtil.MAX_CATCH_SIZE));
        }
        return imageLoader;
    }

    /**
     * Add to request queue.
     *
     * @param <T> the type parameter
     * @param req the req
     * @param tag the tag
     */
    public static <T> void addToRequestQueue(Request<T> req, String tag) throws Exception {
        req.setTag(TextUtils.isEmpty(tag) ? TAG : tag);
        getRequestQueue().add(req);
    }

    /**
     * Add to request queue.
     *
     * @param <T> the type parameter
     * @param req the req
     */
    public <T> void addToRequestQueue(Request<T> req) throws Exception {
        req.setTag(TAG);
        getRequestQueue().add(req);
    }

    /**
     * Cancel pending requests.
     *
     * @param tag the tag
     */
    public void cancelPendingRequests(Object tag) {
        if (requestQueue != null) {
            requestQueue.cancelAll(tag);
        }
    }

}
