package ${packageName}.activity;

import ${packageName}.R;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import  ${packageName}.utils.http.HttpVolleyRequest;
import  ${packageName}.utils.http.VolleyUtils;
import ${packageName}.utils.CommonUtils;
/**
 * Developed at WebMobTechnologies
 * @author @milaptank and @jaymin_wmt
 * Demo Activity.
 */
public class ${activityClass} extends BaseActivity implements Response.Listener<JSONObject>, Response.ErrorListener {

    public static final String TAG = ${activityClass}.class.getSimpleName();
  private TextView tvDemo;
    public ${activityClass}() {
        super(R.layout.${layoutName}, R.id.common_toolbar);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
   tvDemo = (TextView) findViewById(R.id.tvVolley);

        // pass Post parameter
        /*Map<String, String> param = new HashMap<>();
        param.put("Key", "Value");
        param.put("Key", "Value");*/

        String url = "http://api.openweathermap.org/data/2.5/weather?q=Ahmedabad,India";

        HttpVolleyRequest volleyRequest = new HttpVolleyRequest(Request.Method.GET, url,/*param*/null, this, this);
        try {
            VolleyUtils.getInstance().addToRequestQueue(volleyRequest, TAG);
            CommonUtils.showProgressDialog(this, "Weather is awesome...");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        return super.onOptionsItemSelected(item);
    }


    @Override
    public void onErrorResponse(VolleyError error) {
        CommonUtils.cancelProgressDialog();

    }

    @Override
    public void onResponse(JSONObject response) {
        CommonUtils.cancelProgressDialog();

        if (!TextUtils.isEmpty(response.toString()))
            tvDemo.setText(String.valueOf(response));


	//Handel API response here
    }
}
