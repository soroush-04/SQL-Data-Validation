
import json
import os

json_file_path = 'test_attempt_question_responses-202209061938.json'

# Check if the file exists
if os.path.exists(json_file_path):
    print("JSON file exists.")
else:
    print("JSON file does not exist.")

# Read the JSON array data
# with open(json_file_path, 'r') as json_file:
#     json_data = json.load(json_file)

# Now, json_data is a Python list containing the elements of the JSON array
# You can access elements within the list using indices (e.g., json_data[0], json_data[1], etc.)

# Rest of your code for data comparison
