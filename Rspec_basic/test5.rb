class User
  def initialize(name:, age:)
     @name = name
     @age  = age
  end
  def greet
    if @age <= 12
       "ぼくは#{@name}だよ"
    else
       "僕は#{@name}です"
    end
  end
end

describe User do
  describe '#greet' do
   context '12歳以下の場合' do
     it 'ひらがなで書くこと' do
        user = User.new(name: 'たろう', age: 12)
        expect(user.greet).to eq 'ぼくはたろうだよ'
        #(user.greet).should eq 'aaaぼくはたろうだよ'
     end
   end
    context '13歳以上の場合' do
     it '漢字で答えること' do
        user = User.new(name: 'たろう', age: 13)
        expect(user.greet).to eq '僕はたろうです'
     end
    end
  end
end

