package org.func.ex1

import cask.MainRoutes
import upickle.core.BufferedValue.False


object Main extends cask.MainRoutes:

  val sortOrder: (Int, Int) => Boolean = (x: Int, y: Int) => x > y

  @cask.postJson("/is-sorted")
  def checkSorted(nums: List[Int]): ujson.Obj =
    val sorted = isSorted(nums, sortOrder)
    ujson.Obj(
      "input" -> nums,
      "isSorted" -> sorted,
    )

  def isSorted(input: List[Int], function: (Int, Int) => Boolean ): Boolean = {
    val pairs = input.sliding(2).map {
      case List(x, y) => (x, y)
    }.toList

    pairs.forall {
      case (first, second) => function(first, second)
    }
  }

  @cask.postJson("/sum-three")
  def sumThree(list1: List[Int], list2: List[Int], list3: List[Int]): ujson.Obj = {
    def f(a: List[Int], b: List[Int]): List[Int] = {
      for ((a, b) <- a.zip(b)) yield a + b
    }
    
    ujson.Obj(
      "input" -> ujson.Arr(list1, list2, list3),
      "sum" -> ujson.Arr(f(f(list1, list2), list3))
    )
  }

  @cask.postJson("/set-head")
  def setHead(list: List[Int], element: Int): ujson.Obj ={
    //TODO
    ???
  }

  @cask.postJson("/append")
  def append(list: List[Int], index: Int): ujson.Obj = {
    //TODO
    ???
  }

  @cask.postJson("/two-square")
  def twoSquare(list1: List[Int], list2: List[Int]): ujson.Obj = {
    //TODO
    ???
  }

  initialize()