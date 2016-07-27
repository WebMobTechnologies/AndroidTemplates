package ${packageName}.activity;

import ${packageName}.R;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;

import ${packageName}.utils.CommonUtils;
/**
 * Developed at WebMobTechnologies
 * @author @milaptank and @jaymin_wmt
 * Demo Activity.
 */
public class ${activityClass} extends BaseActivity {

    public static final String TAG = ${activityClass}.class.getSimpleName();

    public ${activityClass}() {
        super(R.layout.${layoutName}, R.id.common_toolbar);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        return super.onOptionsItemSelected(item);
    }
}
