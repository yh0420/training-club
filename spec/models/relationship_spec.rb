require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe 'バリデーション' do
    subject { relationship.valid? }

    context 'データが条件を満たすとき' do
      let(:relationship) { build(:relationship) }
      it '保存できる' do
        expect(subject).to eq true
      end
    end
  end
end