package org.func.ex5

import cask.MainRoutes
import upickle.core.BufferedValue.False


object Main extends cask.MainRoutes:
  override def host = "0.0.0.0"
  override def port = 8080



  initialize()