package com.cvapp.model;

public class CVModel {
    private String name;
    private String email;
    private String phone;
    private String education;
    private String experience;
    private String skills;
    private String profilePic; // 1. Added this field

    // 2. Updated Constructor to accept 7 parameters now
    public CVModel(String name, String email, String phone, String education, String experience, String skills, String profilePic) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.education = education;
        this.experience = experience;
        this.skills = skills;
        this.profilePic = profilePic;
    }

    // Getters
    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getPhone() { return phone; }
    public String getEducation() { return education; }
    public String getExperience() { return experience; }
    public String getSkills() { return skills; }
    public String getProfilePic() { return profilePic; } // 3. Added this getter

    // Setters (Optional but good to have)
    public void setName(String name) { this.name = name; }
    public void setEmail(String email) { this.email = email; }
    public void setPhone(String phone) { this.phone = phone; }
    public void setEducation(String education) { this.education = education; }
    public void setExperience(String experience) { this.experience = experience; }
    public void setSkills(String skills) { this.skills = skills; }
    public void setProfilePic(String profilePic) { this.profilePic = profilePic; }
}