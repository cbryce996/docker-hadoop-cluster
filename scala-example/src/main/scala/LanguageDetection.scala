import com.cybozu.labs.langdetect.{DetectorFactory, Language}
import java.io.{BufferedReader, FileReader}
import scala.collection.mutable.{Map, ArrayBuffer}

object LanguageDetectionApp extends App {

  val projectRoot = new java.io.File(".").getAbsolutePath
  val profileDirectory = s"$projectRoot/dataset/profiles"
  DetectorFactory.loadProfile(profileDirectory)

  val textFilePath = s"$projectRoot/dataset/MultiLanguageTrainDataset_Processed_Formatted.txt"
  val bufferedReader = new BufferedReader(new FileReader(textFilePath))

  val languageCounts = Map[String, Int]().withDefaultValue(0)
  var totalLines = 0

  var line: String = null
  while ({ line = bufferedReader.readLine(); line != null }) {
    if (line.trim.nonEmpty) { // Skip empty lines
      val detectedLanguage = detect(line)
      languageCounts(detectedLanguage) += 1
      totalLines += 1
    }
  }

  bufferedReader.close()

  println(s"Total Entries: $totalLines")
  languageCounts.foreach { case (language, count) =>
    val percentage = (count.toDouble / totalLines) * 100
    println(s"Language: $language, Count: $count, Percentage: $percentage%")
  }

  def detect(text: String): String = {
    try {
      val detector = DetectorFactory.create()
      detector.append(text)
      detector.detect()
    } catch {
      case _: Exception => "Unknown"
    }
  }
}