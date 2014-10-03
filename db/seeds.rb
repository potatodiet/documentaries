User.create(name: "Admin", email: "temp@email.com", password: "Password", role: "admin")

if Rails.env.development?
  sources = %w[D7TB8b2t3QE M7lc1UVf-VE ylLzyHk54Z0 tKTZoB2Vjuk u1zgFlCw8Aw wtLJPvx7-ys 9pmPa_KxsAM bfgO-LXGpTM]
  8.times do |n|
    Documentary.create(
      title: "Documentary_#{n}", description: "Example description",
      video_source: sources[n], video_service: "youtube", tag_list: "example, testing",
      uploader_id: 1
    )
  end
end
