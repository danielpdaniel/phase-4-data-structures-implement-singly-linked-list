require_relative './node'
require "pry"

class LinkedList
    attr_accessor :head

    def initialize
        @head = nil
    end

    def prepend(node)
        if @head.nil?
            @head = node
        else
            head_copy = self.append(@head)
            @head = node
            @head.next_node = head_copy
        end
    end

    def append(node)
        if @head.nil?
            @head = node
        else
            last_node = @head
                while last_node.next_node
                    last_node = last_node.next_node
                end
            last_node.next_node = node
        end
    end

    def delete_head
        if @head.nil?
        elsif head.next_node.nil?
            @head = nil
        else
            node = @head.next_node
            @head = nil
            @head = node
        end
    end

    def delete_tail
        if head.nil?
        elsif head.next_node.nil?
            @head = nil
        else
            last_node = @head
            while last_node.next_node
                last_node = last_node.next_node
            end

            second_to_last_node = @head
            while second_to_last_node.next_node != last_node
                second_to_last_node = second_to_last_node.next_node
            end
            second_to_last_node.next_node = nil
        end
    end

    def add_after(index, node)
        if head.nil?
            @head = nil
        elsif head.next_node.nil?
            head.append(node)
        else
            i = 0
            j = 1
            selected_node = @head
            until index < j && index >= i
                i += 1
                j += 1
                if selected_node.next_node.nil?
                else
                    selected_node = selected_node.next_node
                end
            end
            selected_node.next_node = node
        end
    end

    def search(value)
        search_node = @head
        until search_node.data == value
            search_node = search_node.next_node
        end
        search_node
    end

end
