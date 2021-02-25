# first stage
FROM python:3.9-slim AS builder
WORKDIR /app

COPY app/requirements.txt .

# install dependencies to the local user directory (eg. /root/.local)
RUN pip install --user -r requirements.txt --no-warn-script-location --no-cache-dir

# second unnamed stage
FROM python:3.9-alpine
WORKDIR /code

# copy only the dependencies installation from the 1st stage image
COPY --from=builder /root/.local /root/.local
COPY app/src .

# update PATH environment variable
ENV PATH=/root/.local:$PATH

#CMD ["sleep","3600"]

CMD [ "python", "./server.py" ]