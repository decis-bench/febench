package org.example.join;

public class train_cluster1 extends BasicMainTable  {
	private Integer Id;
	private String Province_State;
	private String Country_Region;
	private java.sql.Timestamp DateDate;
	private Double ConfirmedCases;
	private Double Fatalities;

	public train_cluster1(Integer Id, String Province_State, String Country_Region, java.sql.Timestamp Date,
	Double ConfirmedCases, Double Fatalities) {
		super();
        this.Id = Id;
		this.DateDate = Date;
    }
    public long getTrip_duration() {
        return DateDate.getTime();
    }
}