require 'spec_helper'

describe Todo do
  it { should validate_presence_of :name }
  it { should validate_presence_of :creator_user_id }
  it { should validate_numericality_of(:position).is_greater_than_or_equal_to(0) }
end
