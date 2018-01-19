FROM alpine

COPY version /version
COPY run_mriqc.sh /run_mriqc.sh

ENTRYPOINT ["/run_mriqc.sh"]
