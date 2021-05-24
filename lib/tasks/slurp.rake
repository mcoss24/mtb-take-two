namespace :slurp do
  desc "TODO"
  task transactions: :environment do

    require "csv"
    csv_text = File.read(Rails.root.join("lib", "csvs", "spots table.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      puts row.to_hash
      s = Spot.new
      s.location = row["Location"]
      s.geography = row['Geography']
      s.climate = row['Climate']
      s.winter = row["Winter"]
      s.fall = row['Fall']
      s.spring = row['Spring']
      s.summer = row['Summer']
      s.cross_country = row['cross_country']
      s.downhill = row['Downhill']
      s.save
    end
    puts "There are now #{Spot.count} rows in the spots table"
  end

  desc "TODO"
  task trails: :environment do

    require "csv"
    csv_text = File.read(Rails.root.join("lib", "csvs", "trails table.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      puts row.to_hash
      t = Trail.new
      t.name = row["name"]
      t.spot_id = row['spot_id']
      t.link = row['link']
      t.save
    end
    puts "There are now #{Trail.count} rows in the spots table"
  end

end
