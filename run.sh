#! /usr/bin/env bash

datasets='/home/ubuntu/data-sets'


#1 Which state in states.tab.gz has the lowest murder rate?
states=$datasets/states.tab.gz
answer1=$(zcat $states \
    | grep -v '^#' | cut -f1,6 | sort -k2n | head -n1 | cut -f1 \
    | sed 's/"//g')
echo 'answer-1:' $answer1

#2 How many sequence records are in the sample.fa file?
sample=$datasets/sample.fa
answer2=$(cat $sample | grep -v '^>' | wc -l)
echo 'answer-2:' $answer2

#3 How many unique CpG IDs are in cpg.bed.gz?
cpg=$datasets/cpg.bed.gz
answer3=$(zcat $cpg | cut -f4 | sort |  uniq | wc -l)
echo 'answer-3:' $answer3

#4 How many sequence records are in the SP1.fq file?
sp1=$datasets/SP1.fq
answer4=$(grep '^@cluster' $sp1 | wc -l)
echo 'answer-4:' $answer4

#5 How many words on are lines containing the word bloody in hamlet.txt?
# (Hint: use wc to count words).
hamlet=$datasets/hamlet.txt
answer5=$(grep 'bloody' -i $hamlet | wc -w)
echo 'answer-5:' $answer5

#6 What is the length of the sequence in the first record of sample.fa?
# (Hint: use wc to count characters).
answer6=$(grep -v '^>' $sample | head -n1 | tr -d '\n\r' | wc -m)
echo 'answer-6:' $answer6

#7 What is the name of the longest gene in genes.hg19.bed.gz?
genes=$datasets/genes.hg19.bed.gz
answer7=$(zcat $genes \
    | awk '{print $4, $3-$2}' | sort -k2nr | head -n1 | cut -f1 -d' ')
echo 'answer-7:' $answer7

#8 How many unique chromosomes are in genes.hg19.bed.gz?
answer8=$(zcat $genes | cut -f1 | sort | uniq | wc -l)
echo 'answer-8:' $answer8

#9 How many intervals are associated with CTCF (not CTCFL) in peaks.chr22.bed.gz?
peaks=$datasets/peaks.chr22.bed.gz
answer9=$(zcat $peaks | grep 'CTCF$' | wc -l)
echo 'answer-9:' $answer9

#10 On what chromosome is the largest interval in lamina.bed?
lamina=$datasets/lamina.bed
answer10=$(cat $lamina \
    | awk '{print $1, $3-$2}' | sort -k2nr | head -n1 | cut -f1 -d' ')
echo 'answer-10:' $answer10





