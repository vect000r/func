package org.func.ex3

import cask.MainRoutes
import upickle.core.BufferedValue.False


object Main extends cask.MainRoutes:
  override def host = "0.0.0.0"
  override def port = 8080

  @cask.postJson("/tail")
  def performTail(inputList: List[Int]): ujson.Obj = {
    val list = DoublyLinkedList.fromList(inputList)

    ujson.Obj(
      "Input" -> inputList,
      "Result of performing tail on input list" -> list.get_tail().toList()
    )
  }

  @cask.postJson("/drop")
  def performDrop(inputList: List[Int], n: Int): ujson.Obj = {
    val list = DoublyLinkedList.fromList(inputList)

    ujson.Obj(
      "Input" -> inputList,
      "n" -> n,
      "Result of performing drop on input list" -> list.drop(n).toList()
    )
  }

  @cask.postJson("/dropWhile")
  def performDropWhile(inputList: List[Int], condition: String): ujson.Obj = {
    val list = DoublyLinkedList.fromList(inputList)
    val predicate = parseCondition(condition)

    ujson.Obj(
      "Input" -> inputList,
      "Condition" -> condition,
      "Result of performing dropWhile on input list" -> list.dropWhile(predicate).toList()
    )
  }

  @cask.postJson("/foldLeft")
  def performFoldLeft(inputList: List[Int]): ujson.Obj = {
    val list = DoublyLinkedList.fromList(inputList)

    ujson.Obj(
      "Input" -> inputList,
      "Sum" -> DoublyLinkedList.sum(list),
      "Product" -> DoublyLinkedList.product(list),
      "Length" -> DoublyLinkedList.length(list)
    )
  }

  @cask.postJson("/concatenate")
  def performConcatenate(inputList1: List[Int], inputList2: List[Int]): ujson.Obj = {
    val list1 = DoublyLinkedList.fromList(inputList1)
    val list2 = DoublyLinkedList.fromList(inputList2)

    val result = list1.concatenate(list2)

    ujson.Obj(
      "Input list 1" -> inputList1,
      "Input list 2" -> inputList2,
      "Result of concatenating lists" -> result.toList()
    )
  }
  
  private def parseCondition(condition: String): Int => Boolean = {
    val parts = condition.trim.split(" ")

    if (parts.length != 2) {
      throw new IllegalArgumentException(s"Invalid condition format: $condition. Expected format: '< 5' or '> 3'")
    }

    val operator = parts(0)
    val value = parts(1).toInt

    operator match {
      case "<" => (x: Int) => x < value
      case ">" => (x: Int) => x > value
      case "<=" => (x: Int) => x <= value
      case ">=" => (x: Int) => x >= value
      case "==" => (x: Int) => x == value
      case "!=" => (x: Int) => x != value
      case _ => throw new IllegalArgumentException(s"Unknown operator: $operator")
    }
  }

  initialize()