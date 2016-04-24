# Rspec_Study

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




