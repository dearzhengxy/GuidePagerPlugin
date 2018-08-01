var path = require('path');
var fs = require('fs');
var configPath = "";



//安卓平台删除文件
removeFile('platforms/android/app/src/main/res/layout/activity_guide_pager.xml');
removeFile('platforms/android/app/src/main/res/layout/guid_view1.xml');
removeFile('platforms/android/app/src/main/res/layout/guid_view2.xml');
removeFile('platforms/android/app/src/main/res/layout/guid_view3.xml');

removeFile('platforms/android/app/src/main/res/mipmap-xhdpi/pic_guidepage_1.png');
removeFile('platforms/android/app/src/main/res/mipmap-xhdpi/pic_guidepage_2.png');
removeFile('platforms/android/app/src/main/res/mipmap-xhdpi/pic_guidepage_3.png');

removeFile('platforms/android/app/src/main/res/mipmap-xxhdpi/pic_guidepage_1.png');
removeFile('platforms/android/app/src/main/res/mipmap-xxhdpi/pic_guidepage_2.png');
removeFile('platforms/android/app/src/main/res/mipmap-xxhdpi/pic_guidepage_3.png');

removeFile('platforms/android/app/src/main/res/drawable/button_enter_shape.xml');
removeFile('platforms/android/app/src/main/res/drawable/dot_selector.xml');
removeFile('platforms/android/app/src/main/res/drawable/point1.png');
removeFile('platforms/android/app/src/main/res/drawable/point2.png');


function removeFile(fileAbsolutePath) {

  if (fs.existsSync(fileAbsolutePath)) {

    fs.unlink(fileAbsolutePath, function (err) {
      if (err) 
      return console.log(err);
    })
  } else {
    console.log("missing: " + fileAbsolutePath);
  }
}

