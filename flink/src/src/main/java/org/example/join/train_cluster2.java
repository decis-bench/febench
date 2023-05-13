
/*
 * Copyright 2023 4Paradigm
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
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