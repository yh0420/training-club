require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    subject { user.valid? }
    context 'データが条件を満たすとき' do
      let(:user) { build(:user) }
      it '保存できる' do
        expect(subject).to eq true
      end
    end
    context 'name が空のとき' do
      let(:user) { build(:user, name: '') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(user.errors.messages[:name]).to include 'を入力してください'
      end
    end
    context 'name が31文字以上のとき' do
      let(:user) { build(:user, name: 'a' * 31) }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(user.errors.messages[:name]).to include 'は30文字以内で入力してください'
      end
    end
    context 'objective が空のとき' do
      let(:user) { build(:user, objective: '') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(user.errors.messages[:objective]).to include 'を入力してください'
      end
    end
    context 'objective が141以上のとき' do
      let(:user) { build(:user, objective: 'a' * 141) }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(user.errors.messages[:objective]).to include 'は140文字以内で入力してください'
      end
    end
    context 'email が空のとき' do
      let(:user) { build(:user, email: '') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include 'を入力してください'
      end
    end
    context 'email がすでに存在するとき' do
      before { create(:user, email: 'test@example.com') }
      let(:user) { build(:user, email: 'test@example.com') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include 'はすでに存在します'
      end
    end
    context 'email が アルファベット･英数字 のみのとき' do
      let(:user) { build(:user, email: Faker::Lorem.characters(number: 16)) }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include 'は不正な値です'
      end
    end

    context 'パスワードが空のとき' do
      let(:user) { build(:user, password: '') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(user.errors.messages[:password]).to include 'を入力してください'
      end
    end

    context 'パスワードが5文字以下のとき' do
      let(:user) { build(:user, password: '12345') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(user.errors.messages[:password]).to include 'は6文字以上で入力してください'
      end
    end

    context 'パスワードとパスワード(確認)が一致しないとき' do
      let(:user) { build(:user, password: 'password', password_confirmation: 'password1') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(user.errors.messages[:password_confirmation]).to include 'とパスワードの入力が一致しません'
      end
    end

    describe "アソシエーション" do
      subject { user.destroy }
      let(:user) { create(:user) }
      context "ユーザーが削除されたとき" do
        it "削除されたユーザーの投稿も削除される" do
          create_list(:article, 2, user: user)
          create(:article)
          expect { subject }.to change { user.article.count }.by(-2)
        end
        it "削除されたユーザーのいいねも削除される" do
          create_list(:like, 2, user: user)
          create(:like)
          expect { subject }.to change { user.likes.count }.by(-2)
        end
        it '削除されたユーザーのコメントも削除される' do
          create_list(:comment, 2, user: user)
          create(:comment)
          expect { subject }.to change { user.comments.count }.by(-2)
        end
        it '削除されたユーザーのエクササイズも削除される' do
          create_list(:training, 2, user: user)
          create(:training)
          expect { subject }.to change { user.trainings.count }.by(-2)
        end
      end
    end
  end
end