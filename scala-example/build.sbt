val scala3Version = "3.3.1"

lazy val root = project
  .in(file("."))
  .settings(
    name := "LanguageDetection",

    scalaVersion := scala3Version,

    libraryDependencies += "net.arnx" % "jsonic" % "1.3.10",
    libraryDependencies += "com.opencsv" % "opencsv" % "5.5"

  )
