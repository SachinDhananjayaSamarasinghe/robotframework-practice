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

    def validate_status_code(self, response, expected_status):
        """Validate HTTP status code from a response object."""
        actual = response.status_code
        if actual != int(expected_status):
            raise AssertionError(
                f"Expected status {expected_status}, but got {actual}"
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

    def get_request_allow_failure(self, url):
        """Send GET request and return response without raising exceptions."""
        response = requests.get(url)
        return response

    # Testing with headers

    def load_environment(self, env_name):
        """Load environment configuration."""
        config_path = os.path.join(os.getcwd(), "config", "env.json")

        with open(config_path, "r", encoding="utf-8") as f:
            data = json.load(f)

        if env_name not in data:
            raise ValueError(f"Environment '{env_name}' not found")

        return data[env_name]

    def get_with_headers(self, url, headers):
        """Send GET request with headers."""
        response = requests.get(url, headers=headers)
        return response

    # Testing with response schema validation

    def validate_post_schema(self, post):
        """
        Validate required fields and their data types
        """
        required_fields = {
            "userId": int,
            "id": int,
            "title": str,
            "body": str
        }

        for field, field_type in required_fields.items():
            if field not in post:
                raise AssertionError(f"Missing required field: {field}")

            if not isinstance(post[field], field_type):
                raise AssertionError(
                    f"Field '{field}' should be {field_type.__name__}, "
                    f"but got {type(post[field]).__name__}"
                )

    def validate_post_business_rules(self, post):
        """
        Validate business-level rules
        """
        if post["id"] <= 0:
            raise AssertionError("Post ID must be greater than 0")

        if len(post["title"].strip()) == 0:
            raise AssertionError("Post title must not be empty")

        if len(post["body"].strip()) < 10:
            raise AssertionError("Post body must be at least 10 characters long")

    # Testing with API post collections

    def validate_posts_collection(self, posts):
    """
    Validate a list of post objects returned by the API.
    """
    if not isinstance(posts, list):
        raise AssertionError("Expected a list of posts")

    if len(posts) == 0:
        raise AssertionError("Posts list is empty")

    for index, post in enumerate(posts):
        if "id" not in post:
            raise AssertionError(f"Post at index {index} missing 'id'")

        if "title" not in post:
            raise AssertionError(f"Post at index {index} missing 'title'")

        if not post["title"]:
            raise AssertionError(f"Post at index {index} has empty title")

        if not isinstance(post["id"], int):
            raise AssertionError(
                f"Post at index {index} has invalid id type: {type(post['id'])}"
            )
