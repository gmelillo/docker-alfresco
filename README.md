#docker-alfresco

Latest Alfresco Community Edition

##Setup

1. Run `docker run -p 8080:8080 -p 10022:22 -d gmelillo/docker-alfresco
2. Point your browser on `http://localhost:10080` and try your installation

##Users and password

The root user will be generated automatically and prompted on `docker logs <instanceid>`.

The first administrative user is **admin** with password `AlfrescoAdmin`

