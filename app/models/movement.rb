class Movement < ActiveRecord::Base
  belongs_to :position, :foreign_key => 'transaction_id', :class_name => "Transaction"
end
