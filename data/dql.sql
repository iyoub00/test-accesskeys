------------------------------
-- Organizations
------------------------------
-- Get all Organizations
SELECT * FROM recruiter.organizations LIMIT 10 OFFSET 0;
-- Get a specific Organization
SELECT * FROM recruiter.organizations WHERE id=1111;

------------------------------
-- Recruiters
------------------------------
-- Get all Recruiters
SELECT * FROM recruiter.recruiters LIMIT 10 OFFSET 0;
-- Get all Recruiters by company id
SELECT * FROM recruiter.recruiters WHERE recruiters.organization_id=2222 LIMIT 10 OFFSET 0;
-- Get all Recruiters by company name
SELECT * FROM recruiter.recruiters R
JOIN recruiter.organizations O ON R.organization_id = O.id
WHERE O.name LIKE '%xxxx%'
LIMIT 10 OFFSET 0;
-- Get a specific Recruiter
SELECT * FROM recruiter.recruiters WHERE id=1111;

------------------------------
-- Collections
------------------------------
-- Get all Collections
SELECT * FROM recruiter.collections LIMIT 10 OFFSET 0;
-- Get all Collections by company id
SELECT * FROM recruiter.collections WHERE collections.organization_id=2222 LIMIT 10 OFFSET 0;
-- Get all Collections by company name
SELECT * FROM recruiter.collections C
JOIN recruiter.organizations O ON C.organization_id = O.id
WHERE O.name LIKE '%xxxx%'
LIMIT 10 OFFSET 0;
-- Get a specific Collection
SELECT * FROM recruiter.collections WHERE id=1111;

------------------------------
-- Offers
------------------------------
-- Get all offers
SELECT * FROM recruiter.offers LIMIT 10 OFFSET 0;
-- Get all offers by collection id
SELECT * FROM recruiter.offers WHERE offers.collection_id=2222 LIMIT 10 OFFSET 0;
-- Get all offers by company id
SELECT * FROM recruiter.offers F
JOIN recruiter.collections C on F.collection_id = C.id
JOIN recruiter.organizations O on C.organization_id = O.id
WHERE O.id=2222
LIMIT 10 OFFSET 0;
-- Get all offers by company name
SELECT * FROM recruiter.offers F
JOIN recruiter.collections C on F.collection_id = C.id
JOIN recruiter.organizations O on C.organization_id = O.id
WHERE O.name LIKE '%xxxx%'
LIMIT 10 OFFSET 0;
-- Get a specific offers
SELECT * FROM recruiter.offers WHERE id=1111;

-- ===============================================================================================================
-- ===============================================================================================================
-- ===============================================================================================================

------------------------------
-- Candidates
------------------------------
-- Get all Candidates
SELECT * FROM candidate.candidates LIMIT 10 OFFSET 0;
-- Get a specific Candidate
SELECT * FROM candidate.applications WHERE id=1111;

------------------------------
-- Applications
------------------------------
-- Get all Applications
SELECT * FROM candidate.applications LIMIT 10 OFFSET 0;
-- Get all Applications by candidate id
SELECT * FROM candidate.applications WHERE applications.candidate_id=222 LIMIT 10 OFFSET 0;
-- Get all Applications by candidate id with metadata
SELECT * FROM candidate.applications A
JOIN candidate.candidates C on A.candidate_id = C.id
WHERE A.candidate_id=222 LIMIT 10 OFFSET 0;
-- Get a specific Application
SELECT * FROM candidate.applications WHERE id=1111;
-- Get a specific Application with metadata
SELECT  O.title as x_title, O.description as x_description, O.responsibilities as x_responsibilities, O.skills as x_skills,
        O.certifications as x_certifications, O.education as x_education, O.seniority as x_seniority, O.arrangement as x_arrangement,
        C.title as y_title, C.education as y_education, C.seniority as y_seniority, C.arrangement as y_arrangement, A.cv_url as y_cv
FROM candidate.applications A
JOIN candidate.candidates C on A.candidate_id = C.id
JOIN recruiter.offers O on A.offer_id = O.id
WHERE A.id=1111;
-- Get applications by offer id
SELECT  O.title as x_title, O.description as x_description, O.responsibilities as x_responsibilities, O.skills as x_skills,
        O.certifications as x_certifications, O.education as x_education, O.seniority as x_seniority, O.arrangement as x_arrangement,
        C.title as y_title, C.education as y_education, C.seniority as y_seniority, C.arrangement as y_arrangement, A.cv_url as y_cv
FROM candidate.applications A
         JOIN candidate.candidates C on A.candidate_id = C.id
         JOIN recruiter.offers O on A.offer_id = O.id
WHERE A.offer_id=1111;
-- Display scored applications / applicants
SELECT O.title, CONCAT(C.first_name, ' ' C.last_name) as candidate_name, A.score_experience, A.score_skills
FROM candidate.applications A
JOIN candidate.candidates C on A.candidate_id = C.id
JOIN recruiter.offers O on A.offer_id = O.id
ORDER BY A.score_skills, A.score_experience