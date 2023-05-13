
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