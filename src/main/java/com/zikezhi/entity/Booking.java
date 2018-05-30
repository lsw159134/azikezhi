package com.zikezhi.entity;

import java.util.Date;

/**
 * 代售
 * @author wrp
 *
 *CREATE TABLE `booking` (
  `booking_id` char(32) NOT NULL,
  `booking_product` varchar(255) DEFAULT NULL,
  `booking_encapsulation` varchar(888) DEFAULT NULL,
  `booking_number` int(11) DEFAULT NULL,
  `booking_price` float DEFAULT NULL,
  `booking_channel` varchar(888) DEFAULT NULL,
  `booking_status` varchar(255) DEFAULT NULL,
  `booking_phone` varchar(255) DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `booking_note` varchar(888) DEFAULT NULL,
  `booking_uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 *
 */
public class Booking {
	private String booking_id;//id
	private String booking_product;//代售产品名称
	private String booking_encapsulation;//封装（描述）
	private int booking_number;//产品数量
	private Float booking_price;//产品单价
	private String booking_channel;//产品渠道
	private String booking_status;//代售状态
	private String booking_phone;//代售人联系电话
	private Date booking_date;//代售提交时间
	private String booking_note;//代售备注
	private String booking_feedback;//反馈
	private String booking_uid;//提交人

	public String getBooking_id() {
		return booking_id;
	}

	public void setBooking_id(String booking_id) {
		this.booking_id = booking_id;
	}

	public String getBooking_product() {
		return booking_product;
	}

	public void setBooking_product(String booking_product) {
		this.booking_product = booking_product;
	}

	public String getBooking_encapsulation() {
		return booking_encapsulation;
	}

	public void setBooking_encapsulation(String booking_encapsulation) {
		this.booking_encapsulation = booking_encapsulation;
	}

	public int getBooking_number() {
		return booking_number;
	}

	public void setBooking_number(int booking_number) {
		this.booking_number = booking_number;
	}

	public Float getBooking_price() {
		return booking_price;
	}

	public void setBooking_price(Float booking_price) {
		this.booking_price = booking_price;
	}

	public String getBooking_channel() {
		return booking_channel;
	}

	public void setBooking_channel(String booking_channel) {
		this.booking_channel = booking_channel;
	}

	public String getBooking_status() {
		return booking_status;
	}

	public void setBooking_status(String booking_status) {
		this.booking_status = booking_status;
	}

	public String getBooking_phone() {
		return booking_phone;
	}

	public void setBooking_phone(String booking_phone) {
		this.booking_phone = booking_phone;
	}

	public Date getBooking_date() {
		return booking_date;
	}

	public void setBooking_date(Date booking_date) {
		this.booking_date = booking_date;
	}

	public String getBooking_note() {
		return booking_note;
	}

	public void setBooking_note(String booking_note) {
		this.booking_note = booking_note;
	}

	public String getBooking_uid() {
		return booking_uid;
	}

	public void setBooking_uid(String booking_uid) {
		this.booking_uid = booking_uid;
	}

	public String getBooking_feedback() {
		return booking_feedback;
	}

	public void setBooking_feedback(String booking_feedback) {
		this.booking_feedback = booking_feedback;
	}
	
}
