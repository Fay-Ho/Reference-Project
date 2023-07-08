package xyz.fay.reference.utils

import android.content.Context
import java.io.BufferedReader
import java.io.InputStreamReader

class AssetProvider {
    companion object {
        private const val mock = "mock"

        fun loadFile(context: Context, fileName: String): String {
            val manager = context.assets
            val inputStream = manager.open(fileName)
            val inputStreamReader = InputStreamReader(inputStream)
            val bufferedReader = BufferedReader(inputStreamReader)
            val data = bufferedReader.use { it.readText() }
            bufferedReader.close()
            inputStreamReader.close()
            inputStream.close()
            return data
        }

        fun loadJsonFile(context: Context, fileName: String) =
            loadFile(context, "$mock/$fileName")
//            loadFile(context, "${mock}/${fileName}")
    }
}
