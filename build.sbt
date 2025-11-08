ThisBuild / version := "0.1.0-SNAPSHOT"
ThisBuild / scalaVersion := "3.7.3"

lazy val commonSettings = Seq(
  libraryDependencies ++= Seq(
    "com.lihaoyi" %% "cask" % "0.9.7"
  ),
  assembly / assemblyMergeStrategy := {
    case PathList("META-INF", "services", xs @ _*) => MergeStrategy.concat
    case PathList("META-INF", "MANIFEST.MF") => MergeStrategy.discard
    case PathList("META-INF", xs @ _*) => MergeStrategy.discard
    case "reference.conf" => MergeStrategy.concat
    case "application.conf" => MergeStrategy.concat
    case x => MergeStrategy.first
  }
)

lazy val root = (project in file("."))
  .aggregate(ex1, ex3)
  .settings(name := "func-exercises")

lazy val ex1 = (project in file("ex1"))
  .settings(commonSettings)
  .settings(name := "ex1")

lazy val ex3 = (project in file("ex3"))
  .settings(commonSettings)
  .settings(name := "ex3")