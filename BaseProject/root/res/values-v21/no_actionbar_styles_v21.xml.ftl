<resources>
    <#if !themeExistsNoActionBar>
        <style name="${themeNameNoActionBar}"<#if !implicitParentTheme> parent="${themeName}"</#if>>
            <item name="windowActionBar">false</item>
            <item name="windowNoTitle">true</item>
            <item name="android:windowDrawsSystemBarBackgrounds">true</item>
        </style>
    </#if>
</resources>
