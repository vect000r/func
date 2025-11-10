package org.func.ex3

import cask.MainRoutes
import upickle.core.BufferedValue.False


object Main extends cask.MainRoutes:
  override def host = "0.0.0.0"
  override def port = 8080

  @cask.postJson("/tail")
  def performTail(inputList: List[Int]): ujson.Obj = {
    val list = LinkedList.fromList(inputList)

    ujson.Obj(
      "Input" -> inputList,
      "Result of performing tail on input list" -> list.tail().toList()
    )
  }


  initialize()