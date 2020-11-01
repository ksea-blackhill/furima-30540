require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    @form = FactoryBot.build(:form)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいく時' do
      it '入力項目が全て存在すれば登録できる' do
        expect(@form).to be_valid
      end
      it 'buildingは空でも登録できる' do
        @form.building = ''
        expect(@form).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it 'tokenが空だと登録できない' do
        @form.token = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと登録できない' do
        @form.postal_code = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeは半角数字を入力しても - を含めないと登録できない' do
        @form.postal_code = '5660000'
        @form.valid?
        expect(@form.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeが - を含めた半角数字でないと登録できない' do
        @form.postal_code = '５６６-００００'
        @form.valid?
        expect(@form.errors.full_messages).to include('Postal code is invalid')
      end

      it 'area_idが --- のままだと登録できない' do
        @form.area_id = 1
        @form.valid?
        expect(@form.errors.full_messages).to include('Area must be other than 1')
      end
      it 'municipalityが空だと登録できない' do
        @form.municipality = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'banchiが空だと登録できない' do
        @form.banchi = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Banchi can't be blank")
      end
      it 'telが空だと登録できない' do
        @form.tel = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telが半角数字以外だと登録できない' do
        @form.tel = '０９０１２３４５６７８'
        @form.valid?
        expect(@form.errors.full_messages).to include('Tel is invalid')
      end
      it 'telは半角数字でも10桁（固定電話）、もしくは11桁（携帯電話）でないと登録できない' do
        @form.tel = '0900000'
        @form.valid?
        expect(@form.errors.full_messages).to include('Tel is invalid')
      end
    end
  end
end
