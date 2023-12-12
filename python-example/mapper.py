#!/usr/bin/env python
"""mapper.py"""

import sys

# Input: staff data in the format (university_id, university_name, job_title, job_role, employment_type, salary)
for line in sys.stdin:
    # Split the line into fields
    fields = line.strip().split(',')

    # Extract relevant fields
    university_id = fields[0]
    employment_type = fields[4]
    salary = int(fields[5])

    # Emit key-value pairs for the reducer
    # Output key: employment_type
    # Output value: (1, salary)
    print(f"{employment_type}\t1\t{salary}")
