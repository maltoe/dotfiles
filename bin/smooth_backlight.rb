#!/usr/bin/env ruby

steps       = [1, 5, 10, 15, 20, 30, 45, 70, 100]
current     = `xbacklight -get`.to_f
closest_idx = steps.map { |s| (s - current).abs }.each_with_index.min.last
direction   = ARGV.first == 'up' ? 1 : -1
nextstep    = [[closest_idx + direction, 0].max, steps.size - 1].min

system "xbacklight -set #{steps[nextstep]}" if nextstep != closest_idx
