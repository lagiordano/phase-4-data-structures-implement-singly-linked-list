require_relative './node'

class LinkedList
    attr_accessor :head

    def initialize
        @head = nil
    end

    def prepend(node)
        node.next_node = head
        self.head = node
    end

    def append(node)
        if head.nil?
            self.head = node
            return 
        end

        last_node = head
        while last_node.next_node
            last_node = last_node.next_node
        end

        last_node.next_node = node
    end

    def delete_head
        self.head = self.head.next_node unless !head
    end

    def delete_tail 
        return delete_head if !head || head.next_node.nil?
        current_node = head 
        previous_node = nil 
        while current_node.next_node
            previous_node = current_node
            current_node = current_node.next_node
        end
        previous_node.next_node = nil
    end

    def add_after(index, node)
        i = 0 
        current_node = head 
        until i == index
            current_node = current_node.next_node
            i += 1 
        end
        if current_node
            node.next_node = current_node.next_node
            current_node.next_node = node
        else 
            append(node)
        end
    end

    def search(value)
        current_node = head
        until current_node.data == value
            current_node = current_node.next_node 
        end
        current_node
    end

  
end

