// Copyright (c) 2013 Chujian Inc.

namespace java com.chujian.sevendaysinn.model.thrift

include "THotel.thrift"
include "TMember.thrift"
include "TBooking.thrift"


// NEXT: 9
struct ClientInfo {
  1:string deviceId,
  8:string deviceModel,
  2:string platform,  // ios, android
  3:string platformVersion,
  4:string appId,  // see wiki
  5:string appVersion,
  6:string mpId,  // see wiki

  7:i64 lastUpdateTime,
}

// NEXT: 6
struct ServerInfo {
  1:string minVersion,
  2:string latestVersion,
  3:string updateUrl,

  4:string cityListUrl,
  5:string regionListUrl,
}


service ISevenDaysService {
  ServerInfo Startup(1:ClientInfo clientInfo),

  list<THotel.Hotel> search(1:THotel.SearchRequest request),
  THotel.Hotel getHotelDetails(1:THotel.HotelRequest request),

  list<TBooking.SuppliesOrder> getLastSuppliesOrder(),
  TBooking.Reservation book(1:TBooking.BookingRequest request),
  TBooking.Reservation getReservation(1:TBooking.ReservationRequest request), 
  bool cancel(1:TBooking.ReservationRequest request), 

  TMember.Credential login(1:TMember.Signture signture),
  bool logout(),
  TMember.Member getMemberInfo(),
  TMember.Asset getMemberAsset(),
  list<TBooking.Reservation> getMemberReservations(1:TMember.MemberInfoRequest request),
  list<TMember.Voucher> getVoucher(1:TMember.MemberInfoRequest request),
  list<TMember.RefundCoupon> getRefundCoupon(1:TMember.MemberInfoRequest request),

  TMember.Asset getAvailableAsset(1:TBooking.AssetRequest request),
  list<TMember.Voucher> getAvailableVoucher(1:TBooking.AssetRequest request),
  list<TMember.RefundCoupon> getAvailableRefundCoupon(1:TBooking.AssetRequest request),
  TBooking.Payment pay(1:TBooking.PayRequest request),
}

