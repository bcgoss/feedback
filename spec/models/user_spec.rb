require 'rails_helper'

RSpec.describe User, type: :model do
  it { should define_enum_for(:role) }
end
