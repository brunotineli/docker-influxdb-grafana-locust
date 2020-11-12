from locust import HttpLocust, TaskSet, task
from locust_influx import expose_metrics

expose_metrics(interval_ms=2000)

class UserBehavior(TaskSet):
    @task(1)
    def Google(self):
        response = self.client.get('/')
        assert response.status_code is 200, f'Unexpected response code: {response.status_code}'

class DojoLoadTest(HttpLocust):
    task_set = UserBehavior
