require_relative 'node'

class LinkedList
  def initialize
    @head = nil
  end

  def each
    node = @head

    while !node.nil?
      yield(node)
      node = node.next_node
    end
  end

  def prepend(info)
    @head = Node.new(info, @head)
  end

  def [](index)
    if index == 0
      return @head
    else
      node = @head
      index.times do
        unless node.nil?
          node = node.next_node
        else
          return nil
        end
      end
      return node
    end
  end

  def insert(index, info)

    if index == 0
      self.prepend(info)
    else

      prev_node = @head
      (index - 1).times do
        prev_node = prev_node.next_node
      end

      following_node = prev_node.next_node
      new_node = Node.new(info, following_node)
      prev_node.next_node = new_node
    end
  end

  def remove(index)

    if index == 0
      @head = @head.next_node
    else
      prev_node = @head
      (index - 1).times do
        prev_node = prev_node.next_node
      end
      node_to_delete = prev_node.next_node
      following_node = node_to_delete.next_node
      prev_node.next_node = following_node
    end
  end

  def to_s

    array = []
    node = @head

    while !node.nil?
      array << node.info
      node = node.next_node
    end

    values = array.join(', ') || ""

    return "LinkedList(#{values})"
  end
end
