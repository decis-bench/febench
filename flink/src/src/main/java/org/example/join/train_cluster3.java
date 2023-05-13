
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