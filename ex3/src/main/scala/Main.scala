package org.func.ex1

import cask.MainRoutes
import upickle.core.BufferedValue.False


object Main extends cask.MainRoutes:
  override def host = "0.0.0.0"
  override def port = 8080

  @cask.getJson("/greeting")
  def greeting(): ujson.Obj =
    ujson.Obj(
      "greeting" -> "Hi!"
    )
  
  
  
  
  
  
  initialize()