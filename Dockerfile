FROM python:3.13-slim

# Set the working directory
WORKDIR /opt/dagster/app

# Copy the project files
COPY data-pipeline/ .

# Install the project and dependencies
RUN pip install .

# Set environment variables
ENV DAGSTER_HOME=/opt/dagster/dagster_home
RUN mkdir -p $DAGSTER_HOME

# Expose the port for the gRPC server (default is 4000)
EXPOSE 4000

# Start the code location server
CMD ["dagster", "api", "grpc", "-h", "0.0.0.0", "-p", "4000", "-m", "data_pipeline.definitions"]