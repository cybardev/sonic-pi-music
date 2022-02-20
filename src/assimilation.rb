# Assimilation

# Author: Sheikh

use_random_seed 48

8.times do
  sample :bd_fat, amp: (line 0, 4, steps: 8).tick
  sleep 0.5
end

live_loop :drums_hi do
  sample :bd_fat, amp: 4
  sleep 0.5
end

live_loop :drums_lo do
  sample :bd_boom, amp: 0.5
  sleep 1.25
end

live_loop :synths do
  a_synth :prophet
  a_synth [:saw, :tech_saws].choose
  a_synth :tb303
  a_synth [:tri, :square].choose
end

define :a_synth do |s, n=[2, 4, 8].choose|
  use_synth s
  n.times do
    play 50, release: 0.1, cutoff: rrand(60, 120)
    sleep 0.125
  end
end
