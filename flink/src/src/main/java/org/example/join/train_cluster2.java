package org.example.join;

public class train_cluster2 extends BasicMainTable  {
	private java.sql.Timestamp datedate;
	private Double wp1;
	private Double wp2;
	private Double wp3;
	private Double wp4;
	private Double wp5;
	private Double wp6;
	private Double wp7;	
	public train_cluster2(java.sql.Timestamp datedate, Double wp1, Double wp2, Double wp3, Double wp4, Double wp5, Double wp6, Double wp7) {
		super();
		this.datedate = datedate;
    }
    public long getTrip_duration() {
        return datedate.getTime();
    }
}