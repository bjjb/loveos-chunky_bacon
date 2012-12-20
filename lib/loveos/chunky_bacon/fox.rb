module LoveOS
  module ChunkyBacon
    class Fox
      def self.breeds
        @breeds ||= []
      end

      def self.inherited(klass)
        breeds << klass
      end

      def self.random
        breed = breeds.shuffle.first || self
        breed.new
      end

      def bequeath
        "chunky bacon"
      end

      class Tall < self
        def bequeath
          super.upcase
        end
      end

      class Small < self
        def bequeath
          super.split.map(&:capitalize).join(' ')
        end
      end

    end
  end
end
