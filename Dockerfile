FROM python:3.9-bullseye

RUN apt update && apt install --no-install-recommends -y bluez

WORKDIR /app
COPY bin ./bin
COPY TheengsGateway ./TheengsGateway
COPY pyproject.toml ./
COPY setup.py ./
COPY README.md ./

RUN pip install .

ENTRYPOINT ["python3", "-um", "TheengsGateway"]
CMD ["--host=localhost"]
