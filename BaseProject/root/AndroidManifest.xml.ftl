<manifest xmlns:android="http://schemas.android.com/apk/res/android" >

    <!-- internet permission -->
    <uses-permission android:name="android.permission.INTERNET" />

    <application  android:name=."${appName}">
		
    	<#if isSplash>
		    <activity android:name=".activity.SplashActivity"

		        <#if isNewProject>
		        	android:label="@string/app_name"
		        <#else>
		        	android:label="@string/title_${simpleName}"
		        </#if>

            	android:theme="@style/${themeNameNoActionBar}"
		        <#if buildApi gte 16 && parentActivityClass != "">android:parentActivityName="${parentActivityClass}"</#if>>
		        <#if parentActivityClass != "">
				    <meta-data android:name="android.support.PARENT_ACTIVITY"
				        android:value="${parentActivityClass}" />
		        </#if>
		        <#if !(isLibraryProject!false)>
				    <intent-filter>
				        <action android:name="android.intent.action.MAIN" />
				        <category android:name="android.intent.category.LAUNCHER" />
				    </intent-filter>
		        </#if>
		    </activity>
            <activity android:name=".activity.${activityClass}"
            	android:theme="@style/${themeNameNoActionBar}"/>
		<#else>
		    <activity android:name=".activity.${activityClass}"
		        <#if isNewProject>
		        	android:label="@string/app_name"
		        <#else>
		        	android:label="@string/title_${simpleName}"
		        </#if>
            	android:theme="@style/${themeNameNoActionBar}"
		        <#if buildApi gte 16 && parentActivityClass != "">android:parentActivityName="${parentActivityClass}"</#if>>
		        <#if parentActivityClass != "">
				    <meta-data android:name="android.support.PARENT_ACTIVITY"
				        android:value="${parentActivityClass}" />
		        </#if>
		        <#if !(isLibraryProject!false)>
				    <intent-filter>
				        <action android:name="android.intent.action.MAIN" />
				        <category android:name="android.intent.category.LAUNCHER" />
				    </intent-filter>
		        </#if>
		    </activity>			
        </#if>
    </application>
</manifest>
