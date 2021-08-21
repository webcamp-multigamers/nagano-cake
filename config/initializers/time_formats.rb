# <%= xxx.created_at.to_s(:datetime_jp) %>
# <%= xxx.updated_at.to_s(:datetime_jp) %>
# 上記のように入力することで、日本時間で表示が可能になる。

Time::DATE_FORMATS[:datetime_jp] = '%Y年 %m月 %d日 %H時 %M分'