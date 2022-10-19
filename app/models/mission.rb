class Mission < ApplicationRecord
    belongs_to :planet
    belongs_to :scientist

    # must have a name, a scientist and a planet
    validates :name, presence: true
    validates :scientist, presence: true
    validates :planet, presence: true

    # a scientist cannot join the same mission twice
    validates :scientist, uniqueness: { scope: :name }
end
