kalimba = "C:/Users/TP_baseline/Desktop/Samples/Samples/Kalimba_16bit"
background = "C:/Users/TP_baseline/Desktop/Samples/Samples/Anguk_Excerpt.wav"

use_bpm 90

in_thread do
  bg = sample background, amp: 0.0
  
  8.times do
    amp_vals = line(0.0, 1.0, steps: 8, inclusive: true)
    control bg, amp: amp_vals.tick
    sleep 1
  end
  
  sleep 90 #this is 1 min
  
  8.times do
    amp_vals = line(0.0, 1.0, steps: 8, inclusive: true).reverse
    control bg, amp: amp_vals.tick
    sleep 1
  end
end

with_fx :reverb, mix: 0.3, damp: 0.3, room: 0.7 do
  #with_fx for electronic music making.
  #anything within this block mixed with 30% reverb and 70% original sound.
  #damp is a filter to remove high freq
  #room indicates size of room??
  in_thread do
    sleep 16
    use_random_seed 25
    60.times do #tabla
      slice_divs = [8, 16, 32].choose
      sample :loop_tabla, num_slices: slice_divs, slice: rrand_i(1, slice_divs),
        amp: rrand(0.3, 1.0)
      sleep 16.0 / slice_divs
    end
  end
  
  sleep 24
  with_fx :tremolo, mix: 0.7, phase: 0.25 do
    #mix 70% of process sound with 30% original sound
    #phase is rate of amplitude oscillation
    3.times do
      use_random_seed [45, 82, 45].tick(:seed_val) #can change this to find melodies i like
      [4,2,4].tick(:reps).times do #bcuz of some crescendo thingy
        rhy_vals = stretch(0.25, 8, 0.5, 4, 1, 2).shuffle #0.25*8+0.5*4+1*2=6 beats long
        samps = (0..33).to_a.ring.shuffle.take(rhy_vals.length) #why need ring
        amp_vals = line(0.1, 1.0, steps:15, inclusive: true).reflect.butlast #whats this for? music term used in weblect
        14.times do #14 rhythmic value?
          rand_pan = rrand(-0.5, 0.5)
          sample kalimba, samps.tick(:samps), pan: rand_pan, amp: amp_vals.tick(:amps)
          sleep rhy_vals.tick(:rhy)
        end
        rand_reset
      end
    end
  end
  
end
