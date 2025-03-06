# py-bdd-test

**py-bdd-test** is a Python package designed to facilitate **Behavior-Driven Development (BDD)** testing using the
`behave` framework. It provides **predefined step definitions** and utilities to streamline the creation and execution
of BDD tests.

> ⚠️ **Note:** This package **ONLY works in a Dockerized environment**, meaning you must follow the steps below.

---

## 🚀 Installation & Usage

### 1️⃣ Clone the Repository

```sh
git clone https://github.com/erebos12/py-bdd-test.git
```

### 2️⃣ Copy the `bdd-test` Folder Into Your Project

Your project structure should look like this:

```
my-project-folder/
│── bdd-test/
│   ├── __init__.py
│   ├── behave.ini
│   ├── execute_tests.sh
│   ├── requirements.txt
│   ├── Dockerfile
│   ├── features/
│
├── microservice_1/
├── microservice_2/
├── ...
├── microservice_n/
```

### 3️⃣ Copy `docker-compose-only-tests.yml` & `Makefile` Into Your Project

Your folder structure should now look like this:

```
my-project-folder/
│── bdd-test/
│   ├── __init__.py
│   ├── behave.ini
│   ├── execute_tests.sh
│   ├── requirements.txt
│   ├── Dockerfile
│   ├── features/
│
├── microservice_1/
├── microservice_2/
├── ...
├── microservice_n/
│
├── docker-compose-only-tests.yml
├── Makefile
```

### 4️⃣ Create your own feature file in `bdd-test/features`

You can see some examples below.

Your folder structure should now look like this:

```
my-project-folder/
│── bdd-test/
│   ├── __init__.py
│   ├── behave.ini
│   ├── execute_tests.sh
│   ├── requirements.txt
│   ├── Dockerfile
│   ├── features/
│       ├── your_feature_test01.feature
│       ├── your_feature_test02.feature
│
├── microservice_1/
├── microservice_2/
├── ...
├── microservice_n/
│
├── docker-compose-only-tests.yml
├── Makefile
```

### 5️⃣ Run the Tests

Execute the following command to run the tests:

```sh
make it
```

---

## 📌 Feature Examples

### 🧠 Health Check Endpoint Test

```gherkin
Feature: Test health-check endpoint

  Scenario: health-check endpoint
    When send "GET" to "http://idemax:8080/health-check"
    Then expect response code "200"
```

### 📩 Sending & consuming messages with Kafka

```gherkin
Feature: Sending & consuming JSON by Kafka

  Scenario: Send a JSON message to a Kafka topic
    Given following json
        """
        {
          "index": 1,
          "message": "Hello Kafka"
        }
        """
    When kafka - sending json to broker "kafka:29092" and topic "test-topic"

  Scenario: Consume JSON message from Kafka topic
      When kafka - consuming json from broker "kafka:29092" and topic "test-topic"
      Then json attribute "[0]["message"]" is equal to "Hello Kafka"
      And json attribute "[0]["index"]" is equal to "1"
```

### 🧐 Sending POST request to create a user

```gherkin
Scenario: Create a new user resource
    Given following json
    """
        {
          "name": "John Smith",
          "age": 34
          "gender": "male"
        }
    """
    When send "POST" to "http://my-service:8080/users"
    Then expect response code "201"
    And json attribute "["message"]" is equal to "User created"
```

### ⎋️ Sending DELETE request to remove resource

```gherkin
Scenario: Delete user
    When send "DELETE" to "http://my-service:8080/users/1234"
    Then expect response code "200"
    And json attribute "["message"]" is equal to "User deleted"
```

---

## 🛠 Available BDD Step Definitions

(Die Liste der BDD-Schritte bleibt unverändert)




## 🛠 Available BDD Step Definitions


📌 **BDD Step Definitions Found:**

✅ http_steps.py: 'following csv file content'

✅ http_steps.py: 'sending post to "{url:String}" with auth token'

✅ http_steps.py: 'sending get to "{url}" with auth token'

✅ http_steps.py: 'sending get to "{url}" and query param "{query_params:String}"'

✅ http_steps.py: 'send delete to "{url}" with auth token'

✅ http_steps.py: 'send post to "{url}" and query param "{query_params:String}" with auth token'

✅ http_steps.py: 'sending delete to "{url}" and query param "{query_params:String}" with auth token'

✅ http_steps.py: 'send get to "{url}" append value of context variable "{last_uri_param_value}"'

✅ http_steps.py: 'send get to "{url}" with "{variable}"'

✅ http_steps.py: 'send delete to "{url}" with "{variable}"'

✅ http_steps.py: 'bulk load: send "{number_of_requests:Number}" post requests to "{url:String}""{endpoint:String}"'

✅ http_steps.py: 'expect response code "{status_code:Number}"'

✅ http_steps.py: 'sleep for "{secs}" sec(s

✅ http_steps.py: 'following file "{file}"'

✅ http_steps.py: 'read variable from yaml file "{yaml_file:String}" and read variable "{dict_entry:String}"'

✅ http_steps.py: 'send file by post to "{url}"'

✅ http_steps.py: 'send "{http_method}" to "{url}"'

✅ http_steps.py: 'header "{header_name}" is "{header_value}"'

✅ http_steps.py: 'form-data "{field}" is "{value}"'

✅ http_steps.py: 'wait for "{msecs}" msecs'

✅ json_steps.py: 'print context json'

✅ json_steps.py: 'overwrite json attribute "{attribute_name}" from file "{file_name}"'

✅ json_steps.py: 'overwrite json attribute "{attribute_name}" with'

✅ json_steps.py: 'partial overwrite of json attribute "{attribute_name}" with json from context-variable "{context_variable}"'

✅ json_steps.py: 'partial overwrite of json attribute "{attribute_name}" with following json'

✅ json_steps.py: 'overwrite single json attribute "{attribute_name}" with value "{attribute_value}" in context.json'

✅ json_steps.py: 'set single json attribute "{attribute_name}" with value "{attribute_value}" in context.json'

✅ json_steps.py: 'following json'

✅ json_steps.py: 'following parameter with name "{var_name}" and value {var_value}"'

✅ json_steps.py: 'following json in file "{file_location}"'

✅ json_steps.py: 'json attribute "{json_attribute}" exists'

✅ json_steps.py: 'expect json response is equal to content of file "{json_file}"'

✅ json_steps.py: 'json attribute "{json_attribute}" is equal to "{expected_value}"'

✅ json_steps.py: 'store context.json in context variable "{context_variable:String}"'

✅ json_steps.py: 'store json attribute "{json_attribute}" in context variable "{context_variable:String}"'

✅ json_steps.py: 'store json attribute "{json_attribute}" in variable context.id'

✅ json_steps.py: 'store json attribute "{json_attribute}" in variable context.id2'

✅ json_steps.py: 'store json attribute "{json_attribute}" in variable context.id3'

✅ json_steps.py: 'json attribute "{json_attribute}" is less equal than "{expected_value:Number}" msecs'

✅ json_steps.py: 'response body is equal to json from file "{json_file}"'

✅ json_steps.py: 'json attribute "{json_attribute}" does not exist'

✅ json_steps.py: 'json attribute "{json_attribute:String}" contains "{expected_value:String}"'

✅ json_steps.py: 'json attribute "{json_attribute:String}" matches regex "{regex_value:String}"'

✅ json_steps.py: 'json attribute "{json_attribute:String}" has length "{expected_length:Number}"'

✅ json_steps.py: 'json attribute "{json_attribute:String}" has at least length "{expected_length:Number}"'

✅ json_steps.py: 'json attribute "{json_attribute}" is empty'

✅ json_steps.py: 'json attribute "{json_array_name:String}" contains object'

✅ json_steps.py: 'sort json array "{json_array_name}" by "{sort_by}" and store in context variable "{context_variable}"'

✅ json_steps.py: 'context variable "{context_variable}" is equal to "{expected_value}"'

✅ json_steps.py: 'context variable "{context_variable}" is empty'

✅ kafka_steps.py: 'kafka - sending json to broker "{broker:String}" and topic "{topic:String}"'

✅ kafka_steps.py: 'kafka - consuming json from broker "{broker:String}" and topic "{topic:String}"'

✅ ui_steps.py: 'opening bluconnect login page'

✅ ui_steps.py: 'I enter username and password for user "{username}"'

✅ ui_steps.py: 'I expect to be logged in successfully and see the landing page'

