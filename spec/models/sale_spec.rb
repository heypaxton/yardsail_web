require 'spec_helper' 

describe Sale do

  context 'when creating a new sale' do
    it { should validate_presence_of :address     }
    it { should validate_presence_of :city        }
    it { should validate_presence_of :state       }
    it { should validate_presence_of :zip         }
    it { should validate_presence_of :sale_type   }
    it { should validate_presence_of :description }
    it { should ensure_length_of(:description).is_at_least(15) }
  end
end
