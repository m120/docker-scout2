FROM alpine:edge
MAINTAINER m120

ENV aws_profile=default
ENV argv="--force"

ENV ARTIFACT /artifact
WORKDIR ${ARTIFACT}

RUN apk --no-cache add py-pip \
 && rm -rf /var/cache/apk/*

RUN pip install --no-cache-dir wheel awsscout2

CMD Scout2 --profile "${aws_profile}" --report-dir scout2-report/"${aws_profile}" "${argv}"
