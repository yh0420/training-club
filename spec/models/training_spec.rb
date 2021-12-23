require 'rails_helper'

RSpec.describe Training, type: :model do
  describe "バリデーション" do
    subject { training.valid? }
    context "データが条件を満たすとき" do
      let(:training) { build(:training) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end
    context "name が空のとき" do
      let(:training) { build(:training, name: '') }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(training.errors.messages[:name]).to include 'を入力してください'
      end
    end
    context "name が31文字以上のとき" do
      let(:training) { build(:training, name: 'a' * 31) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(training.errors.messages[:name]).to include 'は30文字以内で入力してください'
      end
    end
  end
end