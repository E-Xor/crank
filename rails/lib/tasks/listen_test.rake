namespace :listen_test do

  desc "Playing woth Listen"
  task run: :environment do
    listener = Listen.to(Rails.root.to_s, force_polling: true) do |modified, added, removed|
      # Requires force_polling when listening NFS directories/files
      puts "modified absolute path: #{modified}"
      puts "added absolute path: #{added}"
      puts "removed absolute path: #{removed}"
    end
    puts 'Starting...'
    listener.start # not blocking
    puts 'Sleep...'
    sleep
  end

end
