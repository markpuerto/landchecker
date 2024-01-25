# == Schema Information
#
# Table name: vic_lgas
#
#  id         :bigint           not null, primary key
#  pfi        :string
#  lga_code   :string
#  lga_name   :string
#  gaz_lga    :string
#  gazregn    :string
#  abslgacode :string
#  pfi_cr     :date
#  ufi        :integer
#  ufi_cr     :date
#  ufi_old    :integer
#  geom       :geometry         geometry, 0
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe VicLga, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
