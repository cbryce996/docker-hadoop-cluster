#!/usr/bin/env python
"""reducer.py"""

import sys

current_key = None
count = 0
total_salary = 0
service_type_count = {}
job_role_count = {}
salaries = []

# Input: key-value pairs from the mapper (employment_type, 1, salary)
for line in sys.stdin:
    fields = line.strip().split('\t')

    # Extract key and values
    key = fields[0]
    count = int(fields[1])
    salary = int(fields[2])

    # Update counts and total salary
    if key != current_key:
        if current_key is not None:
            # Output results for the previous key
            if current_key == "Full-Time" or current_key == "Part-Time":
                print(f"{current_key} Staff Count: {count}")
            elif current_key in service_type_count:
                avg_salary = total_salary / count
                print(f"Avg Salary for {current_key} Staff: {avg_salary}")
            elif current_key in job_role_count:
                print(f"Count of {current_key} Staff: {count}")

            # Track salaries for staff earning below average
            if salaries:
                print(f"Staff Earning Below Average Salary for {current_key}: {len(salaries)}")

        # Reset variables for the new key
        current_key = key
        count = 0
        total_salary = 0
        service_type_count = {}
        job_role_count = {}
        salaries = []

    # Update counts and total salary
    count += 1
    total_salary += salary

    # Track service type counts
    if key not in service_type_count:
        service_type_count[key] = 1
    else:
        service_type_count[key] += 1

    # Track job role counts
    job_role = fields[3]  # Assuming the job role field is at index 3
    if job_role not in job_role_count:
        job_role_count[job_role] = 1
    else:
        job_role_count[job_role] += 1

    # Track salaries for staff earning below average
    if salary < avg_salary:
        salaries.append(salary)

# Output results for the last key
if current_key is not None:
    if current_key == "Full-Time" or current_key == "Part-Time":
        print(f"{current_key} Staff Count: {count}")
    elif current_key in service_type_count:
        avg_salary = total_salary / count
        print(f"Avg Salary for {current_key} Staff: {avg_salary}")
    elif current_key in job_role_count:
        print(f"Count of {current_key} Staff: {count}")

    # Track salaries for staff earning below average
    if salaries:
        print(f"Staff Earning Below Average Salary for {current_key}: {len(salaries)}")