#
# Used to create one of "everything", where everything includes objects that can be instantiated
# with no arguments
#
module KitchenSink
  Version = '0.0.3'

  class KitchenSinkError < StandardError #:nodoc
  end

  # Returns one of each object instantiated with it's default value
  def everything
    objects = []
    ObjectSpace.each_object(Class) do |c|
      if c.methods.include?('new')
        begin
          m = c.method(:new)
          o = m.call if m.arity == -1
          objects.push(o)
        rescue ArgumentError, ThreadError, TypeError
        end
      end
    end
    objects
  end
  
  # Returns one of everything except the type specified (as a class)
  # +klass+
  def everything_but(klass)
    begin
      unless klass.is_a?(Class)
        raise KitchenSinkError , "#{klass} isn't a Class"
      end
      rescue NoMethodError
      raise KitchenSinkError, "#{klass} isn't a Class"
    end
    objects = everything
    objects.delete_if do |o|
      o.kind_of?(klass)
    end
  end
  
  # Returns one of everything that cannot respond to the method
  # +method+
  def everything_that_cannot(method)
    objects = everything
    objects.delete_if do |o|
      o.respond_to?(method)
    end
  end
  
  # Returns one of everything that cannot be coereced into a specified class
  # +klass+
  def everything_that_cannot_be_coerced_into(klass)
    objects = everything
    objects.delete_if do |o|
      begin
        klass.new(o)
      rescue
      end
    end
  end
  alias everything_that_aint everything_that_cannot_be_coerced_into
  
  # Returns an array of common edge cases for a specified class
  # +klass+
  def edge_cases_for(klass)
    objects = []
    case
    when klass == String
     objects = %w[ "", " ", "\", "'", "`"]
    when klass == Array
      objects = [[], [1], [""], [0], [10000000000], [Class]]      
    when klass == Hash
      objects = [{1 => nil}, {2=>[]}, {3 => "a"}, {4 => 0}, {}]
    end
    return objects
  end
end