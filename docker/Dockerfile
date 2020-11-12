FROM python:3.6

# Set test folder
ENV TESTS_HOME locust-tests
RUN mkdir -p $TESTS_HOME
WORKDIR /$TESTS_HOME

# Volume(s)
VOLUME $TESTS_HOME/reports

# Copy project
ADD pyproject.toml ./

# makes sure we're able install deps on alpine
RUN pip install poetry; \
    poetry config virtualenvs.create false; \
    poetry install --no-interaction --no-dev --no-ansi

# Copy project
COPY . .
RUN find ./ -name "*.sh" -exec chmod +x {} \;

CMD ["./test.sh"]