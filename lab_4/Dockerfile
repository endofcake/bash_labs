FROM postgres:9.6.1

ENV PGUSER=postgres PGPASSWORD=password1

# Some non-essential usability improvements
COPY ./scripts/ /scripts/
RUN for file in /scripts/*; do $file; done
