![Alt Text](https://github.com/yhidetoshi/Pictures/raw/master/Rspec_Study/rspec-icon.png)
![Alt Text](https://github.com/yhidetoshi/Pictures/raw/master/Rspec_Study/cucumber-icon.png)
#### Rspecの基本
====

**describe / it / expect**の役割
```
describe '四則演算' do
  it '1 + 1 は 2になること' do
      expect(1 + 1).to eq 2
  end
end
```

- `describe`: テストのグループ化を宣言!(イメージはここに四則演算のテストを書くよって意味)
- `it`はテストを`example`という単位にまとめる役割
- `id do ... end`の中のexpection(期待値と実際値の比較)が全てパスするとそのexampleはパスしたことになる
```
expect(X).to eq Y =>  『XがYに等しくなる事を期待する』と読む
```

- RSpec2.10以前は下記のように`should`と書いていたが、それ以降は`expect`を利用するになった。
```
(1 + 1).should eq 2
or
(1 + 1).should == 2
```

**[複数のexampleを扱う]**

-> `describe`の中には複数の`example (it do ... end)`が書ける

-> 1つのexampleの中に複数のエクスペクテーション(extect)を書けるが
途中でexpectが失敗すると次のexpectがどうなるかわからないので
**1つのexampleにつき1つのexpectにするのが原則**

```
describe '四則演算' do
  it '1 + 1 は 2になる' do
     expect(1 + 1).to eq 2
  end
  it '3 * 3 は9になること' do
     expect(3 * 3).to eq 9
   end
end


Finished in 0.00196 seconds (files took 0.18043 seconds to load)
2 examples, 0 failures

(注釈) it do ... endを2回定義しているから2examplesになっている
```

**[ネストしたdescribe]**
```
describe '四則演算' do
  describe '足し算' do
    it '1 + 1 は ２ になる' do
        expect(1 + 1).to eq 2
    end
  end
  describe '引き算' do
    it '3 - 1 は 2　になる' do
        expect(3 - 1).to eq 2
    end
  end
end
```

**[contextとbeforeを使って便利に]**
```
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
     it '12歳以下の場合,ひらがなで答えること' do
        user = User.new(name: 'たろう', age: 12)
        expect(user.greet).to eq 'ぼくはたろうだよ'
     end
     it '13歳以上の場合、漢字で答えること' do
        user = User.new(name: 'たろう', age: 13)
        expect(user.greet).to eq '僕はたろうです'
     end
  end
end
```
これをcontextを使ってリファクタリングする
`context`は条件を分けたりするときに使う事が多い

```
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
```

```
describe User do
  describe '#greet' do
    before do
      @params = { name: 'たろう' }
    end
    context '12歳以下の場合' do
      it 'ひらがなで答えること' do
        user = User.new(@params.merge(age: 12))
        expect(user.greet).to eq 'ぼくはたろうだよ。'
      end
    end
    context '13歳以上の場合' do
      it '漢字で答えること' do
        user = User.new(@params.merge(age: 13))
        expect(user.greet).to eq '僕はたろうです。'
      end
    end
  end
end
```
