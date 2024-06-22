require "open-uri"
Sale.destroy_all
Service.destroy_all
User.destroy_all

user1 = User.create!(first_name: 'Maya',
                     last_name: 'Garcia',
                     email: 'maya@gmail.com',
                     phone_number: '692389',
                     password: "password")

user2 = User.create!(first_name: 'Valentina',
                     last_name: 'Leon',
                     email: 'vale@gmail.com',
                     phone_number: '7302037',
                     password: "password")

user3 = User.create!(first_name: 'Donovan',
                     last_name: 'Montiel',
                     email: 'donovan@gmail.com',
                     phone_number: '73034740',
                     password: "password")

user4 = User.create!(first_name: 'Alan',
                     last_name: 'Trovo',
                     email: 'alan@gmail.com',
                     phone_number: '094694028',
                     password: "password")

user5 = User.create!(first_name: 'Andres',
                     last_name: 'Lopez',
                     email: 'andres@gmail.com',
                     phone_number: '68300387',
                     password: "password")
user1_file = URI.open("https://asset.cloudinary.com/dczinhg0a/0a76a4727ecb39b8b110d08f7b43d2ca")
user1.photo.attach(io: user1_file, filename: "maya_profile_pic.jpg", content_type: "image/jpg")
user1.save!

services = Service.create!([
  {
    title: "I will create a complex web application to achieve business goals",
    description: "Using the latest technologies, I will develop a robust and scalable web application tailored to your business needs.",
    price: "10.95€",
    category: "front-end",
    delivery_time: 1,
    user_id: user1.id
  },
  {
    title: "I will design an eye-catching logo for your brand",
    description: "Professional logo design that captures your brand's essence and stands out in the market.",
    price: "20.00€",
    category: "graphic design",
    delivery_time: 2,
    user_id: user1.id
  },
  {
    title: "I will write SEO optimized articles for your blog",
    description: "Engaging and SEO-friendly articles to drive traffic and improve your website's ranking.",
    price: "15.50€",
    category: "content writing",
    delivery_time: 3,
    user_id: user1.id
  },
  {
    title: "I will develop a custom mobile app for Android and iOS",
    description: "Cross-platform mobile app development to expand your reach to both Android and iOS users.",
    price: "50.00€",
    category: "mobile development",
    delivery_time: 7,
    user_id: user1.id
  },
  {
    title: "I will create a professional WordPress website",
    description: "Custom WordPress website design and development to enhance your online presence.",
    price: "30.00€",
    category: "web development",
    delivery_time: 5,
    user_id: user2.id
  },
  {
    title: "I will provide expert digital marketing services",
    description: "Comprehensive digital marketing strategies to boost your online visibility and engagement.",
    price: "40.00€",
    category: "digital marketing",
    delivery_time: 4,
    user_id: user2.id
  },
  {
    title: "I will design a responsive e-commerce website",
    description: "User-friendly and visually appealing e-commerce website design to increase your sales.",
    price: "45.00€",
    category: "e-commerce",
    delivery_time: 6,
    user_id: user2.id
  },
  {
    title: "I will create engaging social media content",
    description: "Creative and engaging content for your social media platforms to enhance your brand's presence.",
    price: "12.00€",
    category: "social media",
    delivery_time: 2,
    user_id: user2.id
  },
  {
    title: "I will produce a high-quality explainer video",
    description: "Professional explainer videos to clearly communicate your message and captivate your audience.",
    price: "60.00€",
    category: "video production",
    delivery_time: 10,
    user_id: user3.id
  },
  {
    title: "I will conduct in-depth market research for your business",
    description: "Detailed market research reports to help you make informed business decisions.",
    price: "35.00€",
    category: "market research",
    delivery_time: 5,
    user_id: user3.id
  },
  {
    title: "I will conduct in-depth market research for your start-uo",
    description: "Detailed market research reports to help you make informed business decisions.",
    price: "32.00€",
    category: "market research",
    delivery_time: 5,
    user_id: user3.id
  },
  {
    title: "I will design a responsive e-commerce website for you",
    description: "User-friendly and visually appealing e-commerce website design to increase your sales.",
    price: "30.00€",
    category: "e-commerce",
    delivery_time: 6,
    user_id: user3.id
  }
])


Sale.create!(
  status: 'accepted',
  date: '2024-03-30',
  user_id: user4.id,
  price: Service.first.price,
  service_id: Service.first.id
)

Sale.create!(
  status: 'pending',
  date: '2024-05-03',
  user_id: user4.id,
  price: Service.second.price,
  service_id: Service.second.id
)

Sale.create!(
  status: 'accepted',
  date: '2024-04-11',
  user_id: user5.id,
  price: Service.third.price,
  service_id: Service.third.id
)

Sale.create!(
  status: 'cancelled',
  date: '2024-05-05',
  user_id: user5.id,
  price: Service.last.price,
  service_id: Service.last.id
)


puts "Seed data generated successfully"



# servicesTitle = ["I will convert xd to HTML, xd to wordpress using elementor",
#   "I will convert figma, PSD, xd to HTML responsive bootstrap design",
#   "I will convert figma to pixel perfect html css or webflow website",
#   "I will do figma to HTML, PSD to HTML by tailwind CSS and alpine js",
#   "I will convert xd to html, psd to html, figma to html, bootstrap 5",
#   "I will convert figma to html, sketch to html, xd to html, psd to html css",
#   "I will convert PSD to HTML, xd to html, figma to HTML, pdf to HTML",
#   "I will design a professional HTML email template or newsletter",
#   "I will convert figma UI design to reactjs, nextjs, or vuejs website",
#   "I will create a custom web calculator for your website",
#   "I will develop realtime web calculator for wordpress website",
#   "I will convert psd to html xd to html figma to html bootstrap 5",
# ]

# categories = ["full stack development", "front end", "back end"]
