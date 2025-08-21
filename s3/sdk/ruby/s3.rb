require 'aws-sdk-s3'
require 'pry'
require 'securerandom'

bucket_name = ENV['BUCKET_NAME']
region = 'eu-north-1'

client = Aws::S3::Client.new

resp = client.create_bucket({
  bucket: bucket_name, 
  create_bucket_configuration: {
    location_constraint: region
  }
})
# binding.pry

number_of_files = 1 + rand(6)
puts "number_of_files: #{number_of_files}"

# Loop to create and upload each file
number_of_files.times.each do |i|
    puts "i: #{i}"
    filename = "file_#{i}.txt"
    output_path = "/tmp/#{filename}"

    # Write a unique UUID to each file
    File.open(output_path, "w") do |f|
        f.write SecureRandom.uuid
    end

    # Open and read the file in binary mode, then upload it to S3
    File.open(output_path, 'rb') do |f|
        client.put_object(
            bucket: bucket_name,
            key: filename,
            body: f
            )
    end
end