# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :micropost do |micropost|
  micropost.content "Foo bar"
  micropost.association :user
end

Factory.define :artwork do |artwork|
  artwork.association :user

  artwork.owner_id          44
  artwork.filename          "filename string (obsolete)"
  artwork.thumbail          "thumbnail string (fixme)"
  artwork.size               100
  artwork.height             200
  artwork.width              300
  artwork.content_type       1
  artwork.created_at         1/1/2001
  artwork.updated_at         1/2/2001
  artwork.user_id            22
  artwork.description        "sample description"
#  artwork.type               "sample type"
  artwork.subtype            "sample subtype"
  artwork.print              "sample print"
  artwork.style              "sample style"
  artwork.subject            "sample subject"
  artwork.tags               "sample description"
  artwork.quantity           5
  artwork.quantity_remaining 4
  artwork.edition_number     3
  artwork.physical_width     100.01
  artwork.physical_height    200.01
  artwork.physical_depth     300.01
  artwork.physical_weight    400.01
  artwork.physical_framed    500.01
  artwork.price              600.02
  artwork.ships_from         "america"
  artwork.ships_to           "europe"
  artwork.shipping_cost      5.22

end

# FIXME: Need Size, Content type, filename
Factory.define :picture do |picture|
  picture.association :artwork
end


