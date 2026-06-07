<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>${not empty cvData.name ? cvData.name : "CV Document"}</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 p-8">

    <div class="max-w-4xl mx-auto bg-white p-10 shadow-lg rounded-lg border border-gray-200">
        
        <div class="flex justify-between items-start border-b-2 border-gray-200 pb-6 mb-8">
            
            <div>
                <h1 class="text-4xl font-extrabold text-gray-900 tracking-tight">${cvData.name}</h1>
                <div class="mt-3 text-sm text-gray-600 space-y-1">
                    <p class="flex items-center">
                        <span class="font-semibold text-gray-700">Email:</span>&nbsp;${cvData.email}
                    </p>
                    <p class="flex items-center">
                        <span class="font-semibold text-gray-700">Phone:</span>&nbsp;${cvData.phone}
                    </p>
                </div>
            </div>
            
            <c:if test="${not empty cvData.profilePic}">
                <div class="ml-4 flex-shrink-0">
                    <c:choose>
                        <%-- Jika data mengandungi teks Base64 --%>
                        <c:when test="${cvData.profilePic.startsWith('data:')}">
                            <img src="${cvData.profilePic}"  
                                 alt="Profile Picture"  
                                 class="w-32 h-32 object-cover rounded-md border-4 border-gray-100 shadow-md">
                        </c:when>
                        <%-- Jika data merujuk path imej example (images/profile.jpg) --%>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/${cvData.profilePic}"  
                                 alt="Profile Picture"  
                                 class="w-32 h-32 object-cover rounded-md border-4 border-gray-100 shadow-md">
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:if>
            
        </div>

        <div class="space-y-6">
            <div>
                <h2 class="text-xl font-bold text-gray-800 border-b pb-1 mb-2">Education</h2>
                <p class="text-gray-700 whitespace-pre-line">${cvData.education}</p>
            </div>
            
            <div>
                <h2 class="text-xl font-bold text-gray-800 border-b pb-1 mb-2">Experience</h2>
                <p class="text-gray-700 whitespace-pre-line">${cvData.experience}</p>
            </div>

            <div>
                <h2 class="text-xl font-bold text-gray-800 border-b pb-1 mb-2">Skills</h2>
                <p class="text-gray-700 whitespace-pre-line">${cvData.skills}</p>
            </div>
        </div>

    </div>

</body>
</html>