# frozen_string_literal: true

DRINKS = [
  { name: 'コーヒー', price: '300' },
  { name: 'カフェラテ', price: '400' },
  { name: 'チャイ', price: '460' },
  { name: 'エスプレッソ', price: '340' },
  { name: '緑茶', price: '450' }
].freeze

FOODS = [
  { name: 'チーズケーキ', price: '470' },
  { name: 'アップルパイ', price: '520' },
  { name: 'ホットサンド', price: '410' }
].freeze

def take_order(menus)
  menus.each.with_index(1) do |menu, i|
    puts "(#{i})#{menu[:name]}: #{menu[:price]}円"
  end
  print '>'
  order_number = gets.chomp.to_i
  order_number.between?(1, menus.size)
    puts "#{menus[order_number - 1][:name]}(#{menus[order_number - 1][:price]}円)ですね。"
    return order_number - 1
end

puts 'bugカフェへようこそ！ご注文は？ 番号でどうぞ'
drink_order = take_order(DRINKS)

puts 'フードメニューはいかがですか?'
foods_order = take_order(FOODS)

total = FOODS[foods_order][:price].to_i + DRINKS[drink_order][:price].to_i
puts "お会計は#{total}円になります。ありがとうございました！"
