#IP_AI_only
Welcome to the secret cache of mangoes.

This repository contains the code made by the student SID2421220/1 (Javier Bharat) for the subject MOD002643 (Image Processing). This repository is an appendix to a document called "Interrogation Report", developed to assist the lecturer in marking. The rest of this readme.md file will be a table detailing the files within this repository and their role in the assignment. NOTE: all external code is referenced via MATLAB's official documentation, such as the layer architecture being under _trainnet_, as an example.

|	File name		|	Description/Role							|
|-------------------------------|-------------------------------------------------------------------------------|
|	trainingdata.zip	|	This file could not be included because it was too large (see Google Drive link in report appendix), but is the output of the program init_ai.m, which uses the "by_field.zip" data from NIST Special Database 19 (See report for source) to preprocess numerical symbols and centralize them for an imageDatastore MATLAB Object to be used to train a neural net. |
|	init_ai.m		|	This script normalizes the data for numerical symbols, but also is the script to train the neural net using stochastic gradient descent with momentum, outputing the resulting objects to files (net.mat for 10 numerical symbols, and finalnet for 14 classification to include swiping). Switching between these two functions, data preprocessing and the actual training, was done using comments. |
|	ai.m			|	This script was used to grab an image, and attempt to classify it using the initial test net of ten 10 classifications, used to aid testing of new data. |
|	curvetest.m		|	This script aided in swipe data generation, was used for testing the sin function for curving swipes. The human hand doing a swipe in any direction is not perfect, so sin was used to mimic this imperfection by curving the swipes in the training data slightly. |
|	swipe_gen.m		|	This script uses the code from the previous one to generate 40,000 swipes for each direction (up, down, left, and right). |
|	snap.m			| 	This script was used to determine suitable ranges for thresholding the white finger and yellow tip attached to the finger, respectively. |
|	net.m			|	This is a plaintext variable storage of the inital test neural net (3rd successful iteration) that allowed ten (10) classifications of numerical symbols only. |
|	finalnet.m		|	This is a plaintext variable storage of the final neural net made with all 14 classifications (2nd successful iteration). This is the same the one that was submitted for the assignment. |	
|	finalnet-1-12-2024-2.png|	This picture shows the training output of the 2nd successful iteration of 14 classification - finalnet.mat. This is what was used to classify in the assignment, the graph simply shows the training loss and accuracy for 2 epochs of training (uses half of the dataset, or 15000 files). |
