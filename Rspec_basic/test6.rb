describe User do
  describe '#greet' do
    before do
      @params = { name: 'たろう'}
    end
    context '12歳以下の場合' do
      it 'ひらがなで答えること' do
         user = User.new(@params.merge(age: 12))
         expect(user.greet).to eq 'ぼくはたろうだよ'
      end
    end
    context '13歳以上の場合' do
      it '漢字で答えること' do
         user = User.new(@params.merge(age: 13))
         expect(user.greet).to eq '僕はたろうです'
      end
    end
  end
end
