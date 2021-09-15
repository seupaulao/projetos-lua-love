1. Download APKTool and follow the installation instructions.
2. Download latest LÖVE APK from here and put it somewhere in folder.
3. In current folder (where you store the LÖVE APK), open Command Prompt/Terminal in the current directory and execute 

java -jar apktool d -s -o love_decoded love-11.3-android-embed.apk 

and new folder **love_decoded** will be created. 
You can use any folder name, just make sure to make it consistent in later operations.

4. In love_decoded folder, create new folder named assets and put your __game.love__ inside that folder. Your packaged game must be named exactly __game.love__!

5. (Optional) Change the APK icon by replacing the LÖVE icon in res/drawable-{mdpi,{x,{x,{x,}}}hdpi} (mdpi, hdpi, xhdpi, xxhdpi, and xxxhdpi). 
Replace love.png with your game icon in those folders. Make sure the image dimensions are same!

6. Modify AndroidManifest.xml and use this template: 

<manifest package="${GamePackageName}"
      android:versionCode="${GameVersionCode}"
      android:versionName="${GameVersionSemantic}"
      android:installLocation="auto" xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.VIBRATE"/>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" android:maxSdkVersion="18"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" android:maxSdkVersion="18"/>
    <!--Uncomment line below if your game uses microphone capabilities. !-->
    <!--uses-permission android:name="android.permission.RECORD_AUDIO" /!-->
    <uses-feature android:glEsVersion="0x00020000"/>
    <application
        android:allowBackup="true"
        android:icon="@drawable/love"
        android:label="${GameName}"
        android:theme="@android:style/Theme.NoTitleBar.Fullscreen"
    >
        <activity
            android:configChanges="orientation|screenSize"
            android:label="${GameName}"
            android:launchMode="singleTask"
            android:name="org.love2d.android.GameActivity"
            android:screenOrientation="sensorLandscape"
        >
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
                <category android:name="tv.ouya.intent.category.GAME"/>
            </intent-filter>
        </activity>
    </application>
</manifest>

 Here are the explanation of the variables. You just have to substitute them:
 * ${GamePackageName} is your game internal package name.                                 Example: com.pjlaapps.nomeaplicativo
 * ${GameVersionCode} is the internal APK version code.                                   Example: 210
 * ${GameVersionSemantic} is the readable APK version string.                             Example: 2.1.0
 * ${GameName} is your game name which is going to be displayed in home screen/launcher.  Example: "Nome qualquer do aplicativo"
 Make sure to substitute those variables.
 * ${APPLICATIONID} id da aplicação para o ADMOB apenas                                   Example : ca-app-pub-3940256099942544~3347511713


7. Back to folder where you put the LÖVE APK then execute 

java -jar apktool b -o your_game.apk love_decoded. 

You can use any name, but again, make it consistent. 

8. Assine o APK

java -jar ../uber-apk-signer-1.1.0.jar --apks your_game.apk


------------------------

### Compilei a versão ADMOB para love 11.3 APK 
0. como colocar/chamar o admob do jogo? [ver o teste]
1. funcionou rodar a versão admob teste para love 11.3, testei com sucesso:
   - interticial
   - banner
   - video de recompensa
2. java -jar apktool.jar d -s -o love_admob_decoded love-11.3-embebed-with-admob.apk, rodar onde está o apk
3. entrar na pasta love_admob_decoded
4. editar o AndroidManifest, o qual pode permanecer o mesmo que já está disponível dentro do love-11.3-embebed-with-admob.apk,
alterando apenas:
   - package                             colocar o nome do pacote, exemplo : com.pjlaapps.seuaplicativo
   - platformBuildVersionCode    colocar o numero do version code, exemplo : 1
   - platformBuildVersionName    colocar o build version name,     exemplo : 1.0.0
   - android:label               colocar o nome do app, tem 2 lugares   ex : "APLICATIVO EXEMPLO" 
   - android:name="com.google.android.gms.ads.APPLICATION_ID", substituir o android:value com o application_id para admob
5. substitua na pasta assets o game.love com o seu _jogo_ renomeado obrigatoriamente para __game.love__
6. java -jar apktool.jar b -o nome_da_app.apk love_admob_decoded, rodar fora da pasta __love_admob_decoded__
7. assine o apk : java -jar uber-apk-signer-1.1.0 --apks nome_da_app.apk



