class SocksLaundering
    attr_reader :capacity, :clean, :dirty
    
    def initialize(capacity, clean, dirty)
      @capacity = capacity
      @clean = clean
      @dirty = dirty
      @clean_pairs = 0
    end

    def findPairs
      findPairsOfCleanSocks
      findPairsWithOneDirtySock
      findPairsOfDirtySocks

      return @clean_pairs
    end

    def findPairsOfCleanSocks
      clean_socks_by_color = group_socks(@clean) 
      #Iterates hash detecting pairs and deleting them from array
      clean_socks_by_color.each{ |color, freq|
        if freq % 2 == 0
          @clean_pairs += freq / 2
          @clean.delete(color)
        elsif freq > 2
          @clean_pairs += freq / 2
          @clean.delete(color) 
          @clean.push(color) #pushes the odd sock remaining to the clean array so it can be matched later
        end
      }
    end

    def findPairsWithOneDirtySock
      @clean.each{ | clean_sock |
      @dirty.each{ | dirty_sock |
        if clean_sock == dirty_sock
          @clean_pairs += 1
          @dirty.delete_at(@dirty.index(dirty_sock)) #deletes matched dirty sock to avoid repeats
          @capacity -= 1
          if @capacity == 0
            return
          next #goes to next loop iteration to avoid matching the same clean sock several times
          end
        end
      }
    }
    end

    def findPairsOfDirtySocks
        dirty_socks_by_color = group_socks(@dirty)
        dirty_socks_by_color.each{ |color, freq|
        while freq >= 2 && @capacity >= 2 do
          @clean_pairs += 1
          freq -=2
          @capacity -= 2
        end
        }
    end

    def group_socks(socks)
      return socks.group_by(&:itself).transform_values{ |v| v.size }
    end
  
end