FROM curlimages/curl:latest

COPY poll.sh /poll.sh

ENTRYPOINT ["/poll.sh"]