class Movement < ActiveRecord::Base
  belongs_to :position, :class_name => "Transaction"
end
