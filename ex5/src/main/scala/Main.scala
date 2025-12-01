package org.func.ex5

import cask.MainRoutes
import ujson.Arr.from
import upickle.core.BufferedValue.False


object Main extends cask.MainRoutes:
  override def host = "0.0.0.0"
  override def port = 8080

  @cask.postJson("/dict")
  def getDict(list: List[Int]): ujson.Obj = {
    val counts = list.groupMapReduce(identity)(_ => 1)(_ + _)

    ujson.Obj(
      "counts" -> ujson.Obj(
        "input" -> list,
        "counts" -> counts.map { case (k, v) => (k.toString, v) }
      )
    )
  }

  @cask.postJson("/dict3")
  def getDict3(list: List[Int]): ujson.Obj = {
    val cubes = list.map(num => num * num * num) 
    val pairs = list.zip(cubes) 

    ujson.Obj.from(
      pairs.map { case (original, cube) =>
        original.toString -> ujson.Num(cube)
      }
    )
  }
  
  @cask.postJson("/dictStudent")
  def getDictStudent(list: List[Int]): ujson.Obj = {
    // TODO
    ???
  }

  @cask.postJson("/dictVector")
  def getDictVector(list: List[Int]): ujson.Obj = {
    // TODO
    ???
  }

  @cask.postJson("/dictGrades")
  def getDictGrades(indices: List[Int], grades: List[Int]): ujson.Obj = {
    // TODO
    ???
  }

  initialize()