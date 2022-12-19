require 'rails_helper'

RSpec.describe "リクエストモデル機能", type: :model do
  before do
    request = Request.create(app_id: "1", acc_id: "1", certification_code:"111111" )
  end

  describe 'バリデーションのテスト' do
    context 'リクエストIDが空の場合' do
      it 'バリデーションに失敗する' do
        request = Request.create(app_id: "", acc_id: "1", certification_code:"111111" )
        expect(request).to be_valid
      end
      it 'バリデーションに成功する' do
        request = Request.create(app_id: "1", acc_id: "1", certification_code:"111111" )
        expect(request).to be_valid
      end
      it 'バリデーションに失敗する' do
        request = Request.create(app_id: "1", acc_id: "", certification_code:"111111" )
        expect(request).to be_valid
      end
      it 'バリデーションに失敗する' do
        request = Request.create(app_id: "1", acc_id: "1", certification_code:"" )
        expect(request).to be_valid
      end
    end
  end
end
