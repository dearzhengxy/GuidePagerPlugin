package com.guidepager.plugin;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;

public class MyPreference {
    public static MyPreference userP = null;
    private static SharedPreferences sp = null;
    private static Editor ed = null;
    private static Context con = null;
    private static String name = "user";

    private static String crashReport = "";

    private MyPreference() {
    }

    public static MyPreference getInstance(Context ctx) {
        if (null == userP) {
            userP = new MyPreference();
            con = ctx;
            sp = con.getSharedPreferences(name, Context.MODE_PRIVATE);
            ed = sp.edit();
        }
        return userP;
    }


    private String sid = "";
    private String did = "";
    private String account = "";

    private String cmsAuthrization = "";

    private String token = "";


    private String environtmentId = "";
    private String sessionKey = "";
    private String actualOrVirtual = "1";

    private String loginMethodActualOrVirtual = "0";//登录使用的判别方法

    private boolean isLogin = false;
    private boolean isEncrypt = false;
    private boolean isStartFromIndex= false;
    private boolean isNotice= true;
    private int tradeIndex= 0;

    private int lastTouchNoticeId = 0;

    //上次版本build号
    private  int lastVersionCode = 1;


    public String getCrashReport(){
        return sp.getString("crashreport",crashReport);
    }

    public void setCrashReport(String report){
        ed.putString("crashreport",report);
        ed.commit();
    }

    public int getLastVersionCode() {

        return sp.getInt("lastVersionCode",lastVersionCode);
    }

    public void setLastVersionCode(int lastVersionCode) {
        ed.putInt("lastVersionCode",lastVersionCode);
        ed.commit();
    }

    public void creashReportEmpty(){
        ed.putString("crashreport","");
        ed.commit();
    }


    public int getTradeIndex() {
        return sp.getInt("tradeIndex", tradeIndex);
    }

    public void setTradeIndex(int tradeIndex) {
        ed.putInt("tradeIndex", tradeIndex);
        ed.commit();
    }

    public boolean isNotice() {
        return sp.getBoolean("isNotice", isNotice);
    }

    public void setNotice(boolean notice) {
        ed.putBoolean("isNotice", notice);
        ed.commit();
    }

    public boolean isStartFromIndex() {
        return sp.getBoolean("isStartFromIndex", isStartFromIndex);
    }

    public void setStartFromIndex(boolean startFromIndex) {
        ed.putBoolean("isStartFromIndex", isStartFromIndex);
        ed.commit();
    }

    public String getSessionKey() {
        return sp.getString("sessionKey", sessionKey);
    }

    public void setSessionKey(String sessionKey) {
        ed.putString("sessionKey", sessionKey);
        ed.commit();
    }

    public boolean isEncrypt() {
        return sp.getBoolean("encrypt", isEncrypt);
    }

    public void setEncrypt(boolean encrypt) {
        ed.putBoolean("encrypt", encrypt);
        ed.commit();
    }


    /*************判断实盘还是模拟盘的**************/
    //"0"代表模拟盘登录，"1"代表实盘登录
    public String getActualOrVirtual() {
        return sp.getString("actualOrVirtual", actualOrVirtual);
    }

    public void setActualOrVirtual(String actualOrVirtual) {
        ed.putString("actualOrVirtual", actualOrVirtual);
        ed.commit();
    }
    /*************判断实盘还是模拟盘的**************/


    /************************判断请求的方式(请求的是模拟盘还是实盘)*******************************/

    //false代表模拟盘请求,true代表实盘请求
    public String getLoginMethodActualOrVirtual() {
        return sp.getString("loginMethodActualOrVirtual", loginMethodActualOrVirtual);
    }

    public void setLoginMethodActualOrVirtual(String loginMethodActualOrVirtual) {
        ed.putString("loginMethodActualOrVirtual", loginMethodActualOrVirtual);
        ed.commit();
    }
    /************************判断请求的方式(请求的是模拟盘还是实盘)*******************************/


    public String getSid() {
        return sp.getString("sid", sid);
    }


    public String getAccount() {
        return sp.getString("account", account);
    }

    public void setAccount(String account) {
        ed.putString("account", account);
        ed.commit();
    }

    public String getCmsAuthrization() {
        return sp.getString("cmsauthrization", cmsAuthrization);
    }

    public void setCmsAuthrization(String cmsAuthrization) {
        ed.putString("cmsauthrization", cmsAuthrization);
        ed.commit();
    }

    public String getToken() {

        return sp.getString("token", token);

    }

    public void setToken(String token) {
        ed.putString("token", token);
        ed.commit();
    }


    /****************存储账号和取出账号，以environmentId为key**************/
    public String getEnvironmentAccount(String environmentId){
        return sp.getString(environmentId, account);
    }

    public void setEnvironmentAccount(String account , String environmentId){
        setLoginEnvironmentAccount(environmentId);
        ed.putString(environmentId,account);
        ed.commit();
    }

    public void setLoginEnvironmentAccount(String environmentId){
        ed.putString("environmentId",environmentId);
        ed.commit();
    }
    /****************存储账号和取出账号，以environmentId为key**************/


    public void setSid(String sid) {
        ed.putString("sid", sid);
        ed.commit();
    }

    public String getDid() {
        return sp.getString("did", did);
    }

    public void setDid(String did) {
        ed.putString("did", did);
        ed.commit();
    }

    public int  getLastTouchNoticeId(String environmentAccount) {
        return sp.getInt(environmentAccount, lastTouchNoticeId);
    }

    public void setLastTouchNoticeId(int lastTouchNoticeId,String environmentAccount) {
        ed.putInt(environmentAccount, lastTouchNoticeId);
        ed.commit();
    }


    public boolean isLogin() {
        return sp.getBoolean("isLogin", isLogin);
    }

    public void setLogin(boolean login) {
        ed.putBoolean("isLogin", login);
        ed.commit();
    }



    private void putData(String key, Object value) {
        if (value instanceof Boolean) {
            ed.putBoolean(key, (Boolean) value);
        } else if (value instanceof String) {
            ed.putString(key, value.toString());
        } else if (value instanceof Integer) {
            ed.putInt(key, (Integer) value);
        } else if (value instanceof Float) {
            ed.putFloat(key, (Float) value);
        }
        // TODO: other data types
        ed.commit();
    }
}
