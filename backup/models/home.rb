Model.new(:home, 'Files in /home (docs, local, media, work)') do

  before do
    fail 'please mount external hard disk first' unless File.directory? '/media/usb/home_backup'
  end

  sync_with RSync::Local do |rsync|
    rsync.path   = "/media/usb/home_backup"
    rsync.mirror = true

    rsync.directories do |directory|
      directory.add '~/docs'
      directory.add '~/local'
      directory.add '~/media'
      directory.add '~/work'

      directory.exclude '*~'
      directory.exclude '.o'
    end
  end
end
