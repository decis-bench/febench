
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