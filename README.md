## The MRIQC BIDS App

This is the BIDS-App version of MRIQC

### Description
fMRIprep is a functional magnetic resonance imaging (fMRI) data pre-processing pipeline.
It performs basic processing steps (coregistration, normalization, unwarping, noise 
component extraction, segmentation, skullstripping etc.) providing outputs that make 
running a variety of group level analyses (task based or resting state fMRI, graph theory 
measures, surface or volume, etc.) easy. fMRIrep is build around three principles:

  * Robustness - the pipeline adapts the preprocessing steps depending on the input dataset 
    and should provide results as good as possible independently of scanner make, scanning 
    parameters or presence of additional correction scans (such as fieldmaps)
  * Ease of use - thanks to dependance on the BIDS standard manual parameter input is reduced
    to a minimum allow the pipelien to run in an automatic fashion.
  * "Glass box" philosophy - automation should not mean that one should not visually inspect 
    the results or understand the methods. Thus fMRIprep provides for each subject visual 
    reports detailing the accuracy of the most importatnt processing steps.  This combined 
    with the documentation can help researchers to understand the process and decide which 
    subjects should be kept for the group level analysis.

### Documentation
http://mriqc.readthedocs.io

### How to report errors
The documentation of this project is found here: http://mriqc.readthedocs.org/en/latest/.

If you have a problem or would like to ask a question about how to use mriqc, please 
submit a question to NeuroStars.org with an mriqc tag. NeuroStars.org is a platform similar 
to StackOverflow but dedicated to neuroinformatics.

All previous mriqc questions are available here: http://neurostars.org/t/mriqc/

To participate in the mriqc development-related discussions please use the following mailing 
list: http://mail.python.org/mailman/listinfo/neuroimaging Please add [mriqc] to the subject 
line when posting on the mailing list.

All bugs, concerns and enhancement requests for this software can be submitted here: 
https://github.com/poldracklab/mriqc/issues.

### Acknowledgements
TBD

### Usage
This App has the following command line arguments:

		usage: run.py [-h]
		              [--participant_label PARTICIPANT_LABEL [PARTICIPANT_LABEL ...]]
		              bids_dir output_dir {participant,group}

		Example BIDS App entrypoint script.

		positional arguments:
		  bids_dir              The directory with the input dataset formatted
		                        according to the BIDS standard.
		  output_dir            The directory where the output files should be stored.
		                        If you are running group level analysis this folder
		                        should be prepopulated with the results of
		                        theparticipant level analysis.
		  {participant,group}   Level of the analysis that will be performed. Multiple
		                        participant level analyses can be run independently
		                        (in parallel).

		optional arguments:
		  -h, --help            show this help message and exit
		  --participant_label PARTICIPANT_LABEL [PARTICIPANT_LABEL ...]
		                        The label(s) of the participant(s) that should be
		                        analyzed. The label corresponds to
		                        sub-<participant_label> from the BIDS spec (so it does
		                        not include "sub-"). If this parameter is not provided
		                        all subjects should be analyzed. Multiple participants
		                        can be specified with a space separated list.

To run it in participant level mode (for one participant):

    docker run -i --rm \
		-v /Users/filo/data/ds005:/bids_dataset:ro \
		-v /Users/filo/outputs:/outputs \
		bids/mriqc \
		/bids_dataset /outputs participant --participant_label 01

Remove the `--participant_label <ids-list>` argument to get all subjects
processed.

After doing this for all subjects (potentially in parallel), group-wise
reports can be calculated using the group level analysis:

    docker run -i --rm \
		-v /Users/filo/data/ds005:/bids_dataset:ro \
		-v /Users/filo/outputs:/outputs \
		bids/mriqc \
		/bids_dataset /outputs group

### Special considerations
None foreseen
