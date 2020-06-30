class CvModel {
  MainTitle mainTitle;
  Summary summary;
  Experiences experiences;
  Education education;
  PersonalInfo personalInfo;
  Skills skills;
  Languages languages;

  CvModel({this.mainTitle, this.summary, this.experiences, this.education, this.personalInfo, this.skills, this.languages});

  CvModel.fromJson(Map<String, dynamic> json) {
    mainTitle = json['mainTitle'] != null ? new MainTitle.fromJson(json['mainTitle']) : null;
    summary = json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
    experiences = json['experiences'] != null ? new Experiences.fromJson(json['experiences']) : null;
    education = json['education'] != null ? new Education.fromJson(json['education']) : null;
    personalInfo = json['personalInfo'] != null ? new PersonalInfo.fromJson(json['personalInfo']) : null;
    skills = json['skills'] != null ? new Skills.fromJson(json['skills']) : null;
    languages = json['languages'] != null ? new Languages.fromJson(json['languages']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainTitle != null) {
      data['mainTitle'] = this.mainTitle.toJson();
    }
    if (this.summary != null) {
      data['summary'] = this.summary.toJson();
    }
    if (this.experiences != null) {
      data['experiences'] = this.experiences.toJson();
    }
    if (this.education != null) {
      data['education'] = this.education.toJson();
    }
    if (this.personalInfo != null) {
      data['personalInfo'] = this.personalInfo.toJson();
    }
    if (this.skills != null) {
      data['skills'] = this.skills.toJson();
    }
    if (this.languages != null) {
      data['languages'] = this.languages.toJson();
    }
    return data;
  }
}

class MainTitle {
  String name;
  String title;

  MainTitle({this.name, this.title});

  MainTitle.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    return data;
  }
}

class Summary {
  String sectionTitle;
  String description;

  Summary({this.sectionTitle, this.description});

  Summary.fromJson(Map<String, dynamic> json) {
    sectionTitle = json['sectionTitle'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sectionTitle'] = this.sectionTitle;
    data['description'] = this.description;
    return data;
  }
}

class Experiences {
  String sectionTitle;
  List<ExperiencesData> experiencesData;

  Experiences({this.sectionTitle, this.experiencesData});

  Experiences.fromJson(Map<String, dynamic> json) {
    sectionTitle = json['sectionTitle'];
    if (json['experiencesData'] != null) {
      experiencesData = new List<ExperiencesData>();
      json['experiencesData'].forEach((v) {
        experiencesData.add(new ExperiencesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sectionTitle'] = this.sectionTitle;
    if (this.experiencesData != null) {
      data['experiencesData'] = this.experiencesData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExperiencesData {
  String title;
  String company;
  String description;
  String initialDate;
  String finalDate;

  ExperiencesData({this.title, this.company, this.description, this.initialDate, this.finalDate});

  ExperiencesData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    company = json['company'];
    description = json['description'];
    initialDate = json['initialDate'];
    finalDate = json['finalDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['company'] = this.company;
    data['description'] = this.description;
    data['initialDate'] = this.initialDate;
    data['finalDate'] = this.finalDate;
    return data;
  }
}

class Education {
  String sectionTitle;
  List<EducationData> educationData;

  Education({this.sectionTitle, this.educationData});

  Education.fromJson(Map<String, dynamic> json) {
    sectionTitle = json['sectionTitle'];
    if (json['educationData'] != null) {
      educationData = new List<EducationData>();
      json['educationData'].forEach((v) {
        educationData.add(new EducationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sectionTitle'] = this.sectionTitle;
    if (this.educationData != null) {
      data['educationData'] = this.educationData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EducationData {
  String institution;
  String city;
  String country;
  String initialDate;
  String finalDate;
  String course;

  EducationData({this.institution, this.city, this.country, this.initialDate, this.finalDate, this.course});

  EducationData.fromJson(Map<String, dynamic> json) {
    institution = json['institution'];
    city = json['city'];
    country = json['country'];
    initialDate = json['initialDate'];
    finalDate = json['finalDate'];
    course = json['course'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['institution'] = this.institution;
    data['city'] = this.city;
    data['country'] = this.country;
    data['initialDate'] = this.initialDate;
    data['finalDate'] = this.finalDate;
    data['course'] = this.course;
    return data;
  }
}

class PersonalInfo {
  String sectionTitle;
  List<PersonalInfoData> personalInfoData;

  PersonalInfo({this.sectionTitle, this.personalInfoData});

  PersonalInfo.fromJson(Map<String, dynamic> json) {
    sectionTitle = json['sectionTitle'];
    if (json['personalInfoData'] != null) {
      personalInfoData = new List<PersonalInfoData>();
      json['personalInfoData'].forEach((v) {
        personalInfoData.add(new PersonalInfoData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sectionTitle'] = this.sectionTitle;
    if (this.personalInfoData != null) {
      data['personalInfoData'] = this.personalInfoData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PersonalInfoData {
  String title;
  String content;
  bool isLink;

  PersonalInfoData({this.title, this.content, this.isLink});

  PersonalInfoData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    isLink = json['isLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    data['isLink'] = this.isLink;
    return data;
  }
}

class Skills {
  String sectionTitle;
  List<SkillsData> skillsData;

  Skills({this.sectionTitle, this.skillsData});

  Skills.fromJson(Map<String, dynamic> json) {
    sectionTitle = json['sectionTitle'];
    if (json['skillsData'] != null) {
      skillsData = new List<SkillsData>();
      json['skillsData'].forEach((v) {
        skillsData.add(new SkillsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sectionTitle'] = this.sectionTitle;
    if (this.skillsData != null) {
      data['skillsData'] = this.skillsData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SkillsData {
  String skill;
  int level;
  int total;

  SkillsData({this.skill, this.level, this.total});

  SkillsData.fromJson(Map<String, dynamic> json) {
    skill = json['skill'];
    level = json['level'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['skill'] = this.skill;
    data['level'] = this.level;
    data['total'] = this.total;
    return data;
  }
}

class Languages {
  String sectionTitle;
  List<LanguagesData> languagesData;

  Languages({this.sectionTitle, this.languagesData});

  Languages.fromJson(Map<String, dynamic> json) {
    sectionTitle = json['sectionTitle'];
    if (json['languagesData'] != null) {
      languagesData = new List<LanguagesData>();
      json['languagesData'].forEach((v) {
        languagesData.add(new LanguagesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sectionTitle'] = this.sectionTitle;
    if (this.languagesData != null) {
      data['languagesData'] = this.languagesData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LanguagesData {
  String language;
  int level;
  int total;

  LanguagesData({this.language, this.level, this.total});

  LanguagesData.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    level = json['level'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language'] = this.language;
    data['level'] = this.level;
    data['total'] = this.total;
    return data;
  }
}
