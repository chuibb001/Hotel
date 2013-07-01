// Copyright (c) 2013 Chujian Inc.

namespace java com.chujian.sevendaysinn.model.thrift


// NEXT: 4
struct Region {
  1:i32 regionId,
  2:string name,
  3:string pinyin,
}

// NEXT: 5
struct City {
  1:i32 cityId,
  2:string name,
  3:string pinyin,
  4:list<Region> region,
}

// NEXT: 2 
struct Image {
  1:string url,
}

// NEXT: 5
struct Room {
  1:i32 rooomId,
  2:string name,
  3:double price,
  4:i32 availableRooms,
}

// NEXT: 6
struct Supplies {
  1:i32 suppliesId,
  2:string name,
  3:string quantifier,
  4:double onlinePrice,
  5:double basePrice,
}

// NEXT: 19
struct Hotel {
  1:i32 hotelId,

  // brief
  2:string name,
  3:string phone,
  4:string address,
  5:double latitude,
  6:double longitude,
  7:bool vacant,
  8:double price,
  14:double recommendScore,
  15:double distance,
  17:bool parkingAvailable,
  18:bool wifiAvailable,

  // details
  9:Image coverImage,
  10:list<Image> image,
  11:string introduction,
  12:list<Room> room,
  13:list<Supplies> supplies,
  16:list<i32> qInfo,
}

// NEXT: 12
struct SearchRequest {
  1:i32 cityId,
  2:i32 regionId,
  3:string keyword,
  4:i64 checkinTime,
  5:i64 checkoutTime,
  6:double latitude,
  7:double longitude,
  8:double radius,

  9:i32 pageIndex,
  10:i32 pageSize,
  
  // values:
  //   DEFAULT = 0,
  //   PRICE_ASCENDING = 1,
  //   RATING_DESCENDING = 2,
  //   DISTANCE_ASCENDING = 3,
  11:i32 sortBy,
}

// NEXT: 4 
struct HotelRequest {
  1:i32 hotelId,
  2:i64 checkinTime,
  3:i64 checkoutTime,
}
