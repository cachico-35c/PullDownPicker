# PullDownPicker

## いい感じのセレクトボックス（スピナー）を簡単導入

Webでは生年月日を選んだりするようなセレクトボックスと呼ばれるオブジェクトがあるように  
AndroidではSpinner（スピナー）というコンポーネントが用意されています。  
なのにiOSでは標準では提供されておらず、textFieldやlabel+DatePicker(PickerView)を自前で導入しないといけません。  
今回は自分がよく使っていたカスタムクラスを3つ使って簡単に導入するサンプルを紹介します。  
  
<img src="https://user-images.githubusercontent.com/62793390/83847998-2779d080-a748-11ea-97e6-3dcb41909f54.gif" width="300">  
  
こんなのを簡単導入します。  
  
## 導入①

では実際に導入と解説を。
次のクラスをプロジェクトに入れます。
  
・PullDownTextField.swift  
・CustomDatePickerView.swift  
・CustomPickerView.swift  
  
## 導入②

サンプルプロジェクトでは以下の4ステップをそれぞれ別Controllerにしてあるのでそれぞれ参考にしてください。  
  
・PullDownViewController.swift  
セレクトボックスっぽい角丸のTextFieldの導入  
  
・DatePickerSettingViewController.swift  
セレクトボックス+DatePicker  
  
・PickerViewSettingViewController.swift  
セレクトボックス(Storyboad)+PickerView  
  
・MixtureViewController.swift  
セレクトボックス+DatePicker+PickerView  
  
使いたい状態に合わせて上記Controllerを参考にご自身に組み込んでください。  
  
## 解説

①CustomDatePickerViewのセットアップ  
initViewでDatePickerを乗せる対象のUIView(self.viewなど)とminとmaxはdatepickerの最小と最大をセットします。  
あとはDelegateの設定して④のdelegateメソッドを呼ぶ準備をします。  
<img width="665" alt="スクリーンショット 2020-06-05 16 05 48" src="https://user-images.githubusercontent.com/62793390/83848064-44160880-a748-11ea-9e44-6201d8a77d40.png">  
  
②CustomPickerViewのセットアップ  
initViewでpickerViewに渡す項目の配列（demo_items）と乗せる対象のUIView(self.viewなど)をセットします。  
通信で取得してdemo_itemsに配列でセットするケースも多々あるかと思います。  
あとはDelegateの設定して⑤のdelegateメソッドを呼ぶ準備をします。  
<img width="651" alt="スクリーンショット 2020-06-05 16 05 57" src="https://user-images.githubusercontent.com/62793390/83848084-4a0be980-a748-11ea-8349-0c6631207cf5.png">  
  
③PullDownTextFeildのdelegate  
ここでCustomDatePickerViewとCustomPickerViewの開いているかどうかの状態によって、
閉じる、展開するなどの処理を行っています。  
個別に対応したい場合は各ViewControllerを参考にしてください。  
<img width="655" alt="スクリーンショット 2020-06-05 16 06 14" src="https://user-images.githubusercontent.com/62793390/83848088-4bd5ad00-a748-11ea-9175-856284158a46.png">  
  
④CustomDatePickerViewのdelegate  
対応するPullDownTextFieldに対して値をセットします。  
<img width="641" alt="スクリーンショット 2020-06-05 16 06 22" src="https://user-images.githubusercontent.com/62793390/83848172-6ad43f00-a748-11ea-8ff2-fa55cee0faa5.png">  
  
⑤CustomPickerViewのdelegate  
対応するPullDownTextFieldに対して値をセットします。  
<img width="615" alt="スクリーンショット 2020-06-05 16 06 31" src="https://user-images.githubusercontent.com/62793390/83848195-70ca2000-a748-11ea-968f-14e07acc4c6c.png">  
  
## Usage

導入にも記載しました以下の3つのクラスをプロジェクトに組み込むだけです。  
frameworkなどではないのでお気軽にお試しいただけます。  
  
・PullDownTextField.swift  
・CustomDatePickerView.swift  
・CustomPickerView.swift  
  
基本はMixtureViewControllerを参考にしてください。  
Storyboadを使うPullDownTextFieldの設定は以下を参考にしてください。  
<img width="579" alt="スクリーンショット 2020-06-03 18 29 36" src="https://user-images.githubusercontent.com/62793390/83848210-745da700-a748-11ea-8b81-73114db586bf.png">  
  
  
