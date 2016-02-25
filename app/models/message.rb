class Message < ActiveRecord::Base
    # 「名前」は必須入力かつ20文字以内
    validates :name ,  presence: { message: "は必須入力"} , length: { maximum: 20 , message: "は20文字以内"}
    
    # 「内容」は必須入力かつ2文字以上30文字以下
    validates :body ,  presence: { message: "は必須入力"} , length: { maximum: 30, minimum: 2 , message: "は2文字以上30文字以下"} 

    # 「年齢」は必須入力かつ0以上132以下。年齢の世界最高記録（122）+10=132
    validates :age ,  presence: { message: "は必須入力"} , numericality: { only_integer: true, greater_than_or_equal_to: 0 ,less_than_or_equal_to: 132 , message: "は0以上132以下"}

end
