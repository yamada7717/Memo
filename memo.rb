#csvライブラリ使用
require "csv"

puts "1 新規でメモアプリを作成 2 既存のメモを編集"
puts "番号を選択してください"
## ユーザーのキーワード入力を取得
#getsメソッドには末尾に改行が入る
memo_type = gets.to_i

if memo_type == 1
  puts "拡張子を除いたファイルを入力してください"
  #ファイル名取得
  file_name = gets.chomp
  if file_name
      p "メモしたい内容を入力してください"
      p "Ctlr+Dで保存します"
    #メモ内容を取得
    input_memo =  STDIN.read
    memo = input_memo.chomp

    CSV.open("#{file_name}.csv" , "w") do |csv|
    csv << ["#{memo}"]

    end
  end

elsif memo_type == 2
  puts "既存のメモの編集をします。拡張子を除いたファイル名を入力してください。"

  file_name = gets.chomp
  if file_name
    p "編集したい内容を入力してください"
    p "Ctlr+Dで保存します"
    edit_memo =  STDIN.read
    edit = edit_memo.chomp

    CSV.open("#{file_name}.csv" , "a") do |csv|
    csv << ["#{edit}"]

    end
  end

else
  puts "選択に戻ります"
end
