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

user1_file = URI.open("https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBL2ZMQWc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--eeb1914fc4383dad45f25102670fa7b9682aa1ec/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--b67d9ded4d28d0969fbb98b4c21b79257705a99a/mayagarciabo.jpg")
user1.photo.attach(io: user1_file, filename: "maya_profile_pic.jpg", content_type: "image/jpg")
user1.save!

user2_file = URI.open("https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBL2pMQWc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--53dc4393f2fd2ee72ed1dd780029241695d57aeb/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--b67d9ded4d28d0969fbb98b4c21b79257705a99a/val3ntinahdz.jpg")
user2.photo.attach(io: user2_file, filename: "valentina_profile_pic.jpg", content_type: "image/jpg")
user2.save!

user3_file = URI.open("https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBL1hMQWc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--569088dff2fcc545a21c470d3913b8adcb97f34e/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--b67d9ded4d28d0969fbb98b4c21b79257705a99a/DMont97.jpg")
user3.photo.attach(io: user3_file, filename: "donovan_profile_pic.jpg", content_type: "image/jpg")
user3.save!

user4_file = URI.open("https://avatars.githubusercontent.com/u/135627782?v=4")
user4.photo.attach(io: user4_file, filename: "alan_profile_pic.jpg", content_type: "image/jpg")
user4.save!

user5_file = URI.open("https://avatars.githubusercontent.com/u/30853355?v=4")
user5.photo.attach(io: user5_file, filename: "andres_profile_pic.jpg", content_type: "image/jpg")
user5.save!

service1 = Service.create!(title: "I will create a complex web application to achieve your goals",
                           description: "Using the latest technologies, I will develop a robust and scalable web application tailored to your business needs.",
                           price: "10.95€",
                           category: "front-end",
                           delivery_time: 1,
                           user_id: user1.id)

service2 = Service.create!(title: "I will create a complex web application to achieve business goals",
                           description: "Using the latest technologies, I will develop a robust and scalable web application tailored to your business needs.",
                           price: "10.95€",
                           category: "front-end",
                           delivery_time: 1,
                           user_id: user1.id)

service3 = Service.create!(title: "I will create a complex web application to achieve business goals",
                           description: "Using the latest technologies, I will develop a robust and scalable web application tailored to your business needs.",
                           price: "10.95€",
                           category: "front-end",
                           delivery_time: 1,
                           user_id: user1.id)

service4 = Service.create!(title: "I will create a complex web application to achieve business goals",
                           description: "Using the latest technologies, I will develop a robust and scalable web application tailored to your business needs.",
                           price: "10.95€",
                           category: "front-end",
                           delivery_time: 1,
                           user_id: user1.id)

service5 = Service.create!(title: "I will create a complex web application to achieve business goals",
                           description: "Using the latest technologies, I will develop a robust and scalable web application tailored to your business needs.",
                           price: "10.95€",
                           category: "front-end",
                           delivery_time: 1,
                           user_id: user2.id)

service6 = Service.create!(title: "I will design an eye-catching logo for your brand",
                           description: "Professional logo design that captures your brand's essence and stands out in the market.",
                           price: "20.00€",
                           category: "graphic design",
                           delivery_time: 2,
                           user_id: user2.id)

service7 = Service.create!(title: "I will write SEO optimized articles for your blog",
                           description: "Engaging and SEO-friendly articles to drive traffic and improve your website's ranking.",
                           price: "15.50€",
                           category: "content writing",
                           delivery_time: 3,
                           user_id: user2.id)

service8 = Service.create!(title: "I will develop a custom mobile app for Android and iOS",
                           description: "Cross-platform mobile app development to expand your reach to both Android and iOS users.",
                           price: "50.00€",
                           category: "mobile development",
                           delivery_time: 7,
                           user_id: user2.id)

service9 = Service.create!(title: "I will create a professional WordPress website",
                           description: "Custom WordPress website design and development to enhance your online presence.",
                           price: "30.00€",
                           category: "web development",
                           delivery_time: 5,
                           user_id: user3.id)

service10 = Service.create!(title: "I will provide expert digital marketing services",
                            description: "Comprehensive digital marketing strategies to boost your online visibility and engagement.",
                            price: "40.00€",
                            category: "digital marketing",
                            delivery_time: 4,
                            user_id: user3.id)

service11 = Service.create!(title: "I will conduct in-depth market research for your start-uo",
                            description: "Detailed market research reports to help you make informed business decisions.",
                            price: "32.00€",
                            category: "market research",
                            delivery_time: 5,
                            user_id: user3.id)

service12 = Service.create!(title: "I will design a responsive e-commerce website for you",
                            description: "User-friendly and visually appealing e-commerce website design to increase your sales.",
                            price: "30.00€",
                            category: "e-commerce",
                            delivery_time: 6,
                            user_id: user3.id)

service1_file = URI.open("https://unsplash.com/es/fotos/computadora-portatil-gris-encendida-XJXWbfSo2f0")
service1.images.attach(io: service1_file, filename: "s1.jpg", content_type: "image/jpg")
service1.save!

service2_file = URI.open("https://unsplash.com/es/fotos/una-mujer-sentada-en-una-cama-usando-una-computadora-portatil-xSiQBSq-I0M")
service2.images.attach(io: service2_file, filename: "s2.jpg", content_type: "image/jpg")
service2.save!

service3_file = URI.open("https://unsplash.com/es/fotos/computadora-portatil-gris-y-negra-en-surface-Im7lZjxeLhg")
service3.images.attach(io: service3_file, filename: "s3.jpg", content_type: "image/jpg")
service3.save!

service4_file = URI.open("https://unsplash.com/es/fotos/people-sitting-down-near-table-with-assorted-laptop-computers-SYTO3xs06fU")
service4.images.attach(io: service4_file, filename: "s4.jpg", content_type: "image/jpg")
service4.save!

service5_file = URI.open("https://unsplash.com/es/fotos/imac-plateado-cerca-del-iphone-sobre-mesa-de-madera-marron-EhTcC9sYXsw")
service5.images.attach(io: service5_file, filename: "s5.jpg", content_type: "image/jpg")
service5.save!

service6_file = URI.open("https://unsplash.com/es/fotos/foto-de-primer-plano-del-teclado-negro-y-rojo-AMssSjUaTY4")
service6.images.attach(io: service6_file, filename: "s6.jpg", content_type: "image/jpg")
service6.save!

Sale.create!(
  status: 'accepted',
  date: '2024-03-30',
  user_id: user4.id,
  price: service1.price,
  service_id: service1.id
)

Sale.create!(
  status: 'pending',
  date: '2024-05-03',
  user_id: user4.id,
  price: service2.price,
  service_id: service2.id
)

Sale.create!(
  status: 'accepted',
  date: '2024-04-11',
  user_id: user5.id,
  price: service3.price,
  service_id: service3.id
)

Sale.create!(
  status: 'cancelled',
  date: '2024-05-05',
  user_id: user5.id,
  price: service4.price,
  service_id: service4.id
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
