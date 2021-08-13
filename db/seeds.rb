puts "Clearing old data..."
Restaurant.destroy_all
Food.destroy_all

puts "Seeding Restaurants"



res1 = Restaurant.create( name:'Himalaya Restaurant',location:'134 North Ave New York',restaurant_type: 'Nepali',contact: 2063894138,image: 'http://himalayarestaurant.be/wp-content/uploads/2018/04/IMG_3834.png')
res2 = Restaurant.create( name:'Han Korea BBQ',location:'1059 Hillen St Baltimore MD',restaurant_type: 'Korean',contact: 5802607847,image: 'https://www.placesandfoods.com/wp-content/uploads/2020/10/han-korea-bbq.jpg')
res3 = Restaurant.create( name:'New Hon Restaurant',location:'297 Emerald Ocoee Florida',restaurant_type: 'Chinese',contact: 7139073890,image: 'https://miro.medium.com/max/4096/1*FYxf0A6Kto28I0lnDyIa9Q.jpeg')
res4 = Restaurant.create( name:'Thai Thai Restaurant',location:'2701 Broadway New York NY',restaurant_type: 'Thai',contact: 443904689,image: 'http://foodmsia.com/wp-content/uploads/2012/07/thaithai1.jpg')
res5 = Restaurant.create( name:'Panahar Cuisine',location:'Princess Anne Rd Virginia',restaurant_type: 'Bangladeshi',contact: 6782755643,image: 'https://i.pinimg.com/originals/60/f3/89/60f389b4344cd23d0d4c1f986e051967.jpg')
res6 = Restaurant.create( name:'Ferraros Restaurant',location:'324 N Great Neck Rd Virginia',restaurant_type: 'Italian',contact: 2063894138,image: 'https://zagat-photos.imgix.net/ChIJ9fx0AuG_yIARdjJ_vbTUacA/947a396292e37ebeefdc072e6e5c5413.jpg')
res7 = Restaurant.create( name:'Punjab Restaurant',location:'5408 York Rd Baltimore MD',restaurant_type: 'Indian',contact: 8565902156,image: 'https://merchantview360.com/wp-content/uploads/2016/01/Punjab-Indian-Restaurant-Kissimmee-FL-store-front.jpg')

puts "Seeding Foods.."




Food.create(
food_name: 'Local khana', 
description: 'Nepali food with types of vegetables',
image: 'https://www.holidify.com/images/cmsuploads/compressed/Dal_Bhat_TarkariNepal_20190527155929.JPG',
price: 1000,
restaurant: res1)

Food.create(
food_name: 'MOMO', 
description: 'Dumplings with white flour stuffed with veggies or minced lamb or chicken',
image: 'https://www.holidify.com/images/cmsuploads/compressed/1515644556794_20190527160433.jpeg',
price: 1500,
restaurant: res1)

Food.create(
food_name: 'Bibimbap', 
description: 'Korean dish with mixed vegetables',
image: 'https://img.traveltriangle.com/blog/wp-content/tr:w-700,h-400/uploads/2018/05/bibimbap-700x500.jpg',
price: 800,
restaurant: res2)

Food.create(
food_name: 'Japchae', 
description: 'Korean traditional noodles',
image: 'https://img.traveltriangle.com/blog/wp-content/tr:w-700,h-400/uploads/2018/05/Japchae1.jpg',
price: 1000,
restaurant: res2)

Food.create(
food_name: 'Sichaun Beef', 
description: ' Beef with mix vegetables',
image: 'https://images.chinahighlights.com/allpicture/2019/11/7b3afb974d7946bbbe397f7c_894x670.webp',
price: 1500,
restaurant: res3)

Food.create(
food_name: 'Bhorta', 
description: 'Combinations herbs vegetables or fish',
image: 'https://cdn.tasteatlas.com//images/dishes/0b325cd0cd244541be20a0c5e6a32e62.jpg?w=905&h=510',
price: 1200,
restaurant: res5)

Food.create(
food_name: 'Panta Ilish', 
description: 'Rice soaked in water and served with fried hilsa, achar',
image: 'https://www.chefspencil.com/wp-content/uploads/Panta-Ilish-960x720.jpg.webp',
price: 1500,
restaurant: res5)

Food.create(
food_name: 'Tom Kha Gai', 
description: 'creamy coconut milk creating a rich sweet soup',
image: 'https://img.theculturetrip.com/1440x/smart/wp-content/uploads/2020/04/2ay2rhg.jpg',
price: 500,
restaurant: res4)

Food.create(
food_name: 'Butter Chicken/Butter Paneer', 
description: 'Curry made of chicken with butter or paneer',
image: 'https://wonderfulwanderings.com/wp-content/uploads/2017/05/most-popular-indian-food-in-the-world.jpg',
price: 1000,
restaurant: res7)

Food.create(
food_name: 'Pasta', 
description: 'Most popular Italian food',
image: 'http://yourguidetoitaly.com/slowitaly/wp-content/uploads/2018/06/pasta-types.jpg',
price: 500,
restaurant: res6)

puts "seeding completed"