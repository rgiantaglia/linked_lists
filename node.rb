class Node

    attr_accessor :value, :next_node

    @@num_of_nodes = 0

    def initialize(value=nil, next_node=nil)
        @value = value
        @next_node = next_node
        @@num_of_nodes += 1
    end

    def self.total_number_of_nodes
        @@num_of_nodes
    end

end