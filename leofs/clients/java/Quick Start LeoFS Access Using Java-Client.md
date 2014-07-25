# Quick Start LeoFS Access Using Java-Client

## Introduction
This article will get you going with a how to develop and architect ``Java-client`` application for LeoFS. This article assumes that you have already installed LeoFS environment on your local or remote node. See [Getting Started with LeoFS](http://leo-project.net/leofs/docs/getting_started.html#getting-started) for more Information.
## Installation and Setup S3 Java-client
The easiest way to install Java on your machine is through the yum or apt package installer. Then we need some additional [Apache Ant](http://ant.apache.org/).

### CentOS, Fedora and RHEL:
```shell
##### Install Java, SDK and Dependencies #####
$ wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u5-b13/jdk-8u5-linux-x64.rpm"
$ sudo yum install jdk-8u5-linux-x64.rpm      # To install JDK
$ sudo yum install ant                        # To install ant
```
### Debian and Ubuntu based Installation

```shell
##### Install JAVA8, SDK and Dependencies #####
$ sudo add-apt-repository ppa:webupd8team/java
$ sudo apt-get update
$ sudo apt-get install oracle-java8-installerdd-apt-repository ppa:webupd8team/java"
$ java -version                                  # To Verfiy your installation
$ sudo apt-get install oracle-java8-set-default  # To Setup java environment
```
```shell
###### Download Sample Project it includes aws-java sdk #####
$ git clone https://github.com/leo-project/leofs_client_tests.git
$ cd aws-sdk-java
```
### About the sample    
This sample application is designed to show you how to:
 * Include a dependency on the aws-sdk using ``build.xml`` file.
 * Read access keys from environment variables or define it statically in this sample we are using static entry.
 * Instantiate an Amazon Simple Storage Service (Amazon S3) client using ```ClientConfiguration()``` method.
 * Interact with Amazon S3 in various ways, such as creating a bucket and uploading a file.

The project's ``README`` file contains more information about this sample code. If you have trouble getting set up or have other feedback about this sample codes, let us know on [GitHub](https://github.com/leo-project/leofs_client_tests/tree/develop/aws-sdk-java). 

##API feature list
The storage API is compatible with the [Amazon S3 REST API](http://docs.aws.amazon.com/AmazonS3/latest/API/APIRest.html) which means that any of the operations listed can be executed using any of the commonly available S3 libraries or tools.

###Bucket-level operation                                                    
  * GET Bucket - Returns a list of the objects within a bucket
  * GET Bucket ACL - Returns the ACL associated with a bucket
  * PUT Bucket - Creates a new bucket
  * PUT Bucket ACL - Sets the ACL permissions for a bucket
  * HEAD Object – Retrieves Bucket metadata.
  * DELETE Bucket - Deletes a bucket

###Object-level operation
  * GET Object - Retrieves an object
  * LIST Object - Retrieves an object list
  * PUT Object - Stores an object to a bucket
  * PUT Object (Copy) - Creates a copy of an object internally or externally
  * HEAD Object - Retrieves object metadata (not the full content of the object)
  * DELETE Object - Deletes an object

###Multipart upload
  * Initiate Multipart Upload - Initiates a multipart upload and returns an upload ID
  * Upload Part - Uploads a part in a multipart upload
  * Complete Multipart Upload - Completes a multipart upload and assembles previously uploaded parts
  * Abort Multipart Upload - Aborts a multipart upload and eventually frees storage consumed by previously uploaded parts.
  * List Parts - Lists the parts that have been uploaded for a specific multipart upload.
  * List Multipart Uploads - Lists multipart uploads that have not yet been completed or aborted.

The *multipart-upload* allows you to upload a single object as a set of parts. Object parts can be uploaded independently and in any order. After all, parts are uploaded, LeoFS assembles an object out of the parts. When your object size reaches 100MB, you should consider using multipart uploads instead of uploading the object in a single operation. Read more about [parallel multipart uploads](http://aws.typepad.com/aws/2010/11/amazon-s3-multipart-upload.html).

![Multipart Upload](http://media.amazonwebservices.com/blog/s3_multipart_upload.png).


Basically, AWS-Java Client have two types of the multipart upload method :

 1. Using the High-Level Java API for Multipart Upload
 2. Using the Low-Level Java API for Multipart Upload
Here we are Using High-level Java API for the multipart upload. For more detail visit [this page](http://docs.aws.amazon.com/AmazonS3/latest/dev/usingHLmpuJava.html).
 

##Sample methods:
The complete API reference is available on the [Amazon site](http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/). Here we included our sample [script file](https://github.com/leo-project/leofs_client_tests/blob/develop/aws-sdk-java/LeoFSSample.java) which includes major method which is supported by LeoFS.

###Creating a connection
A simple way to specify your credentials is by injecting them directly into the factory method when instantiating the client object. However, be careful to NOT *hard-coding* your credentials inside your applications. *Hard-coding* your credentials can be dangerous. According to your bucket name, set ``sub-domain`` name entry as a per [this page](http://leo-project.net/leofs/docs/s3_client.html#edit-etc-hosts). For more detail method you can refer [this page](http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/auth/BasicAWSCredentials.html#BasicAWSCredentials(java.lang.String, java.lang.String)).

```java
        /*  Global variable setting 
         * ---------------------------------------------------------
         * You need to set 'Proxy host', 'Proxy port' and 'Protocol'
         * --------------------------------------------------------- */

ClientConfiguration config = new ClientConfiguration();
        config.setProxyHost("localhost"); // LeoFS Gateway's Host
        config.setProxyPort(8080);        // LeoFS Gateway's Port
        config.withProtocol(Protocol.HTTP);
        final String accessKeyId = "05236";
        final String secretAccessKey = "802562235";
        AWSCredentials credentials = new BasicAWSCredentials(accessKeyId, secretAccessKey);
        AmazonS3 s3 = new AmazonS3Client(credentials, config);
        final String bucketName = "test";
        final String key = "test-key";
        final String fileName = "testFile";
```

```java
/* OR you can use dynamic Configuration via specifying your environmental variable into your shell
  Instantiate a new client for Amazon Simple Storage Service (S3). With no
  parameters or configuration, the AWS SDK for java will look for access keys
  and region in these environment variables: 
  
     AWS_ACCESS_KEY_ID='...'
     AWS_SECRET_ACCESS_KEY='...'
*/
```
For More detail, you can refer [this page](https://github.com/awslabs/aws-java-sample/blob/master/README.md).

## Creating a bucket
A simple way to create bucket is given from here be careful bucket name should be globally unique and must be DNS compatible otherwise it will throw ``S3Exception``. For more information about bucket name restrictions, see http://docs.aws.amazon.com/AmazonS3/latest/dev/BucketRestrictions.html bucket.

```java
   // Create bucket
   s3.createBucket(bucketName);
   if ( s3.doesBucketExist(bucketName) ) {
                System.out.println("Bucket Created Successfully");
    }
```

###Does bucket exists ?
A simple to check bucket is exist or not and you have permission to access it. The operation returns a ``200 - OK`` if the bucket exists and you have permission to access it. Otherwise, the operation might return responses such as ``404 - Not Found`` and ``403 - Forbidden``. For more detail information, you can refer [this  page](http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3.html#doesBucketExist(java.lang.String)).

###Get buckets
You can get list of  all the buckets owned by your account using the ``listbuckets()`` method. You can also enumerate all buckets in your account. For more detail information you can refer this [page](http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3.html#listBuckets()).

```java
    // Retrieve list of buckets
    System.out.println("-----List Buckets----");
    for ( Bucket bucket : s3.listBuckets() ) {
        System.out.println("Bucket:" + bucket.getName() + "\t" + bucket.getCreationDate());
    }
```

###Single-part object upload
A simple way to upload object via the single-part method from your file system which is recommended to use for object less than 100MB in size. For more detail information, you can refer [this page](http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3.html#putObject(java.lang.String, java.lang.String, java.io.File)).

```java
    // File Upload to LeoFS using single part upload method
    String filePath= "../temp_data/" + fileName;
    System.out.println("Uploading a new object to S3 from a file\n");
    File file = new File(filePath);
    s3.putObject(new PutObjectRequest(bucketName, file.getName()+".single", file));
    if ( !doesFileExist(s3, bucketName, fileName+".single") ) {
        throw new IOException("Single Part File could not Uploaded Successfully");
    } else {
        System.out.println("Single Part File Uploaded Successfully");
    }
```

###Multi-part object upload
The *multipart-upload* allows you to upload a single object as a set of parts. Each part is a contiguous portion of the object's data. You can upload these object parts independently and in any order. If transmission of any part fails, you can retransmit that part without affecting other parts. After all, parts of your object are uploaded, LeoFS assembles these parts and creates the object. In general, when your object size reaches 100 MB, you should consider using multipart uploads instead of uploading the object in a single operation.

Advantages: Improved throughput, quick recovery from any network issues, suspend and resume object uploads begin an upload before you know the final object size. For more detail information, you can refer [this page](). This method is very simple in java for more detail you can refer [this class methods](http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/transfer/TransferManager.html).

```java
    // File Upload to LeoFS using multipart upload method
    TransferManager tx = new TransferManager(s3);
    Upload upload = tx.upload(bucketName, file.getName(), file); 
    System.out.println("Transfer: " + upload.getDescription() + "\t" + "State" + upload.getState());

    // You can poll your transfer's status to check its progress
    while ( upload.isDone() == false ) {
        System.out.println(" - Progress: " + upload.getProgress().getBytesTransferred() 
                              + "Byte \t" + upload.getProgress().getPercentTransferred() + "%" );
        Thread.sleep(100);
    } 
    upload.waitForCompletion();
    tx.shutdownNow(Boolean.FALSE.booleanValue());
    if ( !doesFileExist(s3, bucketName, fileName) ) {
        throw new IOException("Multi-part File could not Uploaded Successfully");
    } else {
        System.out.println("File Uploaded Successfully");
    }
```

###Head an object
Files in Amazon-S3 and LeoFS are called ``objects`` and are stored in buckets. A specific object is referred to by its key (i.e., name) and holds data. Here we create a new object with the key name, ``HEAD`` request is metadata of that object.


e.g. ContentLength, ETag, ContentType etc.. For more detail information, you can refer [this page](http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3.html#getObjectMetadata(java.lang.String, java.lang.String)).

```java
    // Head Object
    System.out.println("HEAD Object Test [Start]");
    ObjectMetadata objectMetadata = s3.getObjectMetadata(bucketName, fileName+".single");
    System.out.println("Single Part Metadata => Etag :" + objectMetadata.getETag() + " \tContentLength :" + objectMetadata.getContentLength() );
    if ( file.length() == objectMetadata.getContentLength() && objectMetadata.getETag() == MD5(filePath) ) {
        throw new IOException("Sigle Part File Metadata could not match");
    } else {
        System.out.println("Single Part File MetaData Test passed Successfully");
    }
```

###GET / READ an object
A simple way to download object from LeoFS in to current directory by using read method. For more detail information, you can refer [this page](http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3.html#getObject(com.amazonaws.services.s3.model.GetObjectRequest, java.io.File)).

```java
    // File Download from LeoFS
    System.out.println("GET Object Test [Start]");
    S3Object object = s3.getObject(new GetObjectRequest(bucketName, fileName));
    dumpInputStream(object.getObjectContent(),fileName+".copy");
    File newfile = new File(fileName+".copy");
    if ( file.length() != newfile.length() ) {
        throw new IOException("Downloaded File content-length is not equal");
    }
```

###Copy an object
A simple way to copy object on LeoFS same bucket or different bucket we should use this method than by using the ``exists`` method. we are checking presence of copied object. For more detail information, you can refer [this page](http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3Client.html#copyObject(java.lang.String, java.lang.String, java.lang.String, java.lang.String)).

```java
   // File copy bucket internally
    System.out.println("COPY Object Test [Start]");
    s3.copyObject( bucketName, file.getName(), bucketName, fileName+".copy");
    if (!doesFileExist(s3, bucketName, fileName+".copy") ) {
        throw new IOException("File could not copy Successfully");
    }
```
###Move / Rename an object
This method currently not available via Java client but might be in future it will be available.

###List a bucket’s content
Here we request an object iterator and loop over it to retrieve the desired information about the objects - object key, size, and modification time stamp in this case. For more detail information, you can refer [this page](http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3.html#listObjects(java.lang.String)).

```java
  // Retrieve list of objects from the LeoFS
    ObjectListing objectListing =
        s3.listObjects(new ListObjectsRequest().withBucketName(bucketName));
    System.out.println("-----List objects----");
    for ( S3ObjectSummary objectSummary : objectListing.getObjectSummaries() ) {
        System.out.println(objectSummary.getKey() + " \t Size:" + objectSummary.getSize());
    }
```

###Delete an object
A simple way to delete object from LeoFS by providing bucket and object name - key. The multiple object delete method currently not supported but you can perfrom similar operation via using iterator. For more detail information you can refer [this page](http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3.html#deleteObject(java.lang.String, java.lang.String)).

```java
   // DELETE an object from the LeoFS
    System.out.println("DELETE Object Test [Start]");
    System.out.println("-----List objects----");
    for ( S3ObjectSummary objectSummary : objectListing.getObjectSummaries() ) {
        s3.deleteObject(bucketName, objectSummary.getKey());
        if ( doesFileExist(s3,bucketName,objectSummary.getKey()) ) {
            throw new IOException("Object Not Deleted");
        } else {
            System.out.println(objectSummary.getKey() + " \t\t Deleted Successfully");
        }
    }
```
Currently, ``FileExist`` is not availble in built in AWS Java client. So I made my own trailer made method.
```java
    public static boolean doesFileExist( AmazonS3 s3, String bucketName, String key ) throws AmazonClientException,           AmazonServiceException {
        boolean isValidFile = true;
        try {
            ObjectMetadata objectMetadata = s3.getObjectMetadata(bucketName, key);
        } catch ( AmazonS3Exception s3e ) {
            if ( s3e.getStatusCode() == 404 ) {
                // i.e. 404: NoSuchKey - The specified key does not exist
                isValidFile = false;
            }
            else {
                throw s3e; // rethrow all S3 exceptions other than 404 
            }
        }
        catch ( Exception exception ) {
            exception.printStackTrace();
            isValidFile = false;
        }
        return isValidFile;
    }
```

To dump InputStream into File I created a function ``dumpInputStream(InputStream,FileName)``. It will use to dump stream(string) into file.

```java
    private static void dumpInputStream(InputStream input,String fileName) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(input));
        File file=new File(fileName);
        OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(file));
        int read = -1;
        while ( ( read = (byte) reader.read() ) != -1 ) {
            writer.write(read);
        }
        writer.flush();
        writer.close();
        reader.close();
    }
```
To cound Hashtext(Etag) of local file to verify content's MD5 digest. I created a user define fucntion ``MD5(filePath)`` as below:
```java
public static String MD5( String filePath )
    {
        StringBuffer sb = new StringBuffer();
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            FileInputStream fis = new FileInputStream(filePath); 
            byte[] dataBytes = new byte[1024];

            int nread = 0; 
            while ( (nread = fis.read(dataBytes)) != -1 ) {
                md.update(dataBytes, 0, nread);
            };
            byte[] mdbytes = md.digest();

            //convert the byte to hex format method 1
            for (int i = 0; i < mdbytes.length; i++) {
                sb.append(Integer.toString((mdbytes[i] & 0xff) + 0x100, 16).substring(1));
            }

            System.out.println("Digest(in hex format):: " + sb.toString());
 
        } catch ( java.security.NoSuchAlgorithmException e ) {
            System.out.println(e.getMessage());
        } catch ( Exception e ) {
            System.out.println(e.getMessage());
        }
        return sb.toString();
    }
```


###Get a bucket ACL
A simple way to get bucket ACL is given here. LeoFS basically supports ``private``, ``public-read`` and ``public-read-write`` types of the ACL. *Object level ACL* is currently not supported yet. In java SDK it associated with ``CannedAccessControlList`` which have enume constant like ``Private``,``PublicRead``, ``write`` and ``PublicReadWrite``. For more detail information, you can refer [this page](http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/model/CannedAccessControlList.html). For more detail information about ``getBucketACL`` you can refer this [page](http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3Client.html#getBucketAcl(java.lang.String)).

```java
    System.out.println("#####Default ACL#####");
    AccessControlList acp = s3.getBucketAcl(bucketName);
    List<String> list = new ArrayList<String>();
    System.out.println("Owner ID : " + acp.getOwner());
    for ( Grant grant : acp.getGrants() ) {
        System.out.println("Grantee : " + grant.getGrantee() + " \t Permissions : " + grant.getPermission());
    list.add(grant.getPermission().toString());
    }
    if ( list.contains("FULL_CONTROL") ) {
        System.out.println("Bucket permission is private");
    } 
```

###Put a bucket ACL
A simple way to put ACL and restrict different ``Bucket Acess`` by ``setBucketACl(BucketName,CannedAccessControlList)`` method. For more detail information, you can refer [this page](http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3.html#setBucketAcl(java.lang.String, com.amazonaws.services.s3.model.CannedAccessControlList)).

```java
    System.out.println("\n#####:public_read ACL#####");
    s3.setBucketAcl(bucketName, CannedAccessControlList.PublicRead);
    acp = s3.getBucketAcl(bucketName);
    list.clear();
    System.out.println("Owner ID : " + acp.getOwner());
    for ( Grant grant : acp.getGrants() ) {
        System.out.println("Grantee : " + grant.getGrantee() + " \t Permissions : " + grant.getPermission());
        list.add(grant.getPermission().toString());
    }
    if ( list.contains("READ") && list.contains("READ_ACP") ) {
        System.out.println("Bucket permission is public_read");
    }
```

###Delete a bucket
A simple way to delete bucket using ``deleteBucket(bucketName)`` method. For more detail information, you can refer [this page](http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/AmazonS3Client.html#deleteBucket(java.lang.String)).

```java
    // DELETE a bucket from the LeoFS
    s3.deleteBucket(bucketName);
```

##Test script code:
This testing file include all well know methods of Java SDK. This script required sample file name as ``testFile`` at following location in ``$file_path = "../temp_data/$file_name";`` your project Directory. Sample Operation testing Script which is located in downloaded project’s LeoFSSample.java  file or you can access [script] (https://gist.github.com/PatelParas/8a06ec19283efa4c09ff#file-leofs_java_client_testing_script).

##Test script output :
You can check sample output of this script via [this link] (https://gist.github.com/PatelParas/8a06ec19283efa4c09ff#file-leofs_java_client_testing_results).
