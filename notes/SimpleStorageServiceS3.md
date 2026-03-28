1. If we want to store video, audio, images, documents we need some storage service
2. In AWS cloud to store these multi-media files we use S3 bucket
3. S3 will have buckets where we store media files
4. Bucket can have folders , floder contain another folder, folder can contain audio , video or image files
5. S3 will have limit to create buckets which is max 100 buckets per account
6. Each bucket can have unlimited storage
7. Note: Every account has Root user whenever we create any service it better to use alias account instead Root

8. Whatever we upload / create folder in s3 bucket we call it as object

9. upload file (audio, video, image) , public url will be generated
10. Need to enable permissions for public access
11. Need to create policy to make it public access (getObjectPolicy)

12. We can upload static website in s3
13. It will give public url
14. We can customize domain when actual domain will hit redirct to this static website intrenally that is using route53
