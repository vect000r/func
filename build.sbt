ThisBuild / scalaVersion := "3.7.3"

lazy val root = (project in file("."))
  .aggregate(ex1, ex3)
  .settings(
    name := "func"
  )

lazy val ex1 = (project in file("ex1"))
  .settings(
    name := "ex1",
  )

// Ex3 module
lazy val ex3 = (project in file("ex3"))
  .settings(
    name := "ex3",
  )