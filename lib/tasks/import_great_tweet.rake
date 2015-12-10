require 'csv'

# 偉人の言葉をsrc.csvから取得してGreatTweetのインスタンスにする

namespace :db do
  desc "Import great persons tweet"
  task import_great_tweet: :environment do
    import_file = "#{File::dirname(__FILE__)}/src.csv"
    csv_src = CSV.read(import_file, headers: :first_row, skip_blanks: true, header_converters: :symbol, converters: [:date_time, :date, :numeric, :integer])
    csv_src.each do |row|
      GreatTweet.find_or_create_by(name: row[:name], detail: row[:detail])
    end
  end
end