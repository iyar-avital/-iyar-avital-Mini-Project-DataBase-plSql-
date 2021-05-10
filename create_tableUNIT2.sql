CREATE TABLE Person
(
  personID INT NOT NULL,
  firstName VARCHAR2(20) NOT NULL,
  lastName  VARCHAR2(20) NOT NULL,
  birthDate DATE NOT NULL,
  email  VARCHAR2(20) NOT NULL,
  phoneNumber INT NOT NULL,
  address  VARCHAR2(30) NOT NULL,
  PRIMARY KEY (personID)
);

CREATE TABLE Student
(
  GPA FLOAT NOT NULL,
  studingYear INT NOT NULL,
  personID INT NOT NULL,
  PRIMARY KEY (personID),
  FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

CREATE TABLE Course
(
  courseID INT NOT NULL,
  courseName VARCHAR2(40) NOT NULL,
  credit FLOAT NOT NULL,
  PRIMARY KEY (courseID)
);

CREATE TABLE CourseInSemester
(
  semester VARCHAR2(10) NOT NULL,
  currentYear INT NOT NULL,
  groupNumber INT NOT NULL,
  courseID INT NOT NULL,
  PRIMARY KEY (semester,currentYear, courseID),
  FOREIGN KEY (courseID) REFERENCES Course(courseID)
);

CREATE TABLE Lecturer
(
  seniority INT NOT NULL,
  salary FLOAT NOT NULL,
  personID INT NOT NULL,
  PRIMARY KEY (personID),
  FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

CREATE TABLE Question
(
  questionId INT NOT NULL,
  score_ FLOAT NOT NULL,
  typeOfQuestion  VARCHAR2(20) NOT NULL,
  questionbody VARCHAR2(30) NOT NULL,
  PRIMARY KEY (questionId)
);

CREATE TABLE StudentTakeCourse
(
  examGrade FLOAT NOT NULL,
  assignmentsGrade FLOAT NOT NULL,
  personID INT NOT NULL,
  semester VARCHAR2(10) NOT NULL,
  currentYear INT NOT NULL,
  courseID INT NOT NULL,
  PRIMARY KEY (personID, semester, currentYear, courseID),
  FOREIGN KEY (personID) REFERENCES Student(personID),
  FOREIGN KEY (semester,currentYear, courseID) REFERENCES CourseInSemester(semester,currentYear, courseID)
);

CREATE TABLE LecturerTeachCourse
(
  semester VARCHAR2(10) NOT NULL,
  currentYear INT NOT NULL,
  courseID INT NOT NULL,
  personID INT NOT NULL,
  PRIMARY KEY (semester, currentYear, courseID, personID),
  FOREIGN KEY (semester,currentYear, courseID) REFERENCES CourseInSemester(Semester, currentYear, courseID),
  FOREIGN KEY (personID) REFERENCES Lecturer(personID)
);

CREATE TABLE CourseQuestions
(
  courseID INT NOT NULL,
  questionId INT NOT NULL,
  PRIMARY KEY (CourseID, questionId),
  FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
  FOREIGN KEY (questionId) REFERENCES Question(questionId)
);

CREATE TABLE Exam
(
  examName VARCHAR2(30) NOT NULL,
  typeOfExam VARCHAR2(20) NOT NULL,
  Moed VARCHAR2(10) NOT NULL,
  ExamDate DATE NOT NULL,
  timeOfExam INT NOT NULL,
  semester VARCHAR2(10) NOT NULL,
  currentYear INT NOT NULL,
  courseID INT NOT NULL,
  PRIMARY KEY (semester, currentYear, courseID,moed),
  FOREIGN KEY (semester, currentYear, courseID) REFERENCES CourseInSemester(semester,currentYear, courseID)
);
