package com.guidepager.plugin;

import android.content.Context;

/**
 * Created by mac005 on 2018/8/1.
 */

public class MResource {

    public static int getIdByName(Context context, String className, String resName) {

        String packageName = context.getPackageName();
    int id = 0;
        try {
        Class r = Class.forName(packageName + ".R");
        Class[] classes = r.getClasses();
        Class desireClass = null;
        for (Class cls : classes) {
            if (cls.getName().split("\\$")[1].equals(className)) {
                desireClass = cls;
                break;
            }
        }
        if (desireClass != null) {
            id = desireClass.getField(resName).getInt(desireClass);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
        return id;
}

}
