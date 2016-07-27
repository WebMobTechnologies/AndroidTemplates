package ${packageName}.utils.http;

import com.android.volley.AuthFailureError;
import com.android.volley.NetworkResponse;
import com.android.volley.ParseError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.RetryPolicy;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.HttpHeaderParser;
import org.json.JSONException;
import org.json.JSONObject;
import java.io.UnsupportedEncodingException;
import java.util.Map;
/**
 * Developed at WebMobTechnologies
 *
 * @author @milaptank and @jaymin_wmt
 *         HttpVolleyRequest
 */
public class HttpVolleyRequest extends Request<JSONObject> {

    private Response.Listener<JSONObject> listener;
    Response.ErrorListener errorListener;
    private Map<String, String> params;

    public HttpVolleyRequest(int method, String url, Map<String, String> params,
                             Response.Listener<JSONObject> responseListener, Response.ErrorListener errorListener) {
        super(method, url, errorListener);
        this.listener = responseListener;
        this.params = params;
        this.errorListener = errorListener;
    }

    @Override
    public Request<?> setRetryPolicy(RetryPolicy retryPolicy) {
        // TODO Auto-generated method stub
        return super.setRetryPolicy(retryPolicy);
    }

    @Override
    protected Response<JSONObject> parseNetworkResponse(NetworkResponse response) {
        try {
            String jsonString = new String(response.data,
                    HttpHeaderParser.parseCharset(response.headers));
            return Response.success(new JSONObject(jsonString),
                    HttpHeaderParser.parseCacheHeaders(response));

        } catch (UnsupportedEncodingException e) {
            return Response.error(new ParseError(e));
        } catch (JSONException je) {
            return Response.error(new ParseError(je));
        }
    }

    @Override
    protected void deliverResponse(JSONObject response) {
        listener.onResponse(response);
    }

    @Override
    protected Map<String, String> getParams() throws AuthFailureError {
        return params;// super.getParams();
    }

    @Override
    public void deliverError(VolleyError error) {
        // super.deliverError(error);
        errorListener.onErrorResponse(error);
    }

}
