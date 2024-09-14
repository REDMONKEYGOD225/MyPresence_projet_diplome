CREATE TABLE `Users` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nom` VARCHAR(100),
  `prenom` VARCHAR(100),
  `email` VARCHAR(100) UNIQUE,
  `password` VARCHAR(255),
  `role` ENUM(parent,student,teacher,coordinator,administrator)
);

CREATE TABLE `Students` (
  `id` INT PRIMARY KEY,
  `classe` VARCHAR(50),
  `date_naissance` DATE
);

CREATE TABLE `Teachers` (
  `id` INT PRIMARY KEY,
  `matiere` VARCHAR(100)
);

CREATE TABLE `Parents` (
  `id` INT PRIMARY KEY,
  `telephone` VARCHAR(15),
  `adresse` VARCHAR(255)
);

CREATE TABLE `Parent_Student` (
  `parent_id` INT,
  `student_id` INT
);

CREATE TABLE `Coordinators` (
  `id` INT PRIMARY KEY
);

CREATE TABLE `Classes` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `classe_name` VARCHAR(50)
);

CREATE TABLE `Class_Student` (
  `classe_id` INT,
  `student_id` INT
);

CREATE TABLE `Class_Teacher` (
  `classe_id` INT,
  `teacher_id` INT
);

CREATE TABLE `Schedules` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `classe_id` INT,
  `matiere` VARCHAR(100),
  `teacher_id` INT,
  `day_of_week` ENUM(lundi,mardi,mercredi,jeudi,vendredi),
  `heure_debut` TIME,
  `heure_fin` TIME
);

CREATE TABLE `Attendances` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `etudiant_id` INT,
  `schedule_id` INT,
  `date` DATE,
  `statut` ENUM(présent,absent,retard)
);

CREATE TABLE `Justifications` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `student_id` INT,
  `reason` TEXT,
  `file` VARCHAR(255),
  `first_date` DATE,
  `second_date` DATE
);

CREATE TABLE `Messages` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `sender_id` INT,
  `receiver_id` INT,
  `subject` VARCHAR(255),
  `content` TEXT,
  `timestamp` DATETIME
);

CREATE TABLE `Celebrations` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `student_id` INT,
  `event_name` VARCHAR(100),
  `description` TEXT,
  `date` DATE
);

ALTER TABLE `Students` ADD FOREIGN KEY (`id`) REFERENCES `Users` (`id`);

ALTER TABLE `Teachers` ADD FOREIGN KEY (`id`) REFERENCES `Users` (`id`);

ALTER TABLE `Parents` ADD FOREIGN KEY (`id`) REFERENCES `Users` (`id`);

ALTER TABLE `Parent_Student` ADD FOREIGN KEY (`parent_id`) REFERENCES `Parents` (`id`);

ALTER TABLE `Parent_Student` ADD FOREIGN KEY (`student_id`) REFERENCES `Students` (`id`);

ALTER TABLE `Coordinators` ADD FOREIGN KEY (`id`) REFERENCES `Users` (`id`);

ALTER TABLE `Class_Student` ADD FOREIGN KEY (`classe_id`) REFERENCES `Classes` (`id`);

ALTER TABLE `Class_Student` ADD FOREIGN KEY (`student_id`) REFERENCES `Students` (`id`);

ALTER TABLE `Class_Teacher` ADD FOREIGN KEY (`classe_id`) REFERENCES `Classes` (`id`);

ALTER TABLE `Class_Teacher` ADD FOREIGN KEY (`teacher_id`) REFERENCES `Teachers` (`id`);

ALTER TABLE `Schedules` ADD FOREIGN KEY (`classe_id`) REFERENCES `Classes` (`id`);

ALTER TABLE `Schedules` ADD FOREIGN KEY (`teacher_id`) REFERENCES `Teachers` (`id`);

ALTER TABLE `Attendances` ADD FOREIGN KEY (`etudiant_id`) REFERENCES `Students` (`id`);

ALTER TABLE `Attendances` ADD FOREIGN KEY (`schedule_id`) REFERENCES `Schedules` (`id`);

ALTER TABLE `Justifications` ADD FOREIGN KEY (`student_id`) REFERENCES `Students` (`id`);

ALTER TABLE `Messages` ADD FOREIGN KEY (`sender_id`) REFERENCES `Users` (`id`);

ALTER TABLE `Messages` ADD FOREIGN KEY (`receiver_id`) REFERENCES `Users` (`id`);

ALTER TABLE `Celebrations` ADD FOREIGN KEY (`student_id`) REFERENCES `Students` (`id`);
