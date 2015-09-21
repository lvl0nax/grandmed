task update_rating_aphorism: :environment do
  Picture.where.not(post_id: nil).find_each do |pic|
    response = JSON.parse(open("https://api.vk.com/method/wall.getById?posts=#{pic.author}_#{pic.post_id}&v=5.26").read)
    pic.update(
        likes: (l = response.fetch('response').first.fetch('likes').fetch('count')),
        shares: (r = response.fetch('response').first.fetch('reposts').fetch('count')),
        rating: (l.to_i * 1 + r.to_i * 3)
    )
  end
end
