# Quick Start LeoFS Access Using Ruby-Client

## Introduction
This article will get you going with a how to develop and architect ``Ruby-client`` application for LeoFS. This article assumes that you have already installed LeoFS environment on your local or remote node. See [Getting Started with LeoFS](http://leo-project.net/leofs/docs/getting_started.html#getting-started) for more Information.
## Installation & Setup Ruby-Client
The easiest way to install Ruby on your machine is through the yum package installer. Then we need some additional Ruby dependancies.

### CentOS, Fedora & RHEL:
```shell
##### Install Ruby, SDK and Dependencies #####
$ sudo yum install ruby
$ sudo yum install gcc g++ make automake autoconf curl-devel openssl-devel zlib-devel httpd-devel 
$ sudo yum install apr-devel apr-util-devel sqlite-devel
$ sudo yum install ruby-rdoc ruby-devel
```
Once you have Ruby installed now you can easily install the ruby gems.
```shell
$ sudo yum install rubygems
```
### Debian & Ubuntu based Installation

```shell
##### Install Ruby, SDK and Dependencies #####
$ sudo apt-get install curl libmagic-dev
$ \curl -L https://get.rvm.io | bash -s stable   # To install rvm
$ source ~/.rvm/scripts/rvm                       # To load RVM into your shell
$ rvm requirements                                # To install dependancies
$ rvm install ruby
$ rvm use ruby --default
```
Once you have Ruby installed now you can easily install the ruby gems.
```ruby
$ rvm rubygems current
```
To check your current default interpreter, run the following:
```shell
$ruby -v
```

```shell
###### Download Sample Project #####
$ git clone https://github.com/leo-project/leofs_client_tests.git
$ cd aws-sdk-ruby
$ gem install aws-sdk
$ gem install content_type  # to check content_type 
```

### About the Sample    
This sample application is designed to show you how to:
 * Declare a dependency on the aws-sdk using rubygemes.
 * Read access keys from environment variables or define it statically in this sample we are using static entry.
 * Instantiate an Amazon Simple Storage Service (Amazon S3) client.
 * Interact with Amazon S3 in various ways, such as creating a bucket and uploading a file.

The project's ``README`` file contains more information about this sample code. If you have trouble getting set up or have other feedback about this sample codes, let us know on [GitHub](https://github.com/leo-project/leofs_client_tests/tree/develop/aws-sdk-ruby). 

##API Feature List
The storage API is compatible with the [Amazon S3 REST API](http://docs.aws.amazon.com/AmazonS3/latest/API/APIRest.html) which means that any of the operations listed can be executed using any of the commonly available S3 libraries or tools.

###Bucket-Level Operation                                                    
  * GET Bucket - Returns a list of the objects within a bucket
  * GET Bucket ACL - Returns the ACL associated with a bucket
  * PUT Bucket - Creates a new bucket
  * PUT Bucket ACL - Sets the ACL permissions for a bucket
  * HEAD Object – Retrieves Bucket metadata
  * DELETE Bucket - Deletes a bucket

###Object-Level Operation
  * GET Object- Retrieves an object
  * LIST Object- Retrieves an object list
  * PUT Object - Stores an object to a bucket
  * PUT Object (Copy) - Creates a copy of an object
  * HEAD Object - Retrieves object metadata (not the full content of the object)
  * DELETE Object - Deletes an object

###Multipart Upload
  * Initiate Multipart Upload - Initiates a multipart upload and returns an upload ID
  * Upload Part - Uploads a part in a multipart upload
  * Complete Multipart Upload - Completes a multipart upload and assembles previously uploaded parts
  * Abort Multipart Upload - Aborts a multipart upload and eventually frees storage consumed by previously uploaded parts.
  * List Parts - Lists the parts that have been uploaded for a specific multipart upload.
  * List Multipart Uploads - Lists multipart uploads that have not yet been completed or aborted.

Multipart upload allows you to upload a single object as a set of parts. Object parts can be uploaded independently and in any order. After all parts are uploaded, LeoFS assembles an object out of the parts. When your object size reaches 100MB, you should consider using multipart uploads instead of uploading the object in a single operation. Read more about parallel multipart uploads [here](http://aws.typepad.com/aws/2010/11/amazon-s3-multipart-upload.html).
![Multipart Upload](./image/multipartUpload.png)

##Sample Methods:
The complete API reference is available on the [Amazon site](http://rubydoc.info/gems/aws/2.4.5/Aws/S3Interfac). Here we included our sample [script file](https://github.com/leo-project/leofs_client_tests/blob/develop/aws-sdk-ruby/leo.rb) which includes major method which is supported by LeoFS.

###Creating a Connection
A simple way to specify your credentials is by injecting them directly into the factory method when instantiating the client object. However, be careful to not hard-code your credentials inside of your applications. Hard-coding your credentials can be dangerous. According to your bucket Name please set sub-domain name entry as per this [Page](http://leo-project.net/leofs/docs/s3_client.html#edit-etc-hosts). For more detail method you can refer this [page](http://www.rubydoc.info/github/aws/aws-sdk-ruby/AWS#config-class_method).

```ruby
## This code supports "aws-sdk v1.9.5"
require "aws-sdk"
require "content_type"
```

```ruby
## Global variable setting

##    AccessKeyID ==> replace your AccessKey ID, 
##    SecretAccessKey ==> replace your Secret AccessKey, base_
##    Endpoint ==> your LeoFS service address, 
##    here given credential is LeoFS’s default user’s credential

Endpoint = "localhost"
Port = 8080
AccessKeyId = "05236"
SecretAccessKey = "802562235"
FileName = "testFile"
ChunkSize = 5 * 1024 * 1024  ## 5 MB chunk size
Bucket = "test" + rand(99999).to_s
```

```ruby
# OR you can use dynamic Configuration via specifying your environmental variable into your shell
# Instantiate a new client for Amazon Simple Storage Service (S3). With no
# parameters or configuration, the AWS SDK for Ruby will look for access keys
# and region in these environment variables:
#
#    AWS_ACCESS_KEY_ID='...'
#    AWS_SECRET_ACCESS_KEY='...'
# LeoFS Http Handler creation
class LeoFSHandler < AWS::Core::Http::NetHttpHandler
  def handle(request, response)
    request.port = ::Port
    super
  end
end
## Credential and configuration's manual specification you can skip this step if you are using environmental variable
SP = AWS::Core::CredentialProviders::StaticProvider.new(
{
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

s3 = AWS::S3.new
```

## Creating a Bucket
A simple way to create bucket is given from here be careful bucket name should be globally unique and must be DNS compatible otherwise it will throw ``S3Exception``. For more information about bucket name restrictions, see http://docs.aws.amazon.com/AmazonS3/latest/dev/BucketRestrictions.html bucket.

```ruby
   # Create bucket
   s3.buckets.create(Bucket)
   puts "Bucket Created Successfully\n"
```

###Does Bucket exists ?
A Simple to check bucket is exist or not and you have permission to access it. The operation returns a ``200 - OK`` if the bucket exists and you have permission to access it. Otherwise, the operation might return responses such as ``404 - Not Found`` and ``403 - Forbidden``. for more detail information you can refer this [page](http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/S3/Bucket.html#exists%3F-instance_method).

```ruby
   if !(s3.bucket.exists?)
     raise "Bucket doesn't exists"
   end
```

###Get Buckets
You can get array of  all the buckets owned by your account using the ``buckets['bucket-name']`` method. You can also enumerate all buckets in your account. For more detail information you can refer this [page](http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/S3/BucketCollection.html#each-instance_method).

```ruby
   # Get bucket
   bucket = s3.buckets[Bucket]
   puts "Get Bucket Successfully\n\n"
   s3.buckets.each do |bucket|
     puts bucket.name
   end
```

###Single-Part Object upload
A simple way to upload object via the single-part method from your file system which is recommended to use for object less than 100MB in size. For more detail information you can refer this [page](http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/S3/S3Object.html#write-instance_method).

```ruby
   # PUT Single-Part upload Object
   file_path = "../temp_data/" + FileName
   fileObject =  open(file_path)

   # PUT object using single-part method
   obj = bucket.objects[FileName + ".single"].write(file: file_path,           content_type: fileObject.content_type)
```

###Multi-Part Object upload
Multipart upload allows you to upload a single object as a set of parts. Each part is a contiguous portion of the object's data. You can upload these object parts independently and in any order. If transmission of any part fails, you can retransmit that part without affecting other parts. After all parts of your object are uploaded, LeoFS assembles these parts and creates the object. In general, when your object size reaches 100 MB, you should consider using multipart uploads instead of uploading the object in a single operation. Advantages: Improved throughput, Quick recovery from any network issues, Suspend and resume object uploads begin an upload before you know the final object size. For more detail information you can refer this [page](http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/S3/MultipartUpload.html).

```ruby
   # PUT object using multi-part method
   puts "File is being upload:\n"
   counter = fileObject.size / ChunkSize
   uploading_object = bucket.objects[File.basename(fileObject.path)]
   uploading_object.multipart_upload(:content_type => fileObject.content_type.to_s) do |upload|
     while !fileObject.eof?
       puts " #{upload.id} \t\t #{counter} "
       counter -= 1
       upload.add_part(fileObject.read ChunkSize) ## 20MB Default size is 5242880 Byte
       p("Aborted") if upload.aborted?
     end
   end
   puts "File Uploaded Successfully\n\n"
```

###List a Bucket’s Content
Here we request an object iterator and loop over it to retrieve the desired information about the objects (object key, size, and modification time stamp in this case) . For more detail information you can refer this [page](http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/S3/ObjectCollection.html).

```ruby
   # List objects in the bucket
   puts "----------List Files---------\n"
   bucket.objects.with_prefix("").each do |obj|
     if !fileObject.size.eql? obj.content_length
        raise " Content length is changed for : #{obj.key}"
     end
     puts "#{obj.key} \t #{obj.content_length}"
   end
```

###Head Object
Files in Amazon S3 & LeoFS are called ``objects`` and are stored in buckets. A specific object is referred to by its key (i.e., name) and holds data. Here, we create a new object with the key name, ``HEAD`` request is metadata of that object. 

e.g. ContentLength, ETag, ContentType etc.. For more detail information you can refer this [page](http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/S3/S3Object.html#head-instance_method).

```ruby
   # HEAD object
   fileObject.seek(0)
   fileDigest = Digest::MD5.hexdigest(fileObject.read)
   metadata = bucket.objects[FileName + ".single"].head
   if !((fileObject.size.eql? metadata.content_length) && (fileDigest.eql? metadata.etag.gsub('"', ''))) ## for future use  && (fileObject.content_type.eql? metadata.content_type))
     raise "Single Part File Metadata could not match"
   else
     puts "Single Part File MetaData :"
     p metadata
   end
   metadata = bucket.objects[FileName].head
   if !(fileObject.size.eql? metadata.content_length)  ## for future use && (fileObject.content_type.eql? metadata.content_type)
     raise "Multipart File Metadata could not match"
   else
     puts "Multipart Part File MetaData :"
     p metadata
   end
```

###GET  or READ Object
A simple way to download object from LeoFS in to current directory by using read method. For more detail information you can refer this [page](http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/S3/S3Object.html#read-instance_method).

```ruby
   # Download File LeoFS to local disk
   File.open(FileName + ".copy", "w+") do |thisfileObject|
     bucket.objects[FileName].read do |chunk|
       thisfileObject.write(chunk)
     end
     thisfileObject.seek(0)
     thisfileDigest = Digest::MD5.hexdigest(thisfileObject.read)
     if !((thisfileObject.size.eql? metadata.content_length) && (fileDigest.eql? thisfileDigest))
       raise "Downloaded File Metadata could not match"
     else
       puts "\nFile Downloaded Successfully\n"
     end
   end
```

###Copy Object
A simple way to copy object on LeoFS same bucket or different bucket We should use this method than by using the ``exists`` method. we are checking presence of copied object. Ruby SDK have two methods ``copy_from`` and ``copy_to``. For more detail information you can refer this [page](http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/S3/S3Object.html#copy_from-instance_method).

```ruby
   # Copy object
   bucket.objects[FileName + ".copy"].copy_from(FileName)
   if !bucket.objects[FileName + ".copy"].exists?
     raise "File could not Copy Successfully\n"
   end
   puts "File copied successfully\n"
```
###Move or Rename Object
A simple way to move or rename object on LeoFS same bucket or different bucket, we are checking presence of moved or renamed object. Ruby SDK have two methods ``move_to`` and ``rename_to``. For more detail information you can refer this [page](http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/S3/S3Object.html#move_to-instance_method).

```ruby
   # Move object
   obj = bucket.objects[FileName + ".copy"].move_to(FileName + ".org")
   if !obj.exists?
     raise "File could not Moved Successfully\n"
   end
   puts "\nFile move Successfully\n"
   # Rename object
   obj = bucket.objects[FileName + ".org"].rename_to(FileName + ".copy")
   if !obj.exists?
     raise "File could not Rename Successfully\n"
   end
   puts "\nFile rename Successfully\n"
```

###Delete Object
A simple way to delete object from LeoFS by providing bucket and object name - key. Multiple object delete method currently not supported but you can perfrom similar operation via using iterator. For more detail information you can refer this [page](http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/S3/S3Object.html#delete-instance_method).

```ruby
   # Delete objects one by one and check if exist
   puts "--------------------Delete Files--------------------\n"
   bucket.objects.with_prefix("").each do |obj|
     obj.delete
     if obj.exists?
       raise "Object is not Deleted Successfully\n"
     end
     # to be not found
     begin
         obj.read
     rescue AWS::S3::Errors::NoSuchKey
         puts "#{obj.key} \t File Deleted Successfully..\n"
         next
     end
     raise "Object is not Deleted Successfully\n"
   end
```

###Get a Bucket ACL
A simple way to get bucket ACL is given here. LeoFS basically supports ``private``, ``public-read`` and ``public-read-write`` types of the ACL. Object level ACL is currently not supported yet. In ruby SDK it displays like ``read``,``read_acp``, ``write`` and ``full_control``. here we are using permisions as collection of permissions as a array. For more detail information you can refer this [page](http://www.rubydoc.info/github/aws/aws-sdk-ruby/AWS/S3/S3Object#acl-instance_method).

```ruby
   puts "Owner ID : #{bucket.acl.owner.id}"
   puts "Owner Display name : #{bucket.acl.owner.display_name}"
   permissions = []
   bucket.acl.grants.each do |grant|
     puts "Bucket ACL is : #{grant.permission.name}"
     puts "Bucket Grantee URI is : #{grant.grantee.uri}"
     permissions << grant.permission.name
   end
```

###Put a Bucket ACL
A simple way to put ACL` and restrict different Bucket Acess by this method. For more detail information you can refer this [page](http://www.rubydoc.info/github/aws/aws-sdk-ruby/AWS/S3/S3Object#acl-instance_method).

```ruby
   bucket.acl = :private
   # OR
   bucket.acl = :public_read
   # OR
   bucket.acl = :public_read_write
   # OR
   bucket.acl = :private
```
###Delete Bucket
A simple way to delete bucket using ``clear`` and ``delete`` methods. For more detail information you can refer this [page](http://rubydoc.info/gems/aws/2.4.5/Aws/S3Interface#delete_bucket-instance_method).

```ruby
  # Bucket Delete
  bucket = s3.buckets[Bucket]
  bucket.clear!  #clear the versions only
  bucket.delete
  puts "Bucket deleted Successfully\n"
```

##Test Script Source Code:
This testing file include all well know methods of Ruby SDK. This script required sample file name as “testFile” at following location in ``$file_path = "../temp_data/$file_name";`` your project Directory. Sample Operation testing Script which is located in downloaded project’s leo.rb  file or you can access https://gist.github.com/PatelParas/aa46d8d6c64e181446ec#file-leofs_ruby_client_testing_script-rb.

##Test Script Output :
You can check sample output of this script via this link https://gist.github.com/PatelParas/aa46d8d6c64e181446ec#file-leofs_ruby_client_testing_script_result.

