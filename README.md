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


