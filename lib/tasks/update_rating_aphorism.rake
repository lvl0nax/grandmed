task update_rating_aphorism: :environment do
  Picture.where.not(post_id: nil).find_each do |pic|
    response = JSON.parse(open("https://api.vk.com/method/wall.getById?posts=#{pic.author}_#{pic.post_id}&v=5.26").read)
    pic.update(
        likes: (l = response['response'].first['likes']['count']),
        shares: (r = response['response'].first['reposts']['count']),
        rating: (l.to_i * 1 + r.to_i * 3)
    )
  end
end
