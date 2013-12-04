require 'spec_helper'

describe Todo do
  it { should validate_presence_of :name }
  it { should validate_presence_of :creator_user_id }

end
