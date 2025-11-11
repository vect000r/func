package org.func.ex3

import scala.collection.mutable.ListBuffer

case class Node[A](element: A, var next: Option[Node[A]], var prev: Option[Node[A]])

class DoublyLinkedList[A] {
  private var head: Option[Node[A]] = None
  private var tail: Option[Node[A]] = None  

  def get_tail(): DoublyLinkedList[A] = {
    val newHead = head match {
      case Some(node) =>
        node.next.foreach(_.prev = None)
        node.next
      case None => None
    }

    val result = new DoublyLinkedList[A]
    result.head = newHead
    result.tail = if (newHead.isEmpty) None else this.tail
    result
  }

  def drop(n: Int): DoublyLinkedList[A] = {
    var current = head
    var count = 0

    while (count < n && current.isDefined) {
      current = current.get.next
      count += 1
    }
    
    current.foreach(_.prev = None)

    val result = new DoublyLinkedList[A]
    result.head = current
    result.tail = if (current.isEmpty) None else this.tail
    result
  }

  def dropWhile(predicate: A => Boolean): DoublyLinkedList[A] = {
    var current = head

    while (current.isDefined && predicate(current.get.element)) {
      current = current.get.next
    }
    
    current.foreach(_.prev = None)

    val result = new DoublyLinkedList[A]
    result.head = current
    result.tail = if (current.isEmpty) None else this.tail
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

  def foldLeft[B](z: B)(f: (B, A) => B): B = {
    var current = head
    var accumulator = z

    while (current.isDefined) {
      val node = current.get
      accumulator = f(accumulator, node.element)
      current = node.next
    }

    accumulator
  }
}




object DoublyLinkedList {
  def fromList[A](list: List[A]): DoublyLinkedList[A] = {
    val result = new DoublyLinkedList[A]

    if (list.isEmpty) return result
    
    val firstNode = Node(list.head, None, None)
    result.head = Some(firstNode)

    var currentNode = firstNode
    
    for (element <- list.tail) {
      val newNode = Node(element, None, Some(currentNode))
      currentNode.next = Some(newNode)
      currentNode = newNode
    }

    result.tail = Some(currentNode)
    result
  }

  def sum(list: DoublyLinkedList[Int]): Int = {
    list.foldLeft(0)((acc, elem) => acc + elem)
  }

  def product(list: DoublyLinkedList[Int]): Int = {
    list.foldLeft(1)((acc, elem) => acc * elem)
  }

  def length[A](list: DoublyLinkedList[A]): Int = {
    list.foldLeft(0)((acc, _) => acc + 1)
  }


}