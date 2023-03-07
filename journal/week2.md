# Week 2 — Distributed Tracing
This week was focused on adding observability, monitoring and logging (Distributed Tracing) to the application, I managed to follow the guidlines and implemented Honeycomb, X-Ray, AWS CloudWatch Logs and Rollbar succesfully and have them function as intended.

## HoneyComb
#### Added Honeycomb API enviroment variables and key, this will allow events to be sent to Honeycomb.
```
export HONEYCOMB_API_KEY=""
export HONEYCOMB_SERVICE_NAME="Cruddur"
gp env HONEYCOMB_API_KEY=""
gp env HONEYCOMB_SERVICE_NAME="Cruddur"
```
#### Added the following Enviroment Variables to ```backend-flask``` in docker compose file.
This configures OpenTelemetry (OTEL) to send events to Honeycomb using environment variables.
```
OTEL_EXPORTER_OTLP_ENDPOINT: "https://api.honeycomb.io"
OTEL_EXPORTER_OTLP_HEADERS: "x-honeycomb-team=${HONEYCOMB_API_KEY}"
OTEL_SERVICE_NAME: "${HONEYCOMB_SERVICE_NAME}"
```
#### Installed these packages to instrument a Flask app with OpenTelemetry by adding it to ```backend-flask/``` ```requirements.txt``` and ran the ```pip install -r requirements.txt``` to intall packages.
This will be used to instrument the application to send telemetry data to Honeycomb.

```
# Honeycomb ---
opentelemetry-api 
opentelemetry-sdk 
opentelemetry-exporter-otlp-proto-http 
opentelemetry-instrumentation-flask 
opentelemetry-instrumentation-requests
```
#### Initialize Honeycomb
Added the following code to ```app.py``` to initialize a tracer and Flask instrumentation to send data to Honeycomb.
```
from opentelemetry import trace
from opentelemetry.instrumentation.flask import FlaskInstrumentor
from opentelemetry.instrumentation.requests import RequestsInstrumentor
from opentelemetry.exporter.otlp.proto.http.trace_exporter import OTLPSpanExporter
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor
```
```
# Initialize tracing and an exporter that can send data to Honeycomb
provider = TracerProvider()
processor = BatchSpanProcessor(OTLPSpanExporter())
provider.add_span_processor(processor)
trace.set_tracer_provider(provider)
tracer = trace.get_tracer(__name__)
```
```
# Initialize automatic instrumentation with Flask
FlaskInstrumentor().instrument_app(app)
RequestsInstrumentor().instrument()
```
#### Honeycomb Traces
![Honeycomb](assets/honeycomb.png)
#### Created a tracer to create a ```home.activities``` span and added attributes ```home-activities-khuthadzomock-data``` to the span
```
# creating home.activities span
from opentelemetry import trace
tracer = trace.get_tracer("home.activities")
```
```
# Add attributes to span
    with tracer.start_as_current_span("home-activities-khuthadzomock-data"):
       span = trace.get_current_span()
       now = datetime.now(timezone.utc).astimezone()
       span.set_attribute("app.now", now.isoformat())
```
![Honeycomb](assets/khuthadzomockdata.png)
