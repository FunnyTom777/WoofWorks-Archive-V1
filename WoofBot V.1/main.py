import json
import re

# Load the responses from the JSON file
with open('woofbot_responses.json', 'r') as f:
    responses = json.load(f)

def get_response(user_input):
    for category, options in responses.items():
        for option in options:
            if re.search(r"(?i)" + re.escape(option['text']), user_input):
                return option['text']

    # Default response for unmatched inputs
    return "I'm sorry, I didn't understand that. Can you please try again?"

# Get user input and respond with a predefined response from the JSON file
user_input = input("Woof! How can I assist you today? ")
response = get_response(user_input)
print(response)
