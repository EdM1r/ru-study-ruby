module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = array[0]
        array.each do |elem|
          max_value = elem if elem > max_value
        end
        result = []
        array.each do |elem|
          result << if elem.positive?
                      max_value
                    else
                      elem
                    end
        end
        result
      end

      def search(array, query)
        return -1 if array.empty?

        mid = array.length / 2
        if array[mid] == query
          mid
        elsif array[mid] > query
          if mid.positive?
            search(array.take(mid), query)
          else
            -1
          end
        elsif mid < array.length - 1
          subs = search(array.drop(mid + 1), query)
          subs.negative? ? -1 : (mid + 1) + subs
        else
          -1
        end
      end
    end
  end
end
