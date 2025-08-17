# REST API Design Rules - Complete Instructions

## URI Naming and Structure Rules

### RULE 1: Use plural nouns for collections
- **APPLIES TO:** Resource collections
- **CORRECT:** `http://www.myapp.com/api/products`
- **INCORRECT:** `http://www.myapp.com/api/product`

### RULE 2: Single URI per resource
- **APPLIES TO:** Specific resource access
- **CORRECT:** Only `/api/products/3` for product with ID 3
- **INCORRECT:** Having both `/api/product/3` and `/api/products/3`

### RULE 3: No action verbs in URIs
- **APPLIES TO:** All endpoints
- **CORRECT:** 
  - `PUT /api/posts/100`
  - `POST /api/posts`
  - `GET /api/posts`
- **INCORRECT:** 
  - `PUT /api/posts/100/edit`
  - `POST /api/create/posts`
  - `GET /api/getposts`

### RULE 4: Format-independent URIs
- **APPLIES TO:** Response format specification
- **CORRECT:** `/api/cars` (specify format in Accept header)
- **INCORRECT:** 
  - `/api/cars.json`
  - `/api/cars.xml`

### RULE 5: Logical hierarchy in URIs
- **APPLIES TO:** Nested resources
- **CORRECT:** `/api/teams/valencia/players`
- **INCORRECT:** `/api/players/teams/valencia`

### RULE 6: Filters in query parameters, not in path
- **APPLIES TO:** Resource filtering
- **CORRECT:** `/api/names?contains=ry`
- **INCORRECT:** `/api/names/contains/ry`

### RULE 7: Use hyphens for multi-word segments
- **APPLIES TO:** URI segments with multiple words
- **CORRECT:** `/api/about-us`
- **INCORRECT:** 
  - `/api/about_us`
  - `/api/aboutUs`

### RULE 8: Avoid uppercase in URIs
- **APPLIES TO:** All URI segments
- **CORRECT:** `/api/about-us`
- **INCORRECT:** `/api/AboutUs`

### RULE 9: Maximum 2-3 levels of nesting
- **APPLIES TO:** Resource hierarchy
- **CORRECT:** `/teams/borussia-donuts/players`
- **INCORRECT:** `/league/german/teams/borussia-donuts/players/forwards/active` (too many levels)

## Resources and Collections

### RULE 10: Think from consumer perspective
- **APPLIES TO:** Resource naming
- **CORRECT:** Name resources based on what consumers would easily understand
- **INCORRECT:** Using internal technical names or database table names

### RULE 11: Avoid verb usage for resources
- **APPLIES TO:** Resource naming
- **CORRECT:** `/apartments` (for rental/sale apartments API)
- **INCORRECT:** `/getApartments`

### RULE 12: Resources should be nouns
- **APPLIES TO:** Resource naming
- **CORRECT:** `/apartments`, `/teams`, `/players`
- **INCORRECT:** `/getPisos`, `/createTeam`

## HTTP Methods (Verbs)

### RULE 13: GET method for retrieving information
- **APPLIES TO:** Reading data operations
- **PURPOSE:** Retrieve information about a resource, never modify it
- **RESPONSE CODES:** 
  - Success: 200 OK
  - Not Found: 404 Not Found
- **CORRECT:** `GET /users` returns list of users
- **INCORRECT:** Using GET to modify data

### RULE 14: POST method for creating resources
- **APPLIES TO:** Create operations
- **PURPOSE:** Create a single new resource, not a collection
- **PAYLOAD:** Information needed in request body
- **RESPONSE CODES:**
  - Success: 201 Created
  - Bad Request: 400 Bad Request (missing required data)
- **CORRECT:** `POST /cars` creates one car
- **INCORRECT:** `POST /cars` creating multiple cars

### RULE 15: PUT method for complete updates
- **APPLIES TO:** Full resource replacement
- **PURPOSE:** Replace entire existing resource with new content
- **PAYLOAD:** Complete resource in request body
- **RESPONSE CODES:**
  - Success: 200 OK
  - Created (if supported): 201 Created
  - Not Found: 404 Not Found
- **CORRECT:** `PUT /posts/100` with complete post data
- **INCORRECT:** Sending partial data with PUT

### RULE 16: PATCH method for partial updates
- **APPLIES TO:** Partial resource modifications
- **PURPOSE:** Update specific fields without sending complete resource
- **PAYLOAD:** Only fields to be updated
- **RESPONSE CODES:** Similar to PUT
- **CORRECT:** `PATCH /person/1` with `{"email": "new@email.com"}`
- **INCORRECT:** Sending complete resource with PATCH

### RULE 17: DELETE method for removing resources
- **APPLIES TO:** Delete operations
- **PURPOSE:** Remove resource identified by URI
- **RESPONSE CODES:**
  - Success with data: 200 OK
  - Success without data: 204 No Content
  - Not Found: 404 Not Found
  - Forbidden: 403 Forbidden
- **CORRECT:** `DELETE /users/1` removes user
- **INCORRECT:** Including request body with DELETE

## HTTP Status Codes

### RULE 18: Use appropriate 2xx codes for success
- **APPLIES TO:** Successful operations
- **CODES:**
  - 200 OK: General success with response body
  - 201 Created: Resource successfully created
  - 204 No Content: Success with no response body
- **CORRECT:** 201 for POST creating user, 204 for DELETE with no return
- **INCORRECT:** Using 200 for all successes

### RULE 19: Use appropriate 4xx codes for client errors
- **APPLIES TO:** Client-side errors
- **CODES:**
  - 400 Bad Request: Malformed request or missing parameters
  - 401 Unauthorized: Authentication required or invalid
  - 403 Forbidden: Authenticated but not authorized
  - 404 Not Found: Resource doesn't exist
- **CORRECT:** 400 when missing required field "email"
- **INCORRECT:** Using 500 for client validation errors

### RULE 20: Use appropriate 5xx codes for server errors
- **APPLIES TO:** Server-side errors
- **CODES:**
  - 500 Internal Server Error: Unexpected server problem
  - 503 Service Unavailable: Temporary unavailability (maintenance)
- **CORRECT:** 500 for unexpected database failure
- **INCORRECT:** Using 404 for server failures

## CRUD Operations Mapping

### RULE 21: Map CRUD to HTTP methods consistently
- **APPLIES TO:** All CRUD operations
- **MAPPING:**
  - Create → POST
  - Read → GET
  - Update → PUT (full) / PATCH (partial)
  - Delete → DELETE
- **CORRECT:** `POST /films` to create, `GET /films/62` to read
- **INCORRECT:** `GET /createFilm`, `POST /deleteFilm`

## API Versioning

### RULE 22: Version only on breaking changes
- **APPLIES TO:** API version management
- **BREAKING CHANGES:**
  - Removing endpoints or fields
  - Making optional parameters required
  - Changing data types
  - Major functionality changes
- **NON-BREAKING:** Bug fixes, adding optional fields
- **CORRECT:** New version when required field added
- **INCORRECT:** New version for every code change

### RULE 23: Maintain maximum 1-2 versions simultaneously
- **APPLIES TO:** Version lifecycle management
- **STRATEGY:** When v3.0 releases, v2.x becomes deprecated, removed after 6 months
- **CORRECT:** Supporting v2 and v3 only
- **INCORRECT:** Maintaining v1, v2, v3, v4 simultaneously

### RULE 24: Version in URL path preferred
- **APPLIES TO:** Version indication
- **OPTIONS:**
  - Preferred: URL path `/api/v2/products`
  - Alternative: Header `X-API-Version: v2`
  - Alternative: Query parameter `?version=v2`
  - Alternative: Hostname `v2.api.com/products`
- **CORRECT:** `https://my-api.com/api/v2/products`
- **INCORRECT:** Mixing versioning strategies

## REST Principles

### RULE 25: Uniform interface requirement
- **APPLIES TO:** All API interactions
- **REQUIREMENTS:**
  - Resources identified by URIs
  - Manipulation through representations (JSON/XML)
  - Self-descriptive messages
- **CORRECT:** Each resource has unique URI with clear representations
- **INCORRECT:** Multiple ways to access same resource

### RULE 26: Stateless operations
- **APPLIES TO:** All API requests
- **PRINCIPLE:** Server maintains no session state between requests
- **CORRECT:** Send authentication token with each request
- **INCORRECT:** Relying on server-side session storage

### RULE 27: Client-Server separation
- **APPLIES TO:** Architecture design
- **PRINCIPLE:** Client handles UI/UX, server handles data and business logic
- **CORRECT:** Frontend and backend developed independently following API contract
- **INCORRECT:** Tight coupling between client and server implementations

### RULE 28: Cacheable responses
- **APPLIES TO:** Response optimization
- **IMPLEMENTATION:** Use Cache-Control headers appropriately
- **CORRECT:** `Cache-Control: max-age=3600` for stable data
- **INCORRECT:** Not implementing any caching strategy

### RULE 29: Layered system architecture
- **APPLIES TO:** System design
- **PRINCIPLE:** Allow intermediary layers (gateways, load balancers, CDNs)
- **CORRECT:** Client unaware of intermediate layers
- **INCORRECT:** Direct client-to-database connections

## Request and Response Format

### RULE 30: Support JSON as default format
- **APPLIES TO:** Data exchange format
- **PRINCIPLE:** JSON is the most common format for REST APIs
- **IMPLEMENTATION:** Use Content-Type and Accept headers
- **CORRECT:** `Content-Type: application/json`
- **INCORRECT:** Forcing XML-only responses

### RULE 31: Self-descriptive messages
- **APPLIES TO:** All HTTP messages
- **PRINCIPLE:** Each message contains all information needed for processing
- **CORRECT:** Including all necessary headers and complete data
- **INCORRECT:** Assuming context from previous requests

## HATEOAS Principle

### RULE 32: Include related resource links
- **APPLIES TO:** Response hypermedia
- **PRINCIPLE:** Responses should include links to related resources
- **CORRECT:** 
  ```json
  {
    "title": "Game of Thrones",
    "actors": [
      "http://api.com/v2/actors/14",
      "http://api.com/v2/actors/55"
    ]
  }
  ```
- **INCORRECT:** 
  ```json
  {
    "actors": [14, 55, 89]
  }
  ```

### RULE 33: Enable API discovery through links
- **APPLIES TO:** API navigation
- **PRINCIPLE:** Clients discover available actions through provided links
- **BENEFIT:** Reduces coupling, allows API evolution
- **CORRECT:** Server guides client through hypermedia links
- **INCORRECT:** Client constructs URLs manually

## Security Considerations

### RULE 34: Implement appropriate authentication
- **APPLIES TO:** API security
- **OPTIONS:**
  - Basic Auth: User/password in base64
  - API Key: Unique identifier per user
  - OAuth2: Token-based with scopes
  - OpenID: External authentication
- **CORRECT:** Choose based on security requirements
- **INCORRECT:** No authentication for sensitive data

### RULE 35: Use HTTPS for all communications
- **APPLIES TO:** All API endpoints
- **PRINCIPLE:** Encrypt data in transit
- **CORRECT:** `https://api.example.com/users`
- **INCORRECT:** `http://api.example.com/users`

## Additional Best Practices

### RULE 36: Provide comprehensive documentation
- **APPLIES TO:** API usability
- **INCLUDES:** Endpoints, parameters, examples, response formats
- **CORRECT:** Complete OpenAPI/Swagger documentation
- **INCORRECT:** No or outdated documentation

### RULE 37: Implement proper error messages
- **APPLIES TO:** Error responses
- **FORMAT:** Clear, actionable error descriptions
- **CORRECT:** `{"error": "Missing required field: email"}`
- **INCORRECT:** `{"error": "Bad request"}`

### RULE 38: Design for predictability
- **APPLIES TO:** Overall API design
- **PRINCIPLE:** Consistent patterns across all endpoints
- **CORRECT:** All collections use same pagination pattern
- **INCORRECT:** Different patterns for different resources

### RULE 39: Consider rate limiting
- **APPLIES TO:** API protection
- **PURPOSE:** Prevent abuse and ensure availability
- **CORRECT:** Implement and document rate limits
- **INCORRECT:** Unlimited requests allowed

### RULE 40: Plan for deprecation
- **APPLIES TO:** API lifecycle
- **STRATEGY:** Clear deprecation timeline and migration path
- **CORRECT:** 6-month deprecation notice with migration guide
- **INCORRECT:** Sudden API changes without notice
