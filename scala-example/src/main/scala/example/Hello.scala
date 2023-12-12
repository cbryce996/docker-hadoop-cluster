import org.apache.spark.sql.{SparkSession, SaveMode}
import org.apache.hadoop.fs.{FileSystem, Path}

object Main {
  def main(args: Array[String]): Unit = {
    val spark = SparkSession.builder
      .appName("LanguageDetection")
      .master("yarn")
      .getOrCreate()

    val dataPath = "/user/spark/task2/data.txt"
    val englishPath = "/user/spark/task2/english.txt"
    val frenchPath = "/user/spark/task2/french.txt"
    val germanPath = "/user/spark/task2/german.txt"

    // Load language RDDs (replace these with your actual RDDs)
    val dataRDD = spark.sparkContext.textFile(dataPath)
    val englishRDD = spark.sparkContext.textFile(englishPath)
    val frenchRDD = spark.sparkContext.textFile(frenchPath)
    val germanRDD = spark.sparkContext.textFile(germanPath)

    // Preprocess text (replace this with your actual preprocessing logic)
    val dataProcessedRDD = dataRDD.flatMap(line => line.split("\\s+"))
    val englishProcessedRDD = englishRDD.flatMap(line => line.split("\\s+")).distinct()
    val frenchProcessedRDD = frenchRDD.flatMap(line => line.split("\\s+")).distinct()
    val germanProcessedRDD = germanRDD.flatMap(line => line.split("\\s+")).distinct()
    
    val languageScores = Seq(
      ("English", dataProcessedRDD.intersection(englishProcessedRDD).count()),
      ("French", dataProcessedRDD.intersection(frenchProcessedRDD).count()),
      ("German", dataProcessedRDD.intersection(germanProcessedRDD).count())
    )

    // Find the language with the maximum common words
    val detectedLanguage = languageScores.maxBy(_._2)._1

    val fs = FileSystem.get(spark.sparkContext.hadoopConfiguration)
    val outputPathForLanguage = new Path("/user/spark/task2/output")
    fs.create(outputPathForLanguage).close()

    // Append data to the file
    val outputWriter = fs.append(outputPathForLanguage)

    // Save word counts for each language
    languageScores.foreach { case (langName, count) =>
      outputWriter.writeChars(s"$langName Word Count: $count\n")
    }

    // Close the writer
    outputWriter.close()

    // Stop the SparkSession
    spark.stop()
  }
}