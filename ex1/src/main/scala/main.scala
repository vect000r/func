package org.func.ex1

import cask.MainRoutes


object Main extends cask.MainRoutes:

  @cask.postJson("/input")
  def dataEndpoint(nums: List[Int]): String =
    "Nums: " + nums.toString
  


  initialize()