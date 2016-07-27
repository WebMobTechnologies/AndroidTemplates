package ${packageName}.utils.http.imageutil;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import com.android.volley.toolbox.DiskBasedCache;
import com.android.volley.toolbox.ImageLoader.ImageCache;

import java.io.File;

public class DiskBitmapCache extends DiskBasedCache implements ImageCache {

    public DiskBitmapCache(File rootDirectory, int maxCacheSizeInBytes) {
        super(rootDirectory, maxCacheSizeInBytes);
    }

    public DiskBitmapCache(File cacheDir) {
        super(cacheDir);
    }

    @Override
    public Bitmap getBitmap(String url) {
        final Entry requestedItem = get(url);

        if (requestedItem == null)
            return null;

        return BitmapFactory.decodeByteArray(requestedItem.data, 0,
                requestedItem.data.length);
    }

    @Override
    public void putBitmap(String url, Bitmap bitmap) {

        final Entry entry = new Entry();

        entry.data = BitmapUtil.convertBitmapToBytes(bitmap);
        put(url, entry);
    }
}
