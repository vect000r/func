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

  @cask.postJson("/drop")
  def performDrop(inputList: List[Int], n: Int): ujson.Obj = {
    val list = LinkedList.fromList(inputList)

    ujson.Obj(
      "Input" -> inputList,
      "n" -> n,
      "Result of performing drop on input list" -> list.drop(n).toList()
    )
  }
  
  @cask.postJson("/dropWhile")
  def performDropWhile(inputList: List[Int], n: Int, condition: String): ujson.Obj = {
    // TODO
    ???
  } 
  
  @cask.postJson("/foldLeft")
  def performDropLeft(inputList: List[Int]): ujson.Obj = {
    // TODO
    ???
  }
  
  @cask.postJson("/concatenate")
  def performConcatenate(inputList1: List[Int], inputList2: List[Int]): ujson.Obj = {
    // TODO
    ???
  }

  initialize()