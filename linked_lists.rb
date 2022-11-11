require_relative "node"

class LinkedList
    attr_accessor :next_node

    def initialize
        @head = nil
    end
    
    def append(value) 
        
        if @head.nil?
            @head = Node.new(value)
            # head
        else
            current_node = @head
            @next_node = Node.new(value)          

            while current_node.next_node != nil
                current_node = current_node.next_node
            end
            current_node.next_node = next_node           
        end
       
    end

    def prepend(value)
        if @head.nil?
            @head = Node.new(value)
        else
            next_node = Node.new(value)
            next_node.next_node = @head
            @head = next_node
        end
    end

    def size
        p Node.total_number_of_nodes
    end

    def head
        puts "The first node is:"
        p @head
    end

    def tail
        current_node = @head
        loop do
            break if current_node.next_node.nil?
            current_node = current_node.next_node
        end
        p current_node
    end

    def at(index)
        count = 0
        current_node = @head
        loop do
          break if count == index || current_node.nil?
          current_node = current_node.next_node
          count += 1
        end
        p current_node
    end

    def pop
        n = size-1
        p @head
        at(n-1).next_node = nil
        p @head
    end

    def contains?(value)
        current_node = @head
        loop do
            if current_node.value == value
                return true
            elsif current_node.next_node.nil?
                puts "No node has this value"
                return
            else
            current_node = current_node.next_node
            end
        end
    end

    def find(value)
        current_node = @head
        index = 0
        if contains?(value)
            loop do
                break if current_node.value == value
                current_node = current_node.next_node
                index += 1
            end
            puts "The index is #{index} and the current node is #{current_node} with value #{current_node.value}"
        end        
    end

    def to_s
        current_node = @head
        arr = []
        loop do
            break if current_node.nil?
            arr << "( #{current_node.value} ) -> "
            current_node = current_node.next_node
        end
        arr << "nil"
        puts arr.join()
    end

end

t = LinkedList.new

t.append(1)
t.append(2)
t.append(3)
t.append(4)
t.append(5)
t.append(6)
t.size
t.tail
t.at(4)
t.pop
t.contains?(10)
t.find(1)
t.to_s


s = LinkedList.new
s.prepend(1)
s.prepend(2)
s.prepend(3)
s.prepend(4)
s.head
