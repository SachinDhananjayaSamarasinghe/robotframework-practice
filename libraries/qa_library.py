import json
import random
import string


class QALibrary:

    def generate_random_id(self, length=8):
        """Generates a random alphanumeric ID of given length."""
        characters = string.ascii_uppercase + string.digits
        return ''.join(random.choice(characters) for _ in range(length))

    def read_json_file(self, file_path):
        """Reads and returns JSON content from a file."""
        with open(file_path, "r", encoding="utf-8") as f:
            return json.load(f)

    def validate_status_code(self, actual_status, expected_status):
        """Validates that an API status code matches the expected one."""
        if int(actual_status) != int(expected_status):
            raise AssertionError(
                f"Status code mismatch! Expected {expected_status}, got {actual_status}"
            )
        return True
