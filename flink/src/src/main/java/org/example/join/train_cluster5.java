package org.example.join;


public class train_cluster5 extends BasicMainTable  {
	private String Q5_Col100;
	private java.sql.Timestamp Q5_Col101;
	private String Q5_Col0;
	private String Q5_Col102;

	public train_cluster5(String Q5_Col100, java.sql.Timestamp Q5_Col101, String Q5_Col0, String Q5_Col102) {
		super();
		this.Q5_Col101 = Q5_Col101;
    }
    public long getTrip_duration() {
        return Q5_Col101.getTime();
    }
}