package ${packageName}.activity;

import android.os.Bundle;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TextView;

import ${packageName}.R;

/**
 * Developed at WebMobTechnologies
 * @author @milaptank and @jaymin_wmt
 * Base Activity.
 */

public class BaseActivity extends AppCompatActivity {

    private final int mLayoutResId;
    private final int mToolbarId;



    private Toolbar toolbar;
    private Menu optionMenu;



    public BaseActivity(int layoutResId, int toolbarId) {
        mLayoutResId = layoutResId;
        mToolbarId = toolbarId;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(mLayoutResId);

        toolbar = (Toolbar) findViewById(mToolbarId);
        setSupportActionBar(toolbar);
    }

    public Toolbar getToolbar() {
        return toolbar;
    }

    public Menu getOptionMenu() {
        return optionMenu;
    }


    @Override
    public void setTitle(CharSequence title) {
        ActionBar actionBar = getSupportActionBar();
        if (actionBar == null) {
            super.setTitle(title);
        } else {
            actionBar.setTitle(title);
        }
    }

    @Override
    public void setTitle(int titleId) {
        ActionBar actionBar = getSupportActionBar();
        if (actionBar == null) {
            super.setTitle(titleId);
        } else {
            actionBar.setTitle(titleId);
        }
    }

    public void setBackIcon(boolean isSetBackIcon) {
        if (isSetBackIcon) {
            getToolbar().setNavigationIcon(R.drawable.ic_action_nav_back);
        } else {
            getToolbar().setNavigationIcon(null);
        }
    }

    public void setLogo(int icon) {
	getToolbar().setLogo(icon);
    }

    @Override
    protected void onResume() {
        super.onResume();
    }



    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        optionMenu = menu;
        return super.onCreateOptionsMenu(menu);
    }
    public void generateMenu() {
        optionMenu.clear();
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

        switch (item.getItemId()) {
            case android.R.id.home:
                onBackPressed();
                break;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    public void onBackPressed() {
       
    }
}
