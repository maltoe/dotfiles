#!/usr/bin/env ruby

steps       = [0.01, 0.05, 0.10, 0.15, 0.20, 0.30, 0.45, 0.70, 1.0]
current     = /\d\.\d+/.match(`xrandr --verbose | grep Brightness | head -n 1`.strip)[0].to_f
closest_idx = steps.map { |s| (s - current).abs }.each_with_index.min.last
direction   = ARGV.first == 'up' ? 1 : -1
nextstep    = [[closest_idx + direction, 0].max, steps.size - 1].min

system "xrandr --output eDP-1 --brightness #{steps[nextstep]}" if nextstep != closest_idx
