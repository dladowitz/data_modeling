require 'rails_helper'

describe Chapter do
  it { should validate_presence_of :number }
  it { should belong_to :book }
end
