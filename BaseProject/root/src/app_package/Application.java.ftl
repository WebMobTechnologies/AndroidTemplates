package ${packageName};

import android.app.Application;

import ${packageName}.utils.http.VolleyUtils;
import ${packageName}.utils.CommonUtils;
import com.mpt.android.storage.SharedPreferenceUtil;
<#if imageLibrary == "1" >
    import com.bumptech.glide.Glide;
<#elseif imageLibrary == "2" >
    import com.squareup.picasso.Picasso;
</#if>

public class ${appName} extends Application {

    private static ${appName} appInstance;
    private static final String TAG = ${appName}.class.getSimpleName();
    <#if imageLibrary == "1" >
        private static Glide sGlide;
    <#elseif imageLibrary == "2" >
        private static Picasso sPicasso;
    </#if>

    @Override
    public void onCreate() {
        super.onCreate();
        appInstance = this;
        CommonUtils.init(this);
        VolleyUtils.initVolley(this);
    }

    public static ${appName} getAppInstance() {
        return appInstance;
    }
    <#if imageLibrary == "1" >
        public static Glide getGlide() {
            if (sGlide == null) {
                sGlide = Glide.get(getAppInstance());
            }
            return sGlide;
        }
    <#elseif imageLibrary == "2" >
        public static Picasso getPicasso() {
            if (sPicasso == null) {
                sPicasso = new Picasso.Builder(getAppInstance())
                        .build();
            }
            return sPicasso;
        }
    </#if>
}
