class Apple < ActiveRecord::Base
  simple_cache :cached_value, :some_method

  def some_method
    self.variable_value
  end
end

class TestSimpleCache < Test::Unit::TestCase
  def setup
    ::ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
    ::ActiveRecord::Schema.define(:version => 1) do
      create_table :apples do |t|
        t.column :variable_value, :integer
        t.column :cached_value, :integer
        t.column :name, :string
      end
    end
  end
  
  context "after creating an object" do
    setup do
      @fruit = Apple.create(:variable_value => 200)
    end

    should "update the specified field with the return value of the method" do
      assert_equal(200, @fruit.cached_value)
    end

    context "after manually updating the object" do
      setup do
        @fruit.variable_value = 1
        @fruit.save!
      end

      should "update the value too" do
        assert_equal(1, @fruit.cached_value)
      end
    end

    context "after using update_attribute on some other field" do
      setup do
        @fruit.variable_value = 300
        @fruit.update_attribute(:name, 'With something else')
      end

      should "update the value too" do
        assert_equal(300, @fruit.cached_value)
      end
    end
  end
end