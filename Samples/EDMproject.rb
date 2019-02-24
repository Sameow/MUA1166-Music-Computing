#name: dijkstra's dumzi dumzi.

edm = "C:/Users/TP_baseline/Desktop/Function Loops Future Music Promo/EDM/FL_Kit_01_BPM_128_D#"
#got alot of other sample folder

start = sample edm, 0
##| rate: -1 #1 is normal, -ve plays backward
##| pan: -1 for left speaker, 1 for right speaker
##| amp: 0 is silence, 1 is full vol
sample edm, 1
sample edm, 2

sample edm, 3
sleep sample_duration edm, 3
sample edm, 4

puts sample_duration edm, 1

##| stop at SwirlingSingers_Step7