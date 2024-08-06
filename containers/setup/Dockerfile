FROM python:3.9.5

# set up location of code
WORKDIR /code
ENV PYTHONPATH=/code/src

# install python requirements
ADD ./containers/setup/requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy create buckets script
# copy repo
COPY ./containers/setup/create_buckets.py /code/create_buckets.py

ENTRYPOINT ["tail", "-f", "/dev/null"]
