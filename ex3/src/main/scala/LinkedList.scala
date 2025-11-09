package org.func.ex3

class LinkedList[A] {
  private class Node(val element: A, var next: Option[Node])
  private var head: Option[Node] = None

  def tail(): LinkedList[A] = {
    val newHead = head match {
      case Some(node) => node.next
      case None => None
    }

    val result = new LinkedList[A]
    result.head = newHead
    result
  }
}
