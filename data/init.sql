-- ORGANIZATIONS
INSERT INTO recruiter.organizations values (default, 'Reply', 'reply', '2433242342', 'contact@reply.com','www.reply.com');
INSERT INTO recruiter.organizations VALUES (DEFAULT, 'TechCorp', 'techcorp', '+212600000001', 'contact@techcorp.com', 'https://techcorp.com');


-- RECRUITER
--password : test-password
INSERT INTO recruiter.recruiters (first_name, last_name, email, password, organization_id)
VALUES ('Cyril', 'JOUENNE', 'cjouenne@wemanity.com', '$argon2id$v=19$m=65536,t=4,p=1$ZLuGWYE4JA/eqHqLl4o8iQ$ss1VnULTBkfGe3DSlEw7E5SBEQzRGHWrbRR2PISejNQ', 1);

-- COLLECTIONS
INSERT INTO recruiter.collections (id, label, slug, description, is_archived, organization_id)
VALUES (DEFAULT, 'Engineering Internships','Engineering-Internships', 'Engineering Internships for the 2026 season', 0, 1);

INSERT INTO recruiter.collections (id, label, slug, description, is_archived, organization_id)
VALUES (DEFAULT, 'Software Engineers Oct','Engineering-Internships-Oct', 'A collection for internal talent acquisition requirements', 0, 1);

INSERT INTO recruiter.collections (id, label, slug, description, is_archived, organization_id)
VALUES (DEFAULT, 'Louis Vuitton (Customer Collection)','Louis-Vuitton', 'A collection for customer related talent acquisition campaigns', 0, 1);

-- TECH CORP COLLECTION
INSERT INTO recruiter.collections (id, label, slug, description, is_archived, organization_id)
VALUES (DEFAULT, 'TechCorp Hiring Campaign', 'techcorp-hiring-campaign', 'Open positions at TechCorp', 0, 2);

-- OFFERS
-- Software Engineers Oct
INSERT INTO recruiter.offers (id, title, slug, description, responsibilities, skills, certifications,
                              education, seniority, arrangement, creation_date, expiry_date, collection_id, is_archived)
VALUES (DEFAULT, 'Développeur Java Angular Experimente (H/F)',
        'Developpeur-Java-Angular-Experimente-(H/F)',
        'Tu es Développeur Experimenté (H/F) et tu souhaites apporter ton savoir-faire dans une équipe de passionnés ? Tu adoptes la culture agile et le software craftsmanship ? Tu aimes mettre en valeur les bonnes pratiques de développement, apprendre et partager ? Cette offre est faite pour toi !',
        '["Nous recherchons des passionné(e)s qui maîtrisent le langage Java et Angular sur le front ainsi que les bonnes pratiques de développement. La maîtrise de Kafka est un gros plus sur ce poste.",
                        "Expérience sur les frameworks : Profil de 5 ans d’expériences et plus souhaité !"]',
        '["Java", "Angular", "Kafka", "Spring", "SpringBoot"]',
        '{}',
        'BACCALAUREATE',
        'MIDLEVEL',
        'HYBRID',
        1759574762,
        1762249562,
        2,
        0),

(DEFAULT, 'Mid-level Java/React developer (H/F)',
        'mid-level-java-react-developer',
        'We are looking for an experienced Full-Stack Developer with 5 years of experience in a similar position. You will be responsible for designing and developing both the Front-end and Back-end of web applications, delivering robust, scalable solutions while working closely with our team of designers and developers.',
        '["Creating full-stack solutions by developing both Front-end and Back-end components",' ||
        '"Designing and developing full-stack web-based applications and systems using various frameworks and languages",' ||
        '"Writing robust, effective, and scalable code for both client-side and server-side development",' ||
        '"Optimizing full-stack applications for maximum performance and scalability",' ||
        '"Integrating APIs and third-party service into full-stack applications",' ||
        '"Collaborating with designers and developers to create seamless user experiences and cohesive design implementations",' ||
        '"Running unit, integration, and end-to-end tests to ensure the stability and functionality of full-stack applications",' ||
        '"Conducting code reviews and ensuring adherence to coding standards and best practices",' ||
        '"Participating in agile development processes and contributing to continuous improvement of the team’s workflow and processes",]',
        '["Java", "React", "Kafka", "Spring", "SpringBoot", "HTML5", "CSS3", "JavaScript", "MySQL", "PostgreSQL", "MongoDB", "Git", "REST"]',
        '{}',
        'BACCALAUREATE',
        'MIDLEVEL',
        'HYBRID',
        1759574762,
        1792498300,
        2,
        0);

-- More offers for REPLY (organization_id = 1, collection_id = 2)
INSERT INTO recruiter.offers (title, slug, description, responsibilities, skills, certifications,
                              education, seniority, arrangement, creation_date, expiry_date, collection_id, is_archived)
VALUES
('Backend Engineer (Spring Boot)', 'backend-engineer-spring-boot',
 'Work on backend microservices with Spring Boot and PostgreSQL.',
 '["Develop REST APIs","Maintain services","Integrate with Kafka"]',
 '["Java","Spring Boot","PostgreSQL","Kafka"]',
 '{}', 'BACHELOR','MIDLEVEL','HYBRID', 1759574762,1762249562,2,0),

('Frontend Angular Developer', 'frontend-angular-developer',
 'Build responsive UIs using Angular and TypeScript.',
 '["Develop Angular components","Ensure responsive design","Collaborate with backend"]',
 '["Angular","TypeScript","HTML","CSS"]',
 '{}','BACHELOR','ASSOCIATE','REMOTE',1759574762,1762249562,2,0),

('DevOps Engineer', 'devops-engineer',
 'Automate deployment pipelines and manage cloud infrastructure.',
 '["CI/CD setup","Monitor systems","Automate deployments"]',
 '["Docker","Kubernetes","Jenkins","AWS"]',
 '{}','MASTER','SENIOR','HYBRID',1759574762,1762249562,2,0),

('Data Engineer', 'data-engineer',
 'Design data pipelines and optimize ETL processes.',
 '["Build ETL workflows","Manage databases","Optimize data queries"]',
 '["Python","Airflow","SQL","Spark"]',
 '{}','MASTER','MIDLEVEL','ONSITE',1759574762,1762249562,2,0),

('QA Automation Engineer', 'qa-automation-engineer',
 'Ensure software quality using automated tests.',
 '["Write test cases","Automate testing","Work with developers"]',
 '["Selenium","JUnit","Postman","Cypress"]',
 '{}','BACHELOR','ASSOCIATE','REMOTE',1759574762,1762249562,2,0),

('Cloud Architect', 'cloud-architect',
 'Design scalable cloud systems and mentor DevOps teams.',
 '["Architect cloud infrastructure","Ensure scalability","Lead DevOps initiatives"]',
 '["AWS","Azure","Terraform","Kubernetes"]',
 '{}','MASTER','SENIOR','HYBRID',1759574762,1762249562,2,0);

-- Offers for TECHCORP (organization_id = 2, collection_id = 4)
INSERT INTO recruiter.offers (title, slug, description, responsibilities, skills, certifications,
                              education, seniority, arrangement, creation_date, expiry_date, collection_id, is_archived)
VALUES
('Java Backend Developer', 'java-backend-developer',
 'Responsible for building scalable backend systems using Java and Spring Boot.',
 '["Develop REST APIs","Maintain microservices","Collaborate with frontend teams"]',
 '["Java","Spring Boot","PostgreSQL"]',
 '{}', 'BACHELOR','MIDLEVEL','HYBRID',1759574762,1762249562,4,0),

('Angular Frontend Developer', 'angular-frontend-developer',
 'Develop responsive web interfaces with Angular and TypeScript.',
 '["Build UI components","Consume REST APIs","Ensure cross-browser compatibility"]',
 '["Angular","TypeScript","HTML","CSS"]',
 '{}','BACHELOR','ASSOCIATE','REMOTE',1759574762,1762249562,4,0),

('Full Stack Engineer', 'full-stack-engineer',
 'Work across the stack using Java, Spring, and Angular.',
 '["Develop backend and frontend","Integrate APIs","Deploy apps to cloud"]',
 '["Java","Angular","Docker","AWS"]',
 '{}','MASTER','MIDLEVEL','HYBRID',1759574762,1762249562,4,0),

('Machine Learning Engineer', 'machine-learning-engineer',
 'Build ML models for predictive analytics.',
 '["Train models","Deploy ML pipelines","Work with data scientists"]',
 '["Python","TensorFlow","Scikit-learn"]',
 '{}','MASTER','SENIOR','ONSITE',1759574762,1762249562,4,0),

('UI/UX Designer', 'ui-ux-designer',
 'Design intuitive user interfaces and experiences.',
 '["Create wireframes","Prototype UIs","Work with developers"]',
 '["Figma","Adobe XD","UX research"]',
 '{}','BACHELOR','ASSOCIATE','REMOTE',1759574762,1762249562,4,0),

('QA Engineer', 'qa-engineer',
 'Ensure product quality through manual and automated testing.',
 '["Test APIs","Perform UI testing","Report bugs"]',
 '["Selenium","Postman","Cypress"]',
 '{}','BACHELOR','ASSOCIATE','REMOTE',1759574762,1762249562,4,0);


--password for candidates : Candidate-123
INSERT INTO candidate.candidates (id, title, education, seniority, arrangement, first_name, last_name, email, password, is_active,
                                  is_valid, registration_date, last_login)
VALUES (DEFAULT, 'ingénieur Full Stack','MASTER', 'ASSOCIATE', 'ONSITE', 'Adnane', 'EZ-ZAIM',
        'ad.ezzaim@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$b4zRn+XTOrsiap+4rpny4g$8wSGjXbnMK93GRL0/kfPF+KnceQQRDiPQXavRpv6IpE', 1, 1, 1759739997, 1759739997);


INSERT INTO candidate.candidates (id, title, education, seniority, arrangement, first_name, last_name, email, password, is_active,
                                  is_valid, registration_date, last_login)
VALUES (DEFAULT, 'Développeur Java','MASTER', 'SENIOR', 'ONSITE', 'Amine', 'AISSAOUI',
        'aamine.aiss@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$b4zRn+XTOrsiap+4rpny4g$8wSGjXbnMK93GRL0/kfPF+KnceQQRDiPQXavRpv6IpE', 1, 1, 1759739997, 1759739997);


INSERT INTO candidate.candidates (id, title, education, seniority, arrangement, first_name, last_name, email, password, is_active,
                                  is_valid, registration_date, last_login)
VALUES (DEFAULT, 'FULLSTACK JAVA/ANGULAR','MASTER', 'SENIOR', 'ONSITE', 'Amine', 'MABROUK',
        'aamine.mabrouk@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$b4zRn+XTOrsiap+4rpny4g$8wSGjXbnMK93GRL0/kfPF+KnceQQRDiPQXavRpv6IpE', 1, 1, 1759739997, 1759739997);

INSERT INTO candidate.candidates (id, title, education, seniority, arrangement, first_name, last_name, email, password, is_active,
                                  is_valid, registration_date, last_login)
VALUES (DEFAULT, 'DÉVELOPPEUR FULL STACK','MASTER', 'ASSOCIATE', 'ONSITE', 'Emma', 'BOTTI',
        'emmbotti@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$b4zRn+XTOrsiap+4rpny4g$8wSGjXbnMK93GRL0/kfPF+KnceQQRDiPQXavRpv6IpE', 1, 1, 1759739997, 1759739997);

INSERT INTO candidate.candidates (id, title, education, seniority, arrangement, first_name, last_name, email, password, is_active,
                                  is_valid, registration_date, last_login)
VALUES (DEFAULT, 'Full Stack Engineer, Web developer','MASTER', 'ASSOCIATE', 'ONSITE', 'Hichem', 'BOUHLEL',
        'ichem.bouhlel@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$b4zRn+XTOrsiap+4rpny4g$8wSGjXbnMK93GRL0/kfPF+KnceQQRDiPQXavRpv6IpE', 1, 1, 1759739997, 1759739997);


INSERT INTO candidate.candidates (id, title, education, seniority, arrangement, first_name, last_name, email, password, is_active,
                                  is_valid, registration_date, last_login)
VALUES (DEFAULT, 'Développeur Java Fullstack','MASTER', 'SENIOR', 'ONSITE', 'jalil', 'bounaime',
        'jalil@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$b4zRn+XTOrsiap+4rpny4g$8wSGjXbnMK93GRL0/kfPF+KnceQQRDiPQXavRpv6IpE', 1, 1, 1759739997, 1759739997);

INSERT INTO candidate.candidates (id, title, education, seniority, arrangement, first_name, last_name, email, password, is_active,
                                  is_valid, registration_date, last_login)
VALUES (DEFAULT, 'Ingénieur Logiciel','MASTER', 'SENIOR', 'ONSITE', 'Jérôme', 'STEVE',
        'jerome.steve@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$b4zRn+XTOrsiap+4rpny4g$8wSGjXbnMK93GRL0/kfPF+KnceQQRDiPQXavRpv6IpE', 1, 1, 1759739997, 1759739997);


INSERT INTO candidate.candidates (id, title, education, seniority, arrangement, first_name, last_name, email, password, is_active,
                                  is_valid, registration_date, last_login)
VALUES (DEFAULT, 'Ingénieur Logiciel','MASTER', 'ASSOCIATE', 'ONSITE', 'Karim', 'BOUALAM',
        'karim.boualam@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$b4zRn+XTOrsiap+4rpny4g$8wSGjXbnMK93GRL0/kfPF+KnceQQRDiPQXavRpv6IpE', 1, 1, 1759739997, 1759739997);

INSERT INTO candidate.candidates (id, title, education, seniority, arrangement, first_name, last_name, email, password, is_active,
                                  is_valid, registration_date, last_login)
VALUES (DEFAULT, 'INGENIEUR LOGICIEL/WEB','MASTER', 'SENIOR', 'ONSITE', 'MAXIME', 'GOETGHELUCK',
        'mgoetghe@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$b4zRn+XTOrsiap+4rpny4g$8wSGjXbnMK93GRL0/kfPF+KnceQQRDiPQXavRpv6IpE', 1, 1, 1759739997, 1759739997);


INSERT INTO candidate.candidates (id, title, education, seniority, arrangement, first_name, last_name, email, password, is_active,
                                  is_valid, registration_date, last_login)
VALUES (DEFAULT, 'Lead Software Engineer','MASTER', 'MIDLEVEL', 'ONSITE', 'Rachid', 'ARDOUZ',
        'rachidardouz11@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$b4zRn+XTOrsiap+4rpny4g$8wSGjXbnMK93GRL0/kfPF+KnceQQRDiPQXavRpv6IpE', 1, 1, 1759739997, 1759739997);


INSERT INTO candidate.candidates (id, title, education, seniority, arrangement, first_name, last_name, email, password, is_active,
                                  is_valid, registration_date, last_login)
VALUES (DEFAULT, 'Développeur Java Full Stack','MASTER', 'MIDLEVEL', 'ONSITE', 'Yassir', 'EL KOBI',
        'yassir.elkobi@outlook.com', '$argon2id$v=19$m=65536,t=4,p=1$b4zRn+XTOrsiap+4rpny4g$8wSGjXbnMK93GRL0/kfPF+KnceQQRDiPQXavRpv6IpE', 1, 1, 1759739997, 1759739997);


INSERT INTO candidate.candidates (id, title, education, seniority, arrangement, first_name, last_name, email, password, is_active,
                                  is_valid, registration_date, last_login)
VALUES (DEFAULT, 'Full Stack Software Engineer','MASTER', 'MIDLEVEL', 'ONSITE', 'Youssef', 'LAIDOUNI',
        ' laidouni.youssef99@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$b4zRn+XTOrsiap+4rpny4g$8wSGjXbnMK93GRL0/kfPF+KnceQQRDiPQXavRpv6IpE', 1, 1, 1759739997, 1759739997);

-- AFFILIATION
--should be placed after the candidates creation
INSERT INTO candidate.affiliation (candidate_id, offer_id, creation_date)
VALUES
(1, 1, extract(epoch from now())),
(2, 1, extract(epoch from now())),
(3, 1, extract(epoch from now())),
(4, 1, extract(epoch from now())),
(5, 1, extract(epoch from now())),
(6, 1, extract(epoch from now())),
(7, 1, extract(epoch from now())),
(8, 1, extract(epoch from now())),
(9, 1, extract(epoch from now())),
(10, 1, extract(epoch from now())),
(11, 1, extract(epoch from now())),
(12, 1, extract(epoch from now()));
-- ---------------------------------
--  Applications simulation script
-- ---------------------------------

INSERT INTO candidate.applications
(id, cv_url, application_date, status, score_experience, score_skills, report_url, offer_id, candidate_id)
VALUES (DEFAULT,'uploads/cv/offer1/adnane_ezzaim.pdf',1759740137,
        'PENDING', 0, 0, '', 1, 1);

INSERT INTO candidate.applications
(id, cv_url, application_date, status, score_experience, score_skills, report_url, offer_id, candidate_id)
VALUES (DEFAULT,'uploads/cv/offer1/amine_aissaoui.pdf',1759740137,
        'PENDING', 0, 0, '', 1, 2);

INSERT INTO candidate.applications
(id, cv_url, application_date, status, score_experience, score_skills, report_url, offer_id, candidate_id)
VALUES (DEFAULT,'uploads/cv/offer1/amine_mabrouk.pdf',1759740137,
        'PENDING', 0, 0, '', 1, 3);

INSERT INTO candidate.applications
(id, cv_url, application_date, status, score_experience, score_skills, report_url, offer_id, candidate_id)
VALUES (DEFAULT,'uploads/cv/offer1/emma_botti.pdf',1759740137,
        'PENDING', 0, 0, '', 1, 4);

INSERT INTO candidate.applications
(id, cv_url, application_date, status, score_experience, score_skills, report_url, offer_id, candidate_id)
VALUES (DEFAULT,'uploads/cv/offer1/hichem_bouhlel.pdf',1759740137,
        'PENDING', 0, 0, '', 1, 5);

INSERT INTO candidate.applications
(id, cv_url, application_date, status, score_experience, score_skills, report_url, offer_id, candidate_id)
VALUES (DEFAULT,'uploads/cv/offer1/jalil_bounaime.pdf',1759740137,
        'PENDING', 0, 0, '', 1, 6);

INSERT INTO candidate.applications
(id, cv_url, application_date, status, score_experience, score_skills, report_url, offer_id, candidate_id)
VALUES (DEFAULT,'uploads/cv/offer1/jerome_steve.pdf',1759740137,
        'PENDING', 0, 0, '', 1, 7);

INSERT INTO candidate.applications
(id, cv_url, application_date, status, score_experience, score_skills, report_url, offer_id, candidate_id)
VALUES (DEFAULT,'uploads/cv/offer1/karim_boualam.pdf',1759740137,
        'PENDING', 0, 0, '', 1, 8);

INSERT INTO candidate.applications
(id, cv_url, application_date, status, score_experience, score_skills, report_url, offer_id, candidate_id)
VALUES (DEFAULT,'uploads/cv/offer1/maxime_goetgheluck.pdf',1759740137,
        'PENDING', 0, 0, '', 1, 9);

INSERT INTO candidate.applications
(id, cv_url, application_date, status, score_experience, score_skills, report_url, offer_id, candidate_id)
VALUES (DEFAULT,'uploads/cv/offer1/rachid_ardouz.pdf',1759740137,
        'PENDING', 0, 0, '', 1, 10);

INSERT INTO candidate.applications
(id, cv_url, application_date, status, score_experience, score_skills, report_url, offer_id, candidate_id)
VALUES (DEFAULT,'uploads/cv/offer1/yassir_elkobi.pdf',1759740137,
        'PENDING', 0, 0, '', 1, 11);

INSERT INTO candidate.applications
(id, cv_url, application_date, status, score_experience, score_skills, report_url, offer_id, candidate_id)
VALUES (DEFAULT,'uploads/cv/offer1/youssef_laidouni.pdf',1759740137,
        'PENDING', 0, 0, '', 1, 12);
