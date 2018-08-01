package com.guidepager.plugin;

import android.content.Intent;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;


/**
 * Created by mac005 on 2018/6/5.
 */

public class GuidePagerPlugin  extends CordovaPlugin{


    private CallbackContext mCallbackContext;
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        this.mCallbackContext = callbackContext;
        if("openGuidePager".equals(action)){

            int currentVersionCode=  AppTools.getVersionCode(this.cordova.getActivity());
            int latestVersionCode=MyPreference.getInstance(this.cordova.getActivity()).getLastVersionCode();

            if (currentVersionCode>latestVersionCode)
            {
                //第一次
                Intent intent = new Intent(this.cordova.getActivity(), GuidePagerActivity.class);
                this.cordova.startActivityForResult(this, intent, 0);

                MyPreference.getInstance(this.cordova.getActivity()).setLastVersionCode(currentVersionCode);
            }

            return true;
        }
        return false;
    }

    @Override
     public void onActivityResult(int requestCode, int resultCode, Intent intent) {
        // 根据resultCode判断处理结果

    }
}
