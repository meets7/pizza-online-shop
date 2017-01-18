class Item < ActiveRecord::Base
    self.table_name = 'item'

    self.inheritance_column = :ruby_type
end
