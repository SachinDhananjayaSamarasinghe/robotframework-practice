import json
import os
import random
import string
import requests

ROBOT_LIBRARY_SCOPE = "GLOBAL"


class QALibrary:

    def __init__(self):
        # Automatically locate your /data folder
        self.data_dir = os.path.join(os.getcwd(), "data")

    # -------------------------------
    # Existing Keywords
    # -------------------------------

    def generate_random_id(self, length=8):
        """Generates a random alphanumeric ID of given length."""
        characters = string.ascii_uppercase + string.digits
        return ''.join(random.choice(characters) for _ in range(length))

    def read_json_file(self, file_path):
        """Reads and returns JSON content from an absolute or relative file path."""
        with open(file_path, "r", encoding="utf-8") as f:
            return json.load(f)

    def validate_status_code(self, actual_status, expected_status):
        """Validates that an API status code matches the expected one."""
        if int(actual_status) != int(expected_status):
            raise AssertionError(
                f"Status code mismatch! Expected {expected_status}, got {actual_status}"
            )
        return True

    # --------------------------------------
    # New Keywords
    # --------------------------------------

    def load_json(self, filename):
        """Load a JSON file from the /data directory."""
        path = os.path.join(self.data_dir, filename)

        if not os.path.exists(path):
            raise FileNotFoundError(f"JSON file not found: {path}")

        with open(path, "r", encoding="utf-8") as f:
            return json.load(f)

    def get_json_value(self, json_data, key):
        """Return a value from a JSON dictionary."""
        return json_data.get(key)

    def generate_random_int(self, min_val=1000, max_val=9999):
        """Generate a random integer ID."""
        return random.randint(min_val, max_val)

    # -------------------------------
    # API Keywords (NEW)
    # -------------------------------

    def get_request(self, url):
        """Send a GET request and return response object."""
        return requests.get(url)

    def validate_response_status_code(self, response, expected_code):
        """Validate HTTP response status code."""
        actual = response.status_code
        if actual != int(expected_code):
            raise AssertionError(
                f"Expected status {expected_code}, but got {actual}"
            )

    def get_json_response(self, response):
        """Return JSON body from response."""
        return response.json()
