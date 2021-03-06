Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: "orders#index"
 resources :orders, only: [:create]  do
  resources :stocks, only: [:index,:update]
  resources :shippings, only:[:create]
  resources :to_stocks, only: [:index,:create]
 end  
 resources :orders, only:[:destroy]
 resources :shippings, only:[:index,:show]

 get "/orders/:order_id/stocks/:id/to_stocks", to: "to_stocks#accepted" #オーダー受け入れ後の入庫履歴表示ルート

 get "/orders/:order_id/stocks/:id", to: 'stocks#back' #出荷一覧からブラウザの ← ボタンを押して戻すと生じていたルーティングエラーの解消
 post "shippings", to: 'shippings#index' #出荷指示一覧ページ → 在庫一覧表に戻った後に出荷指示ボタンを押し、再び出荷指示一覧ページに戻った際に生じていたルーティングエラーの解消

 get "/stocks/:order_id", to: "stocks#currentstock" #オーダー受け入れ後の入庫履歴表示から在庫一覧表示に戻るルート

end