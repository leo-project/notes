require "aws-sdk"

Endpoint = "localhost"
Port = 8080
AccessKeyId = "05236"
SecretAccessKey = "802562235"
Bucket = "bucket" + rand(10000).to_s + "_"
NumOfBuckets = 1000
NumOfObjects = 100

class LeoFSHandler < AWS::Core::Http::NetHttpHandler
  def handle(request, response)
    request.port = ::Port
    super
  end
end

SP = AWS::Core::CredentialProviders::StaticProvider.new({
  :access_key_id     => AccessKeyId,
  :secret_access_key => SecretAccessKey
})

AWS.config(
  access_key_id: AccessKeyId,
  secret_access_key: SecretAccessKey,
  s3_endpoint: Endpoint,
  http_handler: LeoFSHandler.new,
  credential_provider: SP,
  s3_force_path_style: true,
  use_ssl: false
)

times = {}

s3 = AWS::S3.new
begin
  start_time = Time.now

  # Create bucket
  NumOfBuckets.times.each do |i|
    puts "#{i}/#{NumOfBuckets} (#{i.to_f/NumOfBuckets*100}%)"
    bucket = s3.buckets.create(Bucket + i.to_s)

    # Create a new object
    NumOfObjects.times do |j|
      bucket.objects.create("data" + j.to_s, "12345")
      print "." if j % 10 == 0
    end

    puts
  end

  puts "Start: #{start_time}"
  puts "End: #{Time.now}"
  puts "Elappsed: #{Time.now - start_time}"
rescue => e
  p e
end
