require "aws-sdk"

Endpoint = "localhost"
Port = 8080
AccessKeyId = "05236"
SecretAccessKey = "802562235"
Bucket = "test" + rand(1000).to_s

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

results = {}

s3 = AWS::S3.new
begin
  # Create bucket
  s = Time.now
  s3.buckets.create(Bucket)
  results["Create Bucket"] = Time.now - s
  print "Bucket created successfully\n"

  # Get bucket
  s = Time.now
  bucket = s3.buckets[Bucket]
  results["Get Bucket"] = Time.now - s
  print "Get bucket successfully\n"

  # Create a new object
  s = Time.now
  object = bucket.objects.create("hoge", "fuga")
  results["Create Object"] = Time.now - s
  print "Successfully created text file\n"

  # Get object
  s = Time.now
  print "Your object is :"
  p bucket.objects["hoge"].read
  results["Get Object"] = Time.now - s
  print "Successfully get objects\n"

  # HEAD
  s = Time.now
  metadata = object.head
  results["HEAD Object"] = Time.now - s
  p metadata

  # Copy object
  s = Time.now
  bucket.objects["hoge2"].copy_from("hoge")
  p bucket.objects["hoge2"].read
  results["Copy Object"] = Time.now - s
  print "File copied successfully\n"

  # Rename object or move object
  s = Time.now
  bucket.objects["hoge2"].move_to("hoge3");
  p bucket.objects["hoge3"].read
  results["Rename Object"] = Time.now - s
  print "File rename successfully \n"

  # Show objects in the bucket
  s = Time.now
  bucket.objects.to_a
  results["List Objects"] = Time.now - s

  # Delete object
  s = Time.now
  bucket.objects["hoge"].delete
  results["Delete Object"] = Time.now - s
rescue => e
  p e
ensure
  # Clear bucket
  bucket = s3.buckets[Bucket]
  bucket.clear!

  # Delete bucket
  s = Time.now
  bucket.delete
  results["Delete Bucket"] = Time.now - s
  print "Bucket deleted successfully \n"

  # Show reponse results
  puts "action\tresponse_time"
  puts "-------------------------"
  results.each do |k, v|
    puts "#{k}\t#{v}"
  end
end
