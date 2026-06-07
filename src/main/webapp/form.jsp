<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CV Builder Form</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center p-6">

    <div class="bg-white p-8 rounded-xl shadow-md w-full max-w-2xl">
        <div class="flex justify-between items-center mb-6">
            <h2 class="text-2xl font-bold text-gray-800">WELCOME TO CV GENERATOR</h2>
            <a href="CVServlet?action=example" class="bg-emerald-600 hover:bg-emerald-700 text-white font-medium py-2 px-4 rounded-lg text-sm transition">
                View Example CV
            </a>
        </div>
        
        <form action="CVServlet" method="POST" enctype="multipart/form-data" class="space-y-4">
            <div>
                <label class="block text-sm font-semibold text-gray-600 mb-1">Full Name</label>
                <input type="text" name="name" required class="w-full border p-2.5 rounded-lg focus:ring-2 focus:ring-blue-500 outline-none">
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-semibold text-gray-600 mb-1">Email Address</label>
                    <input type="email" name="email" required class="w-full border p-2.5 rounded-lg focus:ring-2 focus:ring-blue-500 outline-none">
                </div>
                <div>
                    <label class="block text-sm font-semibold text-gray-600 mb-1">Phone Number</label>
                    <input type="text" name="phone" required class="w-full border p-2.5 rounded-lg focus:ring-2 focus:ring-blue-500 outline-none">
                </div>
            </div>

            <div>
                <label class="block text-sm font-semibold text-gray-600 mb-1">Profile Picture</label>
                <input type="file" 
                       name="profilePicFile" 
                       accept="image/png, image/jpeg, image/jpg" 
                       required
                       class="w-full border p-2 rounded-lg bg-gray-50 focus:ring-2 focus:ring-blue-500 outline-none text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-md file:border-0 file:text-sm file:font-semibold file:bg-blue-50 file:text-blue-700 hover:file:bg-blue-100 cursor-pointer">
                <p class="text-xs text-gray-400 mt-1">Accepts JPG, JPEG, or PNG formats.</p>
            </div>

            <div>
                <label class="block text-sm font-semibold text-gray-600 mb-1">Education Background</label>
                <textarea name="education" rows="3" required placeholder="Institutions, Degrees, Year..." class="w-full border p-2.5 rounded-lg focus:ring-2 focus:ring-blue-500 outline-none"></textarea>
            </div>

            <div>
                <label class="block text-sm font-semibold text-gray-600 mb-1">Work Experience</label>
                <textarea name="experience" rows="3" required placeholder="Companies, Roles, Duties..." class="w-full border p-2.5 rounded-lg focus:ring-2 focus:ring-blue-500 outline-none"></textarea>
            </div>

            <div>
                <label class="block text-sm font-semibold text-gray-600 mb-1">Professional Skills</label>
                <textarea name="skills" rows="2" required placeholder="e.g. Java, Python, Project Management" class="w-full border p-2.5 rounded-lg focus:ring-2 focus:ring-blue-500 outline-none"></textarea>
            </div>

            <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-4 rounded-lg transition shadow">
                Generate CV Document
            </button>
        </form>
    </div>

</body>
</html>