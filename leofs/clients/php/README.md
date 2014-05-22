# **> Quick Start LeoFS Access Using PHP-Client**
## Introduction
this guide will get you going with a PHP-Client application how to develop and architect apps for LeoFS. This guide assumes that you have already installed LeoFS environment on Local or Remote node. See [Getting Started with LeoFS](http://leo-project.net/leofs/docs/getting_started.html#getting-started) for more Information.
## Installation & Setup PHP-Client!

### CentOS, Fedora & RHEL:
``` 
##### Install PHP, SDK and Dependencies #####
$sudo yum install php
$php –v 
```
### Debian & Ubuntu based Installation
```
##### Install PHP, SDK and Dependencies #####
$sudo apt-get install php5 php5-json php5-curl
$php –v 
```
```
###### Download Sample Project #####
$git clone https://github.com/leo-project/leofs_client_tests.git
$cd aws-sdk-php
$curl -sS https://getcomposer.org/installer | php
$sudo php composer.phar install
```
### About the Sample    
This sample application is designed to show you how to:
 * Declare a dependency on the AWS SDK for PHP using Composer.
 * Read access keys from environment variables or define it statically in this sample we are using static entry.
 * Instantiate an Amazon Simple Storage Service (Amazon S3) client.
 * Interact with Amazon S3 in various ways, such as creating a bucket and uploading a file.
The project's README file contains more information about this sample code. If you have trouble getting set up or have other feedback about this sample, let us know on [GitHub](https://github.com/leo-project/leofs_client_tests/tree/develop/aws-sdk-php). 
##API Feature List
The storage API is compatible with the Amazon S3 REST API which means that any of the operations listed can be executed using any of the commonly available S3 libraries or tools.
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

##Sample Methods:
The complete API reference is available on the [Amazon site](http://docs.aws.amazon.com/aws-sdk-php-2/latest/class-Aws.S3.S3Client.html). Here we included our sample [script file](https://github.com/leo-project/leofs_client_tests/blob/develop/aws-sdk-php/index.php) which includes major method which is supported by LeoFS.

###Creating a Connection
A simple way to specify your credentials is by injecting them directly into the factory method when instantiating the client object. However, be careful to not hard-code your credentials inside of your applications. Hard-coding your credentials can be dangerous. According to your bucket Name please subdomain name entry as per this [Page](http://leo-project.net/leofs/docs/s3_client.html#edit-etc-hosts). For more detail method you can refer this [page](http://docs.aws.amazon.com/aws-sdk-php/guide/latest/credentials.html#credential-profiles).
```
// Include the SDK using the Composer autoloader
require "vendor/autoload.php";
use Aws\Common\Enum\Region;
use Aws\S3\S3Client;
use Aws\S3\Model\MultipartUpload\UploadBuilder;
use Aws\Common\Exception\MultipartUploadException;
```
```
//Global variable setting
/* memory_set for big size chunk which will be used by Multipart upload 
Here we are using static and common bucket name and file name 
You can change according to your reqirement.  */

ini_set("memory_set",-1);
$bucket_name="test";  
$file_name="testFile";

/* key ==> replace your Access_ID, secret ==> replace your secret_key, base_
url ==> your LeoFS service address, here given credential is LeoFS’s default user’s credential*/

$client = S3Client::factory(array(
    "key" => "05236",
    "secret" => "802562235",
    "region" => Region::US_EAST_1,
    "scheme" => "http",
    "base_url" => "http://localhost:8080"
));
```
```
// OR you can use dynamic Configuration
// create a service builder using a configuration file which contains your credential
$aws = Aws::factory('/path/to/my_config.json');
```
###Creating a Bucket
A simple way to create bucket is given here be careful bucket name should be unique otherwise it will throw S3Exception. For more detail information you can refer this [page](http://docs.aws.amazon.com/aws-sdk-php/latest/class-Aws.S3.S3Client.html#_createBucket).
```
$result = $client->createBucket(array("Bucket" => $bucket_name));
```
###Head Bucket
A Simple to check bucket is exist or not and you have permission to access it. The operation returns a 200 OK if the bucket exists and you have permission to access it. Otherwise, the operation might return responses such as 404 Not Found and 403 Forbidden. doesObjectExist(), waitUntilBucketExists(), and waitUntilBucketNotExists() methods are depends on this method. for more detail information you can refer this [page](http://docs.aws.amazon.com/aws-sdk-php/latest/class-Aws.S3.S3Client.html#_waitUntilBucketExists).
```
$result = $client->createBucket(array("Bucket" => $bucket_name));
```
###Listing a Bucket
You can list all of the buckets owned by your account using the listBuckets method. For more detail information you can refer this [page](http://docs.aws.amazon.com/aws-sdk-php/latest/class-Aws.S3.S3Client.html#_listBuckets).
```
$result = $client->listBuckets();
foreach($result["Buckets"] as $bucket) {
    // Each Bucket value will contain a Name and CreationDate
    print "{$bucket["Name"]} -\t {$bucket["CreationDate"]}\n";
}
```
###Single-Part Object upload
A simple way to upload object via Single-part method from file system which is recommended to use for object less than 100MB in Size. For more detail information you can refer this [page](http://docs.aws.amazon.com/aws-sdk-php/latest/class-Aws.S3.S3Client.html#_createBucket).
```
// PUT Single-Part upload Object
$client->putObject(array("Bucket" => $bucket_name, "Key" => $file_name.".single", "Body" => fopen($file_path, "r")));
if(!$client->doesObjectExist($bucket_name, $file_name.".single")) {
    throw new Exception("Single-part File could not Uploaded Successfully");
}
```
###Multi-Part Object upload
Multipart upload allows you to upload a single object as a set of parts. Each part is a contiguous portion of the object's data. You can upload these object parts independently and in any order. If transmission of any part fails, you can retransmit that part without affecting other parts. After all parts of your object are uploaded, LeoFS assembles these parts and creates the object. In general, when your object size reaches 100 MB, you should consider using multipart uploads instead of uploading the object in a single operation. Advantages: Improved throughput, Quick recovery from any network issues, Pause and resume object uploads Begin an upload before you know the final object size. For more detail information you can refer this [page](http://docs.aws.amazon.com/aws-sdk-php/latest/class-Aws.S3.S3Client.html#_createMultipartUpload).
```
$uploader = UploadBuilder::newInstance()
    ->setClient($client)
    ->setSource($file_path)
    ->setBucket($bucket_name)
    ->setKey($file_name)
    ->setOption("CacheControl", "max-age=3600")
    ->build();
    $uploader->upload();
    if(!$client->doesObjectExist($bucket_name, $file_name)) {
        throw new Exception("Multi-Part File could not Uploaded Successfully");
}
```
###List a Bucket’s Content
Here we request an object iterator and loop over it to retrieve the desired information about the objects (object key, size, and modification time stamp in this case) . For more detail information you can refer this [page](http://docs.aws.amazon.com/aws-sdk-php/latest/class-Aws.S3.S3Client.html#_listObjects).
```
 $iterator = $client->getIterator("ListObjects", array("Bucket" => $bucket_name));
    foreach($iterator as $object) {
        print $object["Key"]."\t".$object["Size"]."\t".$object["LastModified"]."\n";
    }
```
###Head Object
Files in Amazon S3 & LeoFS are called "objects" and are stored in buckets. A specific object is referred to by its key (i.e., name) and holds data. Here, we create a new object with the key name, HEAD request is Metadata of that object. e.g. Size, etag, Content_type etc.. For more detail information you can refer this [page](http://docs.aws.amazon.com/aws-sdk-php/latest/class-Aws.S3.S3Client.html#_headObject).
```
$headers = $client->headObject(array("Bucket" => $bucket_name, "Key" => $file_name));
```
###Download Object
A simple way to download object from LeoFS in to current directory by using SaveAs option. For more detail information you can refer this [page](http://docs.aws.amazon.com/aws-sdk-php/latest/class-Aws.S3.S3Client.html#_createBucket).
```
 $object = $client->getObject(array("Bucket" => $bucket_name, "Key" => "testFile", "SaveAs" => $file_name));
```
###Copy Object
A simple way to copy object on LeoFS same bucket or different bucket We should use this method. Than by using doesObjectExist() method we are checking presence of copied object For more detail information you can refer this [page](http://docs.aws.amazon.com/aws-sdk-php/latest/class-Aws.S3.S3Client.html#_copyObject).
```
$result = $client->copyObject(array("Bucket" => $bucket_name, "CopySource" => "/{$bucket_name}/".$file_name, "Key" => $file_name.".copy"));
if(!$client->doesObjectExist($bucket_name, $file_name.".copy")){
    throw new Exception("File could not Copy Successfully\n");
}
```
###Delete Object
A simple way to delete object from LeoFS by probiding bucket and object name(Key). Multiple object delete method currently not supported but you can perfrom similar operation via using iterator. For more detail information you can refer this [page](http://docs.aws.amazon.com/aws-sdk-php/latest/class-Aws.S3.S3Client.html#_deleteObject).
```
$client->deleteObject(array( "Bucket" => $bucket_name, "Key" => $object["Key"]));
```
###Get a Bucket ACL
A simple way to get bucket ACL is given here. LeoFS support basically support “private”, “public-read” and “public-read-write” types of ACL. Object level ACL is currently not supported For more detail information you can refer this [page](http://leo-project.net/leofs/docs/admin_guide.html?highlight=acl#canned-acl).
```
$acp = $client->getBucketAcl(array("Bucket" => $bucket_name));
```
###Put a Bucket ACL
A simple way to put ACL and restrict different Bucket Acess by this method. For more detail information you can refer this [page](http://leo-project.net/leofs/docs/admin_guide.html?highlight=acl#update-acl-update-a-acl-for-a-bucket-v0-16-0).
```
$client->putBucketAcl(array("ACL" => "public-read-write", "Bucket" => $bucket_name));
```
##Test Script Source Code:
This testing file include all well know methods of phpClient. This script required sample file name as “testFile” at following location in ```$file_path = "../temp_data/$file_name";``` your project Directory. Sample Operation testing Script which is located in downloaded project’s index.php file or you can access  https://gist.github.com/Paras2009/7ca3ebfbdce977f7575a#file-leofs_php_client_testing_script.
##Test Script Output :
You can check sample output of this script via this link https://gist.github.com/Paras2009/7ca3ebfbdce977f7575a#file-leofs_php_client_testing_results.