package org.func.ex3

import scala.collection.mutable.ListBuffer

case class Node[A](element: A, var next: Option[Node[A]])

class LinkedList[A] {
  private var head: Option[Node[A]] = None

  def tail(): LinkedList[A] = {
    val newHead = head match {
      case Some(node) => node.next
      case None => None
    }

    val result = new LinkedList[A]
    result.head = newHead
    result
  }

  def toList(): List[A] = {
    var current = head
    val result = ListBuffer[A]()

    while (current.isDefined) {
      val node = current.get
      result.append(node.element)
      current = node.next
    }

    result.toList
  }
}

object LinkedList {
  def fromList[A](list: List[A]): LinkedList[A] = {
    val result = new LinkedList[A]

    if (list.isEmpty) return result

    for (element <- list.reverse) {
      val newNode = Node(element, result.head)
      result.head = Some(newNode)
    }

    result
  }
}