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



  initialize()