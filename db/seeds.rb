# db/seeds.rb — idempotent seed: check-before-insert
# Creates categories, products, and demo admin user

puts "Seeding database..."

# Categories
electronics = Category.find_or_create_by!(name: "Electronics")
home_office = Category.find_or_create_by!(name: "Home & Office")
kitchen = Category.find_or_create_by!(name: "Kitchen & Dining")
accessories = Category.find_or_create_by!(name: "Accessories")

puts "  Categories: #{Category.count}"

# Products — idempotent by unique name
products_data = [
  { name: "Wireless Noise-Cancelling Headphones",
    category: electronics, price: 149.99, stock: 34,
    image_url: "/images/products/headphones.svg",
    description: "Premium over-ear headphones with active noise cancellation, 30-hour battery life, and plush memory foam cushions. Rich, balanced sound signature tuned by audio engineers." },

  { name: "Mechanical Keyboard — Cherry MX Blue",
    category: electronics, price: 89.95, stock: 22,
    image_url: "/images/products/keyboard.svg",
    description: "Tenkeyless mechanical keyboard with genuine Cherry MX Blue switches for satisfying tactile feedback. Per-key RGB backlighting, aircraft-grade aluminium frame, and detachable USB-C cable." },

  { name: "USB-C Docking Station — 12-in-1",
    category: electronics, price: 64.50, stock: 15,
    image_url: "/images/products/dock.svg",
    description: "Universal USB-C hub with dual HDMI (4K@60Hz), 3× USB-A 10Gbps, SD/microSD, Gigabit Ethernet, 100W pass-through charging, and audio jack. Works with Mac, Windows, and Linux." },

  { name: "Standing Desk Converter — 36\"",
    category: home_office, price: 219.00, stock: 8,
    image_url: "/images/products/desk.svg",
    description: "Height-adjustable standing desk riser with gas-spring lift. Holds dual monitors up to 16 kg. Spacious 36\"×24\" surface with integrated cable management tray. No tools required for assembly." },

  { name: "Ergonomic Mesh Office Chair",
    category: home_office, price: 349.99, stock: 6,
    image_url: "/images/products/chair.svg",
    description: "Fully adjustable ergonomic chair with breathable mesh back, 4D armrests, adjustable lumbar support, and tilt-lock mechanism. Rated for 8+ hour daily use. 10-year warranty on frame." },

  { name: "LED Desk Lamp with Wireless Charging",
    category: home_office, price: 42.99, stock: 40,
    image_url: "/images/products/lamp.svg",
    description: "Architect-style LED desk lamp with 5 colour temperatures, 10 brightness levels, integrated 15W Qi wireless charging pad, and USB-A charging port. Flicker-free, auto-dimming night mode." },

  { name: "Stainless Steel Pour-Over Coffee Set",
    category: kitchen, price: 34.95, stock: 25,
    image_url: "/images/products/coffee.svg",
    description: "Double-walled stainless steel pour-over dripper with reusable ultra-fine mesh filter. Includes 600 ml thermal carafe and bamboo stirring paddle. No paper filters needed — zero waste." },

  { name: "Pre-Seasoned Cast Iron Skillet — 12\"",
    category: kitchen, price: 39.99, stock: 18,
    image_url: "/images/products/skillet.svg",
    description: "Heavy-duty cast iron skillet, pre-seasoned with vegetable oil and ready to cook. Even heat distribution, oven-safe to 260 °C, suitable for all cooktops including induction. Helper handle for easy lifting." },

  { name: "Japanese Chef's Knife — 8\" Gyuto",
    category: kitchen, price: 79.00, stock: 12,
    image_url: "/images/products/knife.svg",
    description: "Hand-forged VG-10 stainless steel core with 67-layer Damascus cladding. Octagonal rosewood handle. 8\" (210 mm) blade. Rockwell 61±1. Ideal for slicing, dicing, and precision prep work." },

  { name: "Wool Felt Laptop Sleeve — 14\"",
    category: accessories, price: 28.50, stock: 30,
    image_url: "/images/products/sleeve.svg",
    description: "Slim laptop sleeve handcrafted from merino wool felt with a soft microfiber lining. Fits most 13–14\" laptops. Magnetic closure, water-resistant coating, and a discreet exterior document pocket." },

  { name: "Minimalist Leather Watch — Brown",
    category: accessories, price: 125.00, stock: 10,
    image_url: "/images/products/watch.svg",
    description: "Japanese quartz movement with a sapphire-coated mineral crystal. 40 mm case in brushed stainless steel. Genuine full-grain leather strap with quick-release pins. 5 ATM water resistance." },

  { name: "Canvas and Leather Backpack — 20L",
    category: accessories, price: 94.00, stock: 14,
    image_url: "/images/products/backpack.svg",
    description: "Roll-top daypack in waxed cotton canvas with full-grain leather trim. Padded laptop compartment (up to 16\"), internal organisation pockets, external water-bottle sleeve, and adjustable sternum strap." },
]

products_data.each do |data|
  product = Product.find_or_create_by!(name: data[:name]) do |p|
    p.category = data[:category]
    p.price = data[:price]
    p.stock = data[:stock]
    p.image_url = data[:image_url]
    p.description = data[:description]
  end
  # Update attributes if record already existed (idempotent refresh)
  product.update!(data.except(:name))
end

puts "  Products: #{Product.count}"

# Demo admin user
admin = AdminUser.find_or_initialize_by(email: "cenius@cenius.ai")
admin.password = "cenius"
admin.password_confirmation = "cenius"
admin.save!

puts "  Admin user: cenius@cenius.ai / cenius"
puts "Seeding complete."
