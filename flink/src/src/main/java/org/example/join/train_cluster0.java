package org.example.join;

public class train_cluster0 extends BasicMainTable {
	private String id;
	private Integer vendor_id;
	private java.sql.Timestamp pickup_datetime;
	private java.sql.Timestamp dropoff_datetime;
	private Integer passenger_count;
	private Double pickup_longitude;
	private Double pickup_latitude;
	private Double dropoff_longitude;
	private Double dropoff_latitude;
	private String store_and_fwd_flag;
	private long trip_duration;
	public train_cluster0(String id, Integer vendor_id, java.sql.Timestamp pickup_datetime, java.sql.Timestamp dropoff_datetime,
	Integer passenger_count, Double pickup_longitude, Double pickup_latitude, Double dropoff_longitude, Double dropoff_latitude,
	String store_and_fwd_flag, Integer trip_duration) {
		super();
        this.id = id;
		this.pickup_datetime = pickup_datetime;
    }
    public long getTrip_duration() {
        return trip_duration;
    }
}