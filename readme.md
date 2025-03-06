# py-bdd-test

**py-bdd-test** is a Python package designed to facilitate **Behavior-Driven Development (BDD)** testing using the `behave` framework. It provides **predefined step definitions** and utilities to streamline the creation and execution of BDD tests. 

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
│
├── bdd-test/
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
│
├── bdd-test/
│
├── microservice_1/
├── microservice_2/
├── ...
├── microservice_n/
│
├── docker-compose-only-tests.yml
├── Makefile
```

### 4️⃣ Create your own feature file in bdd-test/features

You can see some examples below.

Your folder structure should now look like this:
```
my-project-folder/
│
├── bdd-test/feature01.feature
├── bdd-test/feature02.feature            
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

### 🩺 Health Check Endpoint Test
```gherkin
Feature: Test health-check endpoint

  Scenario: health-check endpoint
    When sending get to "http://idemax:8080/health-check"
    Then expect response code "200"
```

### 📩 Sending JSON to Kafka Test
```gherkin
Feature: Sending JSON to Kafka

  Scenario: Send a JSON message to a Kafka topic
    Given following json
        """
        {
          "index": 1,
          "message": "Hello Kafka"
        }
        """
    When kafka - sending json to broker "kafka:29092" and topic "test-topic"
```

---
