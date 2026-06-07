# CV Generator Web Application

A dynamic enterprise web application built using the **Jakarta EE** framework, fully orchestrated via the **Model-View-Controller (MVC)** architectural design pattern, and deployed on the **Eclipse GlassFish 7** application server.

---

## 1. Project Overview
This application allows users to dynamically generate a professional resume/CV by inputting their personal details, academic background, work experience, and skills through an interactive web form. The system processes the information in real-time and renders a clean, modern, and responsive CV layout.

### Key Features:
* **Dynamic PDF-ready Canvas**: Instantly renders user details onto a structured resume template.
* **In-Memory Base64 Image Processing**: Converts uploaded profile pictures into embedded data strings, eliminating temporary server storage bugs.
* **Cache-Proof Rendering**: Employs unique session-based timestamp tokens to force real-time graphic updates in the browser.
* **Responsive UI Layout**: Built natively using the **Tailwind CSS** utility framework.

---

## 2. MVC Architecture Implementation

The project strictly follows the **Separation of Concerns (SoC)** principle to ensure high code maintainability, clean data encapsulation, and scalable routing.

### The Model (`CVModel.java`)
Acts as a pure Plain Old Java Object (POJO) that encapsulates the application's data structure. It defines the private fields for user profile attributes (Name, Email, Phone, Education, Experience, Skills, and the Profile Picture reference string) and safely exposes them via public getters and setters.

### The View (`form.jsp`, `cv-template.jsp`, `index.html`)
Handles the client-side presentation layer. 
* `form.jsp` captures multipart form data and file streams from the user.
* `cv-template.jsp` leverages **Jakarta Expression Language (EL)** (e.g., `${cvData.name}`) and **JSTL Core Tags** (`<c:choose>`, `<c:when>`) to compile and render the data dynamically into HTML on the server side.

### The Controller (`CVServlet.java`)
The core operational nerve hub of the application extending `HttpServlet`. It intercepts incoming client traffic, manages lifecycle processing routes (`doGet` for sample views and `doPost` for form submissions), extracts multi-part file payloads, encodes image binary streams into ASCII text URLs, and binds the data model into the active request scope before dispatching control to the View.

---

## 3. Technical Challenges & Resolutions

### ❌ Problem 1: Volatile Directory Image Loss
* **Cause**: Saving uploaded images directly to the server's physical file paths (`getRealPath("")`) meant files were placed inside GlassFish's temporary build deployment folders. Every fresh Maven compilation or project "Clean and Build" completely wiped out user uploads.
* **Solution**: Refactored the architecture to read the file's `InputStream` straight into a raw primitive byte array, which is then converted into an **ASCII Base64 Data URL string** (`data:image/png;base64,...`). The string is saved straight inside the data model container, completely bypassing local disk permission issues and file transience.

### ❌ Problem 2: JSTL Parsing Server Crashes (HTTP Error 500)
* **Cause**: Utilizing invalid, unsupported tags like `<c:toLowerCase>` inside the template layer violated the standard JSTL tag library schema constraints, causing the GlassFish compilation engine to throw an internal processing exception.
* **Solution**: Cleaned up the JSP syntax by removing custom formatting tags and implementing a robust JSTL conditional logic tree using `<c:choose>` and `<c:when test="${...startsWith(...)}">` to safely differentiate between local sample assets and runtime Base64 image payloads.

---

## 4. Project Directory Structure

```text
CVWebApplication/
├── Web Pages/                       # View Presentation Layer
│   ├── WEB-INF/                     # Secured Server Configuration Folder
│   ├── images/                      # Default Local Placeholder Assets
│   ├── cv-template.jsp            # Dynamic CV Render Canvas
│   └── form.jsp                   # Multi-part User Input Collection Form
└── Source Packages/                 # Backend Logical Layer (MVC Cores)
    └── com.cvapp/
        ├── controller/
        │   └── CVServlet.java     # Controller & Request Routing Operations
        └── model/
            └── CVModel.java       # Encapsulated Data Model Blueprint
