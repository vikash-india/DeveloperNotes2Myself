# Description: REST API Design

# Resource Identification
- All resource names should be noun.
- APIs should be coarse grained instead of fine grained.
    - Use /users for all users.
    - Use /users/1 for a particular users.
- Separate behaviour from the resource name.
    - Bad examples
        - getAllUsers
        - getUser
        - createUser
        - searchUserByName
        - searchUserById
    - Good examples
        - GET /users instead of getAllUser.
        - GET /users/1 instead of getUsers.
        - POST /users instead of createUser.
        - GET /users instead of getAllUser.
        - GET /users?name=xxx instead of searchUserByName
        - GET /users?id=xxx instead of searchUserById
        
### Resource Organisation
- Collection Resources
    /users
    /applications
    /accounts
- Instance Resources
    /users/dilbert
    /applications/a1b2c3
    /accounts/123

### Resource Behaviours
- GET
    - Map HTTP GET method to READ operation.
- PUT
    - Map HTTP PUT method to CREATE as well as UPDATE operations.
    - PUT as CREATE: Map /users/newUserId with full data to CREATE operation.
    - PUT as UPDATE 
        - Map /users/existingUserId with full data to UPDATE operations. 
        - Make sure that all data is supplied even for update. 
        - The HTTP PUT should ideally be an idempotent operation.
- POST
    - Map HTTP POST method to CREATE as well as UPDATE operations.
    - POST as CREATE 
        - Map /users with full data to CREATE operations. 
        - The CREATE operations works at collection resources.
        - The HTTP response should return 201 as success code and the fully qualified URL of the resource as /users/1.
    - POST as UPDATE
        - Map /users/1 to UPDATE operation.
        - Use full data or partial data for the UPDATE operation. 
        - The HTTP response should return 200 OK as success code. 
    - The HTTP POST is ideally not an idempotent operation.
- DELETE
    - Map HTTP DELETE method to DELETE operation.
- HEAD
    - Map HTTP HEAD method to headers without body operation.
- PATCH
    - Still to become a standard.
- HTTP Method Overrides
    - If client cannot support HTTP methods other than GET or POST, allow query parameter like ?_method=DELETE or PUT.
    - HTTP method overriding can also be used to use an API either through a REST client or a web browser.

### Resource Versioning
- Version using URLs
    - Example http(s)://api.domain.com/v1/
- Version Using Media Type
    - Example application/json+foo;application&v=1
    
### Resource Naming Conventions
- JSON and JavaScript use camelCase. Use the same camelCase for REST APIs also.
- Avoid using underscore (_) or hyphen (-) or period (.).
- Use plural form of nouns for collection resources. 

### Responses
- Every accessible resource should have a unique URL which can be sent back as HREF in the response.
- Use HTTP query parameter ?_body=false for POST APIs when it does not make sense to get back a response for CREATE or 
  UPDATE operations. Alternatively, complete information can be sent back as the response of POST.
- Use the ISO 8601 format to represent time in request and responses. Example 2017-07-22T21:04:58.212Z where Z is the 
  timezone.

### Pagination
- Use the query parameter ?offset=50&limit=25 in the URL and embed the same information in the HTTP response as well to
  handle pagination.

### Errors
- status
- code
- property
- message
- developerMessage
- moreInfo

### Security
- Avoid sessions when possible.
- Authenticate every requests if possible.
- Authorize based on resource contents and not URLs.
- Use existing protocol like OAuth 1.0a, OAuth2, Basic over SSL only for authentication.
- Use custom authentication scheme only if you provide client code/SDK.
- Use API keys instead of username/password.

### HTTP 401 Error Code Vs HTTP 403 Error Code
- The 401/Unauthorized Error Code: It actually means unauthenticated. It means "You need valid credentials for me to 
  respond to this request."
- The 403/Forbidden Error Code: It actually means unauthorized. It means "I understood your credentials, but so sorry, 
  you are not allowed."
