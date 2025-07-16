class Blog < ApplicationRecord
  belongs_to :diet, optional: true
end