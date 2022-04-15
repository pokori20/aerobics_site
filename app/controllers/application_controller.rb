class ApplicationController < ActionController::Base
  # セッションを実装するには多数のメソッドを定義する必要があるため
  #セッション用ヘルパーモジュールを読み込む
  include SessionsHelper
end
