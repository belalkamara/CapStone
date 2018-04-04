class Activity < ApplicationRecord
  enum status: { draft: 0, published: 1, ended: 2 }
end
