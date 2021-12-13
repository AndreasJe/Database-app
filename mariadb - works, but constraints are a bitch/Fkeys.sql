
ALTER TABLE course ADD instructor_id bigint(11) UNSIGNED NOT NULL;
ALTER TABLE course ADD CONSTRAINT fk_instructor_id FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE course_chapter ADD course_id bigint(11) UNSIGNED NOT NULL;
ALTER TABLE course_chapter ADD CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES course (id);
ALTER TABLE course_chapter_content ADD course_chapter_id bigint(11) UNSIGNED NOT NULL;
ALTER TABLE course_chapter_content ADD CONSTRAINT fk_course_chapter_id FOREIGN KEY (course_chapter_id) REFERENCES course_chapter (id);
ALTER TABLE feedback ADD enrollment_id bigint(11) UNSIGNED NOT NULL;
ALTER TABLE feedback ADD CONSTRAINT fk_enrollment_id FOREIGN KEY (enrollment_id) REFERENCES enrollment (id);
ALTER TABLE enrollment ADD course_id bigint(11) UNSIGNED NOT NULL;
ALTER TABLE enrollment ADD student_id bigint(11) UNSIGNED NOT NULL;
ALTER TABLE enrollment ADD CONSTRAINT fk_instructor_id FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE enrollment ADD CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES students (id);
ALTER TABLE progress ADD enrollment_id bigint(11) UNSIGNED NOT NULL;
ALTER TABLE progress ADD CONSTRAINT fk_enrollment_id FOREIGN KEY (enrollment_id) REFERENCES enrollment (id);
ALTER TABLE progress ADD course_chapter_id bigint(11) UNSIGNED NOT NULL;
ALTER TABLE progress ADD CONSTRAINT fk_course_chapter_id FOREIGN KEY (course_chapter_id) REFERENCES course_chapter (id);

