class Message < ActiveRecord::Base
    # 「名前」は必須入力かつ20文字以内
    validates :name , length: { maximum: 20 }, presence: true
    # 「内容」は必須入力かつ2文字以上30文字以下
    validates :body , length: { maximum: 30, minimum: 2} , presence: true

end
