object YourClassName {
  def main(args: Array[String]): Unit = {
    hello()
  }

  def hello(): Unit = {
    println("Hello world!")
    println(msg)
  }

  def msg: String = "I was compiled by Scala 2. :)"
}
