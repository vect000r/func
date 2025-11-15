package org.func.ex4

import cask.MainRoutes
import upickle.core.BufferedValue.False


object Main extends cask.MainRoutes:
  override def host = "0.0.0.0"
  override def port = 8080

  @cask.postJson("/append")
  def append(list: List[Int], index: Int): ujson.Obj = {
    // TODO
    ???
  }

  @cask.postJson("/variation")
  def variation(list: List[Int]): ujson.Obj = {
    // TODO
    ???
  }

  @cask.postJson("/concat")
  def concat(list1: List[Int], list2: List[Int]): ujson.Obj = {
    // TODO
    ???
  }
  
  @cask.post("/map")
  def map(list: List[Int]): ujson.Obj = {
    // TODO
    ???
  }
  
  @cask.postJson("/mean")
  def mean(list: List[Int]): ujson.Obj = {
    // TODO
    ???
  }
  
  initialize()