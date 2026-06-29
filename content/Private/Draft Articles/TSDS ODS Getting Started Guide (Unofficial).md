---
created: 2025-05-13T07:24:24-05:00
modified: 2025-05-15T11:53:58-05:00
---
# ![[tsds-vendor-sdk-installation-guide-2025.2.1.pdf]]
> **Create a complete, developer-friendly onboarding guide that explains how to install, configure, and test the TSDS ODS SDK locally using Docker and Swagger, with working API examples and a Postman collection—targeted at first-time users who need to register a new education organization and authenticate successfully.**

### 📌 Summary for Your Portfolio/Resume

> Documented the complete local onboarding process for the Texas Student Data System SDK, enabling new developers to install, configure, and test the platform using Docker, Swagger, and Postman. Reversed-engineered endpoint usage to demonstrate key flows like authentication and organization registration.
# Document Comments
### 🧠 Project Execution Questions

 - [ ] Have I successfully spun up all relevant containers (webapi, swagger, db, admin)?
    
 - [ ] Can I authenticate and call a protected API endpoint?
    
 - [ ] Did I log or document environment variables and ports I used?
    
 - [ ] Have I interacted with the Swagger UI (or Postman) to test endpoint requests?
    
 - [ ] Did I explore the structure of the OpenAPI schema and group endpoints by function?
    
 - [ ] Did I modify or explore `.env` or Docker Compose to test deployment changes?
    
 - [ ] Do I have screenshots or diagrams to support the written guide?
### 📄 Documentation Readiness

- [ ]  Can I cleanly document the authentication flow?
    
- [ ]  Can I create a sample use case walkthrough?
    
- [ ]  Can I verify and describe the database structure or naming pattern?
    
- [ ]  Can I summarize at least 3 core API endpoints with example calls?

### ✅ Phase 1: Foundation & Planning

**Objective:** Document what you have, plan the structure, and define scope.

- **Confirm API Token Access:** Test basic authentication to a known endpoint (e.g., `GET /api/data/v3/2025/educationOrganizations`) using Postman or `curl`. This confirms you have a working token.
    
- **Inventory Available Resources:**
    
    - What endpoints are visible in Swagger?
        
    - Are there example payloads or response bodies?
        
    - What Postman collections or scripts (if any) are provided?
        

---

### 🏗️ Phase 2: MkDocs Site Setup

**Objective:** Launch a clean, browsable docs site with a clear information hierarchy.

- **Suggested Structure:**
    
    - Home (Overview, Purpose)
        
    - Getting Started (Setup, Requirements)
        
    - Architecture Diagram (include your own flowchart here)
        
    - SDK Services Overview (explain Docker services & ports)
        
    - API Basics (auth, Swagger usage, endpoints)
        
    - Common Use Cases (CRUD example, register instance)
        
    - Advanced Topics (Bulk CSV registration, modifying the env)
        
    - Troubleshooting / FAQ
        
- **Tooling:**
    
    - Use Material for MkDocs for a professional look.
        
    - Integrate Mermaid.js diagrams for visual flows.
        
    - Embed Postman collection links or import buttons (`Run in Postman`).
        

---

### 📸 Phase 3: Enhancements

**Objective:** Add value beyond the original doc.

- Include:
    
    - Screenshots of Swagger UI, Admin App registration process
        
    - Diagrams (e.g., Docker container flow, API request lifecycle)
        
    - Explanations for terms a beginner wouldn't know (e.g., "Swagger", "env file", "instance")
        
    - Clear steps for creating/modifying `.env` and `.yml` files
        
- Create a basic Postman collection for:
    
    - `GET` list of education organizations
        
    - `POST` to register something if possible
        
    - Include environment setup and auth token retrieval
        

---

### 🎯 Phase 4: Positioning for Recruiters

**Objective:** Make your effort clear, professional, and recruiter-friendly.

- Add a **project summary section** on your portfolio site or a dedicated README:
    
    - What the SDK is for
        
    - Your contributions (clarifying, visualizing, organizing)
        
    - Challenges you overcame (e.g., learning Docker, OpenAPI, authentication)
        
    - Link to your live MkDocs site
        
    - Optional: link to GitHub repo with the source
        
- Update your **resume** with a bullet like:
    
    > Created an improved developer-friendly guide to the Texas Student Data System SDK, enhancing original docs with diagrams, Postman collections, and API walkthroughs using MkDocs and Docker.
---

## ✅ Step 1: Establish Your Purpose (Narrow Scope)

Ask yourself:

- **What is the main task you're demonstrating?**  
    Example: “Registering a new LEA or education organization,” “Retrieving student data,” or “Connecting to the API from a local admin app.”
    
- **Who is your imagined audience?**  
    A developer integrating with TSDS? A sysadmin trying to test it locally? A tech writer documenting it for TEA staff?
    

> 🎯 Based on your earlier goals, it makes sense to focus on endpoints that:
> 
> - Are likely used first when setting up (e.g., authentication, educationOrganizations, instance registration)
>     
> - Represent a clear CRUD pattern (Create, Read, Update, Delete)
>     

---

## 🧭 Step 2: Categorize & Audit the Swagger Endpoints

Start from the Swagger UI at: `http://localhost:5000/swagger/` (or whatever your port is).

Make a spreadsheet or Markdown list from the Swagger categories. Example:

|Tag/Group|Sample Endpoint|Purpose (Guess)|Worth Documenting?|
|---|---|---|---|
|`educationOrganizations`|`GET /educationOrganizations`|List orgs|✅ Yes|
|`identity`|`POST /identities`|Create new identity|✅ Yes|
|`students`|`GET /students`|Fetch students|Maybe|
|`schoolYearTypes`|`GET /schoolYearTypes`|System metadata|❌ No|
|`token`|`POST /token`|Authentication|✅ Yes|

Focus on 5-7 endpoints across 3-5 useful categories:

- `/token` – how to authenticate
    
- `/educationOrganizations` – how to list/create
    
- `/instances` – register or modify admin instance (if exposed)
    
- `/students` – simple data retrieval
    
- One “non-obvious” endpoint that required troubleshooting or discovery
    

---

## 🧪 Step 3: Learn How to Test Localhost in Postman

To use Postman with the local Swagger setup:

1. **Base URL:**  
    Use `http://localhost:5000` (or your Docker container’s exposed port).
    
2. **Token Authorization (if required):**  
    Use the `POST /token` endpoint with `grant_type=password`, `client_id`, etc. from your `.env`.
    
3. **Import Swagger:**
    
    - In Postman, click _Import_ → _Link_ and paste your local Swagger URL:  
        `http://localhost:5000/swagger/v1/swagger.json`  
        This will pull in all endpoints for easier testing.
        
4. **Create Environment in Postman:**  
    Define:
    
    json
    
    CopyEdit
    
    `{   "base_url": "http://localhost:5000",   "token": "paste token here" }`
    
    Then use `{{base_url}}/api/data/v3/2025/educationOrganizations` in your requests.
    

---

## 🔍 Step 4: Find Out What You Don’t Know (and Where to Look)

Here are specific unknowns and where to search:

|Question|Where to Search|
|---|---|
|What are the required fields for creating an instance/org?|Swagger → Look at schema or request body model|
|What kind of authentication does `POST /token` use?|Check `.env` or Swagger auth scheme|
|How is the “instance registration” step done via API?|Search `instances`, `adminApp`, or `register` tags|
|What’s the data model for a student or organization?|Swagger → Expand GET endpoints and view responses|
|Are there any CSV upload examples or bulk endpoints?|The PDF doc or the Admin App Docker container (UI may show the CSV structure)|

---

## 🧱 Step 5: Build the Document Scaffold

Here’s a basic outline you can build inside MkDocs or even Obsidian for drafting:

markdown

CopyEdit

`1. Introduction   - What is TSDS ODS SDK?   - Who this guide is for  2. Local Environment Overview   - Docker services explained   - Swagger overview  3. Authentication   - POST /token   - How to get and use a bearer token  4. Core Entities   - educationOrganizations     - GET example + response     - POST example + required fields   - students (optional)  5. Registering an Admin App Instance (if applicable)   - Endpoint used   - Required fields or caveats  6. Testing with Postman   - Environment setup   - Common errors  7. Tips, Limitations, and Missing Pieces`

---

## ✅ Actions You Can Take Now

-  Import the Swagger JSON into Postman.
    
-  Pick 5-7 endpoints and audit their request/response structure.
    
-  Document how to get a token with the current `.env`.
    
-  Create a scratchpad with a table of all endpoint tags/categories.
    
-  Create a starter doc: “Getting Started with TSDS ODS SDK.”
## Unofficial Educational Reference  
> This project is an independently developed, unofficial reference intended for educational and demonstration purposes. It is not affiliated with, endorsed by, or supported by the Texas Education Agency (TEA), Ed-Fi Alliance, or any associated entities.

All insights are based on publicly available Docker containers, environment files, and open documentation. No proprietary code, private data, or copyrighted content is reproduced.
## Overview

SDK Version  
2025.2.1 
October 2024

This project is a **self-directed technical documentation initiative** that aims to clarify and simplify the Texas Student Data System (TSDS) Operational Data Store (ODS) SDK - specifically its Swagger/OpenAPI interface and containerized architecture.

It is designed as an **educational resource and onboarding aid** for those working with or exploring TSDS and Ed-Fi data systems. 

Rather than serving as an official or exhaustive reference, the goal is to provide **practical guidance and approachable documentation** for navigating, deploying, and understanding the API layer behind Texas’s state-wide education data platform.

This guide is intended for:

- **Developers** seeking to understand the API structure and authentication flow of the ODS platform
    
- **Data analysts or engineers** trying to explore or test TSDS data endpoints locally
    
- **IT administrators** who need context around the Docker-based deployment and access patterns
    
- **Technical writers or documentation specialists** wanting a concrete example of API documentation in a complex public sector data system
    

By breaking down the setup, authentication, and schema structure, this project lowers the barrier to entry for professionals working with educational APIs and showcases how open-source tools can be used to reverse-engineer and document real-world systems.

## Why This Project?  
While researching technical writing roles (especially in the public sector and edtech) I repeatedly encountered job postings requiring experience with **TSDS**, **Ed-Fi**, and education-specific APIs. Yet hands-on documentation or learning resources for these tools were sparse, fragmented, or buried within large vendor ecosystems.

I created this project to bridge that gap.

By reverse-engineering the **TSDS ODS SDK** and exploring its **Swagger/OpenAPI** implementation through Docker, I developed a clearer understanding of how Texas’s education data systems operate under the hood. This process allowed me to:

- Gain direct experience with a real-world API and data model used across the state
- Practice working with open-source tooling and containerized environments
- Showcase initiative in learning complex, domain-specific systems from the ground up

This guide serves both as a **learning artifact** and a **proof of capability** - demonstrating my ability to analyze, interpret, and document unfamiliar technical systems in a way that supports developer onboarding and cross-functional understanding.

---
## What I Did:

<!-- Not done so I'm not sure this is what I did yet -->


---
## Tools Used:

Docker, Swagger UI, OpenAPI, VS Code, YAML, SQL Server, Markdown

---
## Glossary

- **TSDS (Texas Student Data System)**  
    A state-managed education data initiative by the Texas Education Agency (TEA) that standardizes and integrates student data collection, validation, and reporting across districts.
    
- **ODS (Operational Data Store)**  
    A transactional database used in the TSDS system to collect and store raw, normalized education data from local education agencies (LEAs). It serves as the backend for many reporting and analytics tools.
    
- **Ed-Fi**  
    An open-source data standard and API framework developed by the Ed-Fi Alliance. It defines a common model for educational data interoperability and is used as the foundation for the TSDS ODS.
    
- **LEA (Local Education Agency)**  
    A school district or other local authority responsible for administering public education at the community level. In Texas, LEAs submit student data to the TSDS system.
    
- **Education Organization**  
    A general term in the Ed-Fi model referring to entities like schools, districts, or state agencies involved in the educational process. It provides structure to how data is linked across entities.
    
- **Swagger UI**  
    A web-based interface that dynamically generates documentation from an OpenAPI spec, enabling developers to explore and test API endpoints interactively.
    
- **OpenAPI**  
    A specification for defining RESTful APIs in a machine-readable format. It standardizes how APIs are described and documented.

---
## Prerequisites
- Docker Desktop installed
- ODS Admin App and ODS API images ready
- Basic knowledge of APIs and OAuth

---
## Setup Instructions

This section helps you get the TSDS ODS Docker environment up and running for local exploration and testing.

---
### 1. Prerequisites

- Docker Desktop installed (Windows, Mac)  
    Download Docker Desktop
    
- Git (optional, for cloning repos)  
    [Download Git](https://git-scm.com/downloads)
    
- Recommended: At least 16 GB RAM for smooth container performance
    

---

### 2. TSDS ODS Docker Setup

The Texas Education Agency provides an official guide for setting up the ODS Docker environment:

📄 **Download the official Docker Setup PDF**  
_(Texas Student Data System – Docker Installation Guide for Texas Ed-Fi ODS)_

This PDF includes:

- How to pull and run the required Docker images
    
- Environment variable setup
    
- SQL Server setup and database initialization
    
- Accessing Swagger and Admin tools
    

---

### 3. Accessing Services After Setup

Once the containers are running, the default services are exposed on the following ports:

|Service|URL|Port|
|---|---|---|
|Swagger UI|`http://localhost:54746/swagger`|54746|
|Admin App|`http://localhost:5000` (if included)|5000|
|SQL Server|`localhost,1433` (connect via SSMS or Azure Data Studio)|1433|
|Identity Server (STS)|`http://localhost:5001`|5001|

> **Note:** These ports are defined in the `docker-compose.yml` file. You can change them if needed.
> 
### 1. Component Overview

You can add a **brief explanation of each service**, helping new users understand what’s being deployed.

|Service|Description|
|---|---|
|`db`|SQL Server Express container hosting all TSDS Ed-Fi databases.|
|`db-tools`|Initializes and populates the databases (admin, ODS, security).|
|`webapi`|Core Ed-Fi ODS Web API, exposes `/data/v3/ed-fi/...` endpoints.|
|`swagger`|Swagger UI interface to explore and test API endpoints.|
|`adminapp`|Admin web app used for creating ODS instances and managing settings.|

---

### 2. Default Ports (Include in Setup Instructions)

Make it easy for users to access services locally:

|Service|Port Variable|Default Value (if not overridden)|Access URL|
|---|---|---|---|
|SQL Server|`SQL_SERVER_PORT`|1433|Used for db connections|
|Web API|`WEBAPI_PORT`|54746 (commonly)|`http://localhost:54746`|
|Swagger|`SWAGGER_PORT`|54747|`http://localhost:54747/swagger`|
|Admin App|`ADMINAPP_PORT`|54748|`http://localhost:54748`|

> You can advise users to check their `.env` file or Docker variables for these port mappings.

---

### 3. Connection Strings

These show the exact **database names** and templates used:

- `TSDS_EdFi_Admin_2025`
    
- `TSDS_EdFi_Ods_{0}_2025` (ODS database; `{0}` will be replaced with the LEA ID, e.g. `701603`)
    
- `TSDS_EdFi_Security_2025`
    

> ✅ You can explain in the guide that ODS databases are LEA-specific and dynamically named.

---

### 4. Healthchecks & Debugging Tips

Every service includes a `sqlcmd` health check that tests for the existence of its respective database. This implies:

- The databases are preloaded or provisioned on startup.
    
- If Swagger or Web API doesn’t work, the issue may lie in DB initialization (`db-tools`).
    

Include a **troubleshooting tip** like:

> If Swagger or Web API fails to load, check whether `db-tools` successfully initialized the databases by viewing its logs:

bash

CopyEdit

`docker logs db-tools-2025.2.1`

---

### 5. Cross-Platform Network Configuration

This section in `swagger` and `adminapp`:

yaml

CopyEdit

`- WebApiVersionUrl=http://kubernetes.docker.internal:${WEBAPI_PORT} # - WebApiVersionUrl=http://192.168.1.64:${WEBAPI_PORT}`

Means:

- **Mac/Windows users** should use `kubernetes.docker.internal` to access local services from within containers.
    
- **Linux users** must substitute with the actual host IP.
    

> Include a quick cross-platform note:

markdown

CopyEdit

``🛠️ If you're on Linux and Swagger doesn't connect to the API, replace `kubernetes.docker.internal` with your machine's local IP (e.g. `192.168.1.10`) in the `docker-compose.yaml` or `.env` file.``

---

### 6. Secret Keys in Swagger

yaml

CopyEdit

`- POPULATED_SECRET=WvgLvbYdZ29OhUQZKdrA7ga1 - POPULATED_KEY=Zzz13no8ZsiT`

Not required to interact with Swagger but these may be **used to auto-fill Swagger with example data**. You could note:

> These are preset keys to populate the Swagger UI with sample test data or credentials, if enabled by the API.

---

### 7. Changelog Reference

Include the link in your setup guide:

> 📄 **Change Log (2023-2024):**  
> [TSDS ODS SDK Upgrade Change Log (PDF)](https://www.texasstudentdatasystem.org/sites/texasstudentdatasystem.org/files/2023-2024-postaddendum-upgrade-change-log.pdf)

(⚠️ 2025 version not yet updated.)
## Authentication Flow

## 🔐 Authentication Flow (Client Credentials Grant)

The Ed-Fi ODS / TSDS API uses **OAuth 2.0 Client Credentials Grant** for authenticating machine-to-machine interactions. This flow is typically used when a backend service, like Swagger UI, needs to authenticate without user interaction.

## 🔑 Creating Secure OAuth Credentials via the Admin App

To securely authenticate with the Ed-Fi ODS API, you must register a **vendor and application** in the Admin App. 

This generates your unique `client_id` and `client_secret`.

### 🧭 Steps to Set Up Application Security (via Admin App)

1. **Access the Admin App**
    
    - Navigate to your running Admin App instance (usually `http://localhost:54799`)
        
    - Login using the credentials set during deployment or defaults if in dev
        
2. **Add a Vendor**
    
    - Go to the **Global** tab or **Vendors** section
        
    - Click **"Add Vendor"**
        
    - Provide a name (e.g., `Your District Name` or `My Integration Tool`)
        
3. **Create an Application for That Vendor**
    
    - Under your newly created vendor, click **"Add Application"**
        
    - Fill out application details:
        
        - **Name**: Something meaningful like `Data Exporter`
            
        - **Education Organization**: Choose the org that app is associated with
            
        - **Claim Set**: Select the appropriate permission set (e.g., `District-Level Access`)
            
        - **ODS Instance**: Assign to a specific instance if multiple are configured
            
4. **Generate Credentials**
    
    - Once created, you will be provided:
        
        - **Client ID**
            
        - **Client Secret**
            
    - These can be copied into your environment file or used in Swagger UI
        


### Useful to Include in the Guide

1. **Authentication Process:**
    
    - How to obtain an OAuth token via the `/oauth/token` endpoint.
        
    - The exact `curl` or PowerShell command to get the token, including required parameters (`client_id`, `client_secret`, grant type).
        
    - Explanation of the token usage in the `Authorization: Bearer <token>` header for subsequent API calls.
        
2. **API Base URL and Endpoints:**
    
    - Clarify the correct API base URL (`http://localhost:25030/data/v3/` or `http://localhost:25030/composites/v1/`) depending on the endpoint.
        
    - Document example resource endpoints such as `/ed-fi/enrollment/Students` and how to append query parameters like `offset` and `limit`.
        
3. **Example API Requests:**
    
    - Include sample `curl` or PowerShell commands to call key endpoints with headers.
        
    - Include handling of special headers like `"Use-Snapshot": "false"`.
        
4. **Common Errors and Troubleshooting:**
    
    - Explain common HTTP errors such as `401 Unauthorized` and typical reasons (expired token, missing headers, incorrect endpoint).
        
    - Suggest using tools like WSL or Postman for testing API calls.
        
5. **Notes on Environment:**
    
    - Briefly explain the context: Docker container ports, local environment URLs, etc., so users understand why URLs point to localhost with specific ports.
---

### 🛠️ Example Output

After following the above steps, you might see something like:

|Property|Value|
|---|---|
|Client ID|`b7c97a2d-fac1-4a77-8e42`|
|Client Secret|`d4f3x9hQ2vZ8L7KJ8a9V`|
|Application|`Data Exporter`|
|Claim Set|`Read-only`|

---

### 🔁 Replace the Default Credentials

After generating your real credentials, update your Swagger UI or environment variables accordingly:

env

CopyEdit

`POPULATED_KEY=b7c97a2d-fac1-4a77-8e42 POPULATED_SECRET=d4f3x9hQ2vZ8L7KJ8a9V`

You can also manually authorize Swagger UI using the new credentials by clicking **Authorize** and pasting in the `client_id` and `client_secret`.

---

### 📌 Why This Matters

- **Avoids default keys**: Prevents unauthorized access or environment leaks
    
- **Granular permissions**: Each app can be scoped to specific orgs or permissions
    
- **Environment isolation**: Apps can be tied to specific ODS instances for staging, dev, and production
---

### ✅ Default Credentials (Preloaded in Docker Compose)

Out of the box, the Docker Compose setup includes a working Swagger UI client with hardcoded credentials for demonstration and testing.

**Preconfigured values:**

- **Client ID**: `Zzz13no8ZsiT`
    
- **Client Secret**: `WvgLvbYdZ29OhUQZKdrA7ga1`
    
- **Token URL**: `http://kubernetes.docker.internal:25030/oauth/token`
    
- **Scope**: `oauth2_client_credentials`
    
- **Flow**: `client_credentials`
    

These are injected into the Swagger UI container via `docker-compose.yml`:


```yaml
swagger:   
	environment:     
		- POPULATED_KEY=Zzz13no8ZsiT     
		- POPULATED_SECRET=WvgLvbYdZ29OhUQZKdrA7ga1
```

---

### 🔄 Flow Overview

1. **User opens Swagger UI** in browser (`localhost:25030/swagger`)
    
2. **Click "Authorize"** and accept the predefined client
    
3. **Swagger sends a token request** using `client_credentials` to the token endpoint:
    
    `POST /oauth/token`
    
4. **Access token is issued** and attached to API requests as a `Bearer` token:
    
    `Authorization: Bearer <access_token>`
    
5. **API endpoints validate token** before allowing access to protected resources
    


---

### 🧪 Manual Token Request Example

You can bypass Swagger and manually retrieve a token like this:

```bash
curl --request POST \   
--url http://kubernetes.docker.internal:25030/oauth/token \   
--header 'Content-Type: application/x-www-form-urlencoded' \   
--data 'grant_type=client_credentials&client_id=Zzz13no8ZsiT&client_secret=WvgLvbYdZ29OhUQZKdrA7ga1'
```


<!--- - How to attach tokens to API calls 
- Did you explore the Identity Server (`http://localhost:5001`) and test token requests?-->

---

### 🔐 Security Hardening Recommendations

If you're moving beyond a local dev/test environment, **strongly** consider these critical steps:

#### 1. Change Default Client Credentials

- Hardcoded values are easy targets for misuse if exposed.
    
- Use `.env` files to set:
    
    bash
    
    Copy code
    
    `POPULATED_KEY=<your_secure_client_id> POPULATED_SECRET=<your_secure_client_secret>`
    
- Reference the `.env` file in `docker-compose.yml`:
    
    yaml
    
    Copy code
    
    `env_file:   - .env`
    

#### 2. Rotate Credentials Periodically

- Especially important if client secrets are shared across environments.
    
- Use a secrets manager if deploying in the cloud.
    

#### 3. Disable Swagger UI in Production

- Swagger UI is powerful but exposes endpoint structure and auth flows.
    
- Disable or restrict it using middleware or reverse proxy rules.
    

#### 4. Use HTTPS

- OAuth tokens must always be transmitted over HTTPS.
    
- Local testing may use HTTP, but production deployments **must** secure the `/oauth/token` endpoint.
    

#### 5. Audit Client Registration

- Don’t reuse the same `client_id` across dev, staging, and production.
    
- Use a client management tool or Admin App to generate unique credentials per environment or service.
    

#### 6. Restrict Scope

- Only grant necessary scopes (e.g. read-only access to apps that don’t need to write).
- How to use Admin App to get client credentials
<!-- Need to paste in my screenshots -->

- How to get a bearer token
<!-- Still not sure on how to get bearer token -->

- How to use the token in Swagger UI
- Troubleshooting auth errors


## Exploring the API
* Example API Calls
- What data models are available (overview of key endpoints)
- Where to find documentation in Swagger
- Example test call with curl or Postman
- “Hello world” GET: /students
<!-- No clue how to utilize api calls on local instance -->

- Headers + expected JSON response

## Exploring the API

Once your TSDS ODS containers are running, you can explore the available API endpoints and test calls locally. The API follows the Ed-Fi Data Standard, with Texas-specific extensions layered on top.

### 🔎 Where to Find the API Documentation

The API is exposed through a local Swagger UI, which provides a browsable interface to view available endpoints, models, and response formats.

- **Swagger URL (local instance):**  
    `http://localhost:54746/swagger`
    

This UI lists all major API resources, including:

- Students
    
- Schools (Education Organizations)
    
- Staff
    
- Assessments
    
- Enrollments
    
- Local Extensions (Texas-specific)
    

You can expand any endpoint to view parameters, response schemas, and test endpoints directly in your browser.

---

### 🧪 Example “Hello World” API Call

You can make a simple test call to verify the API is working using `curl` or Postman.

#### Option 1: Curl Example (No Auth)

`curl http://localhost:54746/data/v3/ed-fi/students`

> Note: This assumes authentication is disabled or handled in development mode. The default setup may require a bearer token if auth is enforced.

#### Option 2: Postman Example

1. Open Postman
    
2. Create a new GET request:  
    `http://localhost:54746/data/v3/ed-fi/students`
    
3. (Optional) Set **Authorization** type to Bearer Token if required
    
4. Send the request
    

If successful, you’ll receive a JSON array of student records.

---

### 🧱 Understanding the Data Model

The TSDS API implements Ed-Fi’s core schema with extensions. Key API resources include:
<!-- Find or add visual diagram -->

| Resource         | Endpoint Example                            | Description                 |
| ---------------- | ------------------------------------------- | --------------------------- |
| Students         | `/data/v3/ed-fi/students`                   | Core student records        |
| Schools          | `/data/v3/ed-fi/educationOrganizations`     | School and district data    |
| Staff            | `/data/v3/ed-fi/staffs`                     | Educator information        |
| Assessments      | `/data/v3/ed-fi/assessments`                | Testing and scores          |
| Enrollments      | `/data/v3/ed-fi/studentSchoolAssociations`  | Links students to schools   |
| Texas Extensions | `/data/v3/tpdm/` or `/data/v3/tx/` (varies) | State-specific enhancements |

You can browse these in Swagger and experiment with real API calls.
## Use Cases

#### 1. State Education Data Manager

> _Needs to validate that each district is submitting clean and complete data for compliance purposes._

- Use Case: Query API to extract enrollment data across orgs
    

#### 🧑‍💻 2. Ed-Fi Implementer at a Local District

> _Wants to test changes to the schema or new extensions before deploying live._

- Use Case: Spin up local ODS, test CRUD operations on student data
    

#### 🧪 3. QA Engineer or Integration Tester

> _Needs a consistent way to verify API responses as part of nightly regression testing._

- Use Case: Use Postman collection + tokens to test API stability after new deployments
    

#### 📊 4. Data Analyst

> _Wants to integrate TSDS data with Tableau, Power BI, or a warehouse._

- Use Case: Pull API data into CSV or via connector to sync with reports
    

#### 🧰 5. DevOps Engineer

> _Needs documentation to stand up or monitor containerized versions of the ODS._

- Use Case: Reference Docker setup and Swagger status endpoints
## Glossary
- ODS, TSDS, LEA, Ed-Fi, etc.

## Troubleshooting
- Common errors
- Swagger not loading
- Token issues

## References
- Link to Swagger JSON
- TSDS docs (if public)
- Docker Hub images
