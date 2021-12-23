require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'バリデーション' do
    subject { like.valid? }

    context 'データが条件を満たすとき' do
      let(:like) { build(:like) }
      it '保存できる' do
        expect(subject).to eq true
      end
    end
end
end