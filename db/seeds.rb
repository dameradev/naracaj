User.create!(
  email: "test@admin.com",
  password: "damjan",
  password_confirmation: "damjan",
  roles: 'site_admin'
)


puts "1 admin user created"


Category.create!(title: "Pici")
Category.create!(title: "Predjadenja")
 Category.create!(title: "Sladko")
Category.create!(title: "Skara")
 Category.create!(title: "Sendvici")
#
# puts "5 categories created"
#
# verona = Firm.create!(title: "Verona")
# rebus = Firm.create!(title: "Rebus")
# hambi = Firm.create!(title: "Hambi")
# necko = Firm.create!(title: "Necko")
# bambi = Firm.create!(title: "Bambi")
#
#
#
# p = Product.create!(title: "Tost-Sunka", price:90, description: "tost so sunka i kaskaval", category_id:1)
# o = Product.create!(title: "Tost-vrat", price:100, description: "tost...",  category_id:1)
# g = Product.create!(title: "Tost_martadela", price: 80, description: "tost...", category_id:2)
# d = Product.create!(title: "Kapricioza", price: 180, description: "sunka kaskaval",  category_id:2)
# w = Product.create!(title: "Pleskavica", price: 120, description: "svinska", category_id:3)
# Product.create!(title: "Pastramajlija", price: 200, description: "pilesk",  category_id:4)
# Product.create!(title: "Wafla", price: 140, description: "nutela",  category_id:3)
# Product.create!(title: "Burek", price: 45, description: "sirenje",  category_id:4)
# Product.create!(title: "Margarita", price: 160, description: "kaskaval",  category_id:5)
# Product.create!(title: "Preklopena pica", price: 40, description: "pre",  category_id:5)
