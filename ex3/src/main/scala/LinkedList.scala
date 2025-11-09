package org.func.ex3

import scala.collection.mutable.ListBuffer

class LinkedList[A] {
  private class Node(val element: A, var next: Option[Node])
  private var head: Option[Node] = None

  def tail(): LinkedList[A] = {
    val newHead = head match {
      case Some(node) => node.next
      case None => None
    }

    var result = new LinkedList[A]
    result.head = newHead
    result
  }

  def toList(): List[A] = {
    var current = head
    var result = ListBuffer[A]()

    while (current != None) {
      current match {
        case Some(node) => {
          result.append(node.element)
          current = node.next
        }
      }
    }

    result.toList
  }


}
