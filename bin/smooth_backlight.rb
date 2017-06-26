#!/usr/bin/env ruby

LCDDIR = '/sys/class/backlight/intel_backlight'
KBDDIR = '/sys/class/leds/tpacpi::kbd_backlight'

def usage
  puts <<-EOD
  Usage:
#{__FILE__} lcd up
#{__FILE__} lcd down
#{__FILE__} kbd
EOD
exit
end

case ARGV[0]
when 'lcd'
  usage unless ARGV.size == 2

  factor      = `cat #{LCDDIR}/max_brightness`.strip.to_i
  current     = `cat #{LCDDIR}/brightness`.strip.to_i
  steps       = [0.01, 0.05, 0.10, 0.15, 0.20, 0.30, 0.45, 0.70, 1.0].map { |s| s * factor }
  closest_idx = steps.map { |s| (s - current).abs }.each_with_index.min.last
  direction   = ARGV[1] == 'up' ? 1 : -1
  nextstep    = [[closest_idx + direction, 0].max, steps.size - 1].min

  system "echo #{steps[nextstep].to_i} | sudo /usr/bin/tee #{LCDDIR}/brightness"

when 'kbd'

  max      = `cat #{KBDDIR}/max_brightness`.strip.to_i
  current  = `cat #{KBDDIR}/brightness`.strip.to_i
  nextstep = (current + 1) % (max + 1)

  system "echo #{nextstep} | sudo /usr/bin/tee #{KBDDIR}/brightness"

else

  usage

end
