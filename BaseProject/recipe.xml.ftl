<?xml version="1.0" encoding="UTF-8"?>
<recipe>
  <dependency mavenUrl="com.android.support:design:${buildApi}.+"/>
  <dependency mavenUrl="com.android.support:recyclerview-v7:${buildApi}.+"/>
  <dependency mavenUrl="com.mcxiaoke.volley:library:1.0.19"/>
    <#if imageLibrary == "1" >
      <dependency mavenUrl="com.github.bumptech.glide:glide:3.7.0"/>
    <#elseif imageLibrary == "2" >
      <dependency mavenUrl="com.squareup.picasso:picasso:2.5.2"/>
    </#if>
  <merge from="root/AndroidManifest.xml.ftl"
      to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

  <copy from="root/src/app_package/adapter"
      to="${escapeXmlAttribute(srcOut)}/adapter" />

  <copy from="root/src/app_package/listener"
      to="${escapeXmlAttribute(srcOut)}/listener" />
      
  <copy from="root/res/anim"
              to="${escapeXmlAttribute(resOut)}/anim" />
  <copy from="root/res/drawable-hdpi"
    	 to="${escapeXmlAttribute(resOut)}/drawable-hdpi" />

  <copy from="root/res/drawable-mdpi"
  	   to="${escapeXmlAttribute(resOut)}/drawable-mdpi" />

  <copy from="root/res/drawable-xhdpi"
  	   to="${escapeXmlAttribute(resOut)}/drawable-xhdpi" />

  <copy from="root/res/drawable-xxhdpi"
        to ="${escapeXmlAttribute(resOut)}/drawable-xxhdpi" />

  <copy from="root/res/drawable-xxxhdpi"
        to="${escapeXmlAttribute(resOut)}/drawable-xxxhdpi" />

  <copy from="root/res/drawable-sw600dp"
   	    to="${escapeXmlAttribute(resOut)}/drawable-sw600dp" />

  <copy from="root/res/drawable-w820dp"
  	     to="${escapeXmlAttribute(resOut)}/drawable-w820dp" />

  <copy from="root/res/drawable-v21"
  	    to="${escapeXmlAttribute(resOut)}/drawable-v21" />

  <copy from="root/res/drawable-nodpi"
      	  to="${escapeXmlAttribute(resOut)}/drawable-nodpi"/>



  <copy from="root/res/layout/activity_splash.xml"
    to="${escapeXmlAttribute(resOut)}/layout/activity_splash.xml"/>

  <merge from="root/res/values/no_actionbar_styles.xml.ftl"
         to="${escapeXmlAttribute(resOut)}/values/styles.xml" />

  <merge from="root/build.gradle.ftl"	to="${escapeXmlAttribute(topOut)}/app/build.gradle" />

  <#if buildApi gte 21>
        <merge from="root/res/values-v21/no_actionbar_styles_v21.xml.ftl"
           to="${escapeXmlAttribute(resOut)}/values-v21/styles.xml" />
  </#if>

  <merge from="root/res/values/colors.xml"
       to="${escapeXmlAttribute(resOut)}/values/colors.xml" />

  <merge from="root/res/values/strings.xml.ftl"
       to="${escapeXmlAttribute(resOut)}/values/strings.xml" />

  <instantiate from="root/res/layout/common_toolbar.xml.ftl"
               to="${escapeXmlAttribute(resOut)}/layout/common_toolbar.xml" />

  <instantiate from="root/res/layout/activity_common_layout.xml.ftl"
               to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

  <instantiate from="root/src/app_package/Application.java.ftl"
           to="${escapeXmlAttribute(srcOut)}/${appName}.java" />
  <#if isSplash>

  <instantiate from="root/src/app_package/activity/SplashActivity.java.ftl"
                  to="${escapeXmlAttribute(srcOut)}/activity/SplashActivity.java" />
  </#if>

  <instantiate from="root/src/app_package/activity/BaseActivity.java.ftl"
  to="${escapeXmlAttribute(srcOut)}/activity/BaseActivity.java" />

  <instantiate from="root/src/app_package/activity/SimpleActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity/${activityClass}.java" />

  <instantiate from="root/src/app_package/utils/CommonUtils.java.ftl"
           to="${escapeXmlAttribute(srcOut)}/utils/CommonUtils.java" />

  <instantiate from="root/src/app_package/utils/Debug.java.ftl"
       to="${escapeXmlAttribute(srcOut)}/utils/Debug.java" />

  <instantiate from="root/src/app_package/utils/http/VolleyUtils.java.ftl"
                 to="${escapeXmlAttribute(srcOut)}/utils/http/VolleyUtils.java" />
  <instantiate from="root/src/app_package/utils/http/imageutil/BitmapCache.java.ftl"
                to="${escapeXmlAttribute(srcOut)}/utils/http/imageutil/BitmapCache.java" />

  <instantiate from="root/src/app_package/utils/http/imageutil/BitmapUtil.java.ftl"
               to="${escapeXmlAttribute(srcOut)}/utils/http/imageutil/BitmapUtil.java" />

  <instantiate from="root/src/app_package/utils/http/imageutil/DiskBitmapCache.java.ftl"
                 to="${escapeXmlAttribute(srcOut)}/utils/http/imageutil/DiskBitmapCache.java" />

  <!-- Development Packages -->
  <instantiate from="root/src/dev/src/utils/Constant.java.ftl"
       to="app/src/dev/java/${slashedPackageName(packageName)}/utils/Constant.java" />

  <!-- production Packages -->
  <instantiate from="root/src/dev/src/utils/Constant.java.ftl"
             to="app/src/prod/java/${slashedPackageName(packageName)}/utils/Constant.java" />
</recipe>
