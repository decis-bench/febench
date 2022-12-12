package org.example.join;


public class train_cluster3 {
	private String Q3_Col31;
	private String Q3_Col3;
	private java.sql.Timestamp Q3_Col32;
	private java.sql.Timestamp Q3_Col33;	
	private String Q3_Col6;
	private String Q3_Col34;


	public train_cluster3(String Q3_Col31, String Q3_Col3, java.sql.Timestamp Q3_Col32, java.sql.Timestamp Q3_Col33, String Q3_Col6, String Q3_Col34) {
		this.Q3_Col32 = Q3_Col32;
    }
    public long getTrip_duration() {
        return Q3_Col32.getTime();
    }
}