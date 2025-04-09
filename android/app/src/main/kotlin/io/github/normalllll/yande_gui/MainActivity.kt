package io.github.normalllll.yande_gui

import android.content.ContentValues
import android.content.Context
import android.media.MediaScannerConnection
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.provider.MediaStore
import android.webkit.MimeTypeMap
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File


class MainActivity : FlutterActivity() {
    private val channel = "io.github.normalllll.yandegui/image_saver"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler { call, result ->
            when (call.method) {
                "saveImage" -> {
                    val filePath = call.argument<String>("filePath")!!
                    val fileName = call.argument<String>("fileName")!!
                    val success = saveImage(filePath, fileName)
                    result.success(success)
                }

                "existImage" -> {
                    val fileName = call.argument<String>("fileName")!!
                    val success = imageIsExist(fileName, null)
                    result.success(success)
                }

                else -> result.notImplemented()
            }
        }
    }


}


fun Context.saveImage(filePath: String, fileName: String): Boolean {
    val file = File(filePath)

    if (!file.exists()) {
        return false
    }

    if (imageIsExist(fileName, null)) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) {
            val existingFile =
                File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES).path + "/Yande/$fileName")
            if (existingFile.exists()) {
                existingFile.delete()
            }
        } else {
            val where =
                "${MediaStore.Images.Media.RELATIVE_PATH} LIKE ? AND ${MediaStore.Images.Media.DISPLAY_NAME} = ?"
            val args = arrayOf("%${Environment.DIRECTORY_PICTURES}/Yande%", fileName)
            contentResolver.delete(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, where, args)
        }
    }

    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) {

        val saveDirectory = File(
            Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES),
            "Yande"
        )

        val imageFile = File("${saveDirectory.absolutePath}/$fileName")

        val parent = imageFile.parentFile ?: return false

        if (!parent.exists() && !parent.mkdirs()) {
            return false
        }

        file.inputStream().use { input ->
            imageFile.outputStream().use { output ->
                input.copyTo(output)
            }
        }

        MediaScannerConnection.scanFile(
            this, arrayOf(imageFile.absolutePath), arrayOf(
                MimeTypeMap.getSingleton().getMimeTypeFromExtension(
                    MimeTypeMap.getFileExtensionFromUrl(fileName)
                )
            )
        ) { _, _ ->

        }
        return true
    }

    val values = ContentValues().apply {
        put(MediaStore.MediaColumns.DISPLAY_NAME, fileName)
        put(
            MediaStore.MediaColumns.MIME_TYPE,
            MimeTypeMap.getSingleton().getMimeTypeFromExtension(MimeTypeMap.getFileExtensionFromUrl(fileName))
        )
        put(MediaStore.MediaColumns.RELATIVE_PATH, "${Environment.DIRECTORY_PICTURES}/Yande")
    }

    var uri: Uri? = null
    return try {
        uri = contentResolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, values)
        contentResolver.openOutputStream(uri!!)?.use { output ->
            file.inputStream().use { input ->
                input.copyTo(output)
            }
        }
        true
    } catch (e: Exception) {
        uri?.let { contentResolver.delete(it, null, null) }
        false
    }
}


fun Context.imageIsExist(fileName: String, fileSize: Long?): Boolean {
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) {

        val dir = File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES), "Yande")
        val file = File(dir.absolutePath, fileName)
        val sizeCmp = fileSize?.let { file.length() == it }
        return sizeCmp ?: true && dir.exists() && file.exists()
    }

    val where = "${MediaStore.Images.Media.RELATIVE_PATH} LIKE ? AND ${MediaStore.Images.Media.DISPLAY_NAME} = ?"

    val args = arrayOf(
        "%${Environment.DIRECTORY_PICTURES}/${"Yande"}%",
        fileName,
    )

    contentResolver.query(
        MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
        arrayOf(MediaStore.Images.Media.SIZE),
        where,
        args,
        null
    )?.use { cursor ->
        if (cursor.moveToNext()) {
            val size = cursor.getLong(cursor.getColumnIndexOrThrow(MediaStore.Images.Media.SIZE))
            val sizeCmp = fileSize?.let { size == it }
            return sizeCmp ?: true
        }
    }

    return false
}
