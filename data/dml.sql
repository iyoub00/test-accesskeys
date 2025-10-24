------------------------------
-- Organizations
------------------------------
INSERT INTO recruiter.organizations (id, name, slug, phone, email, website)
VALUES (DEFAULT, 'xxxx','xxxx', 'xxxx', 'xxxx', 'xxxx');

UPDATE recruiter.organizations
SET     name='xxxx'
AND     slug='xxxx'
AND     phone='xxxx'
AND     email='xxxx'
AND     website='xxxx'
WHERE id=1111;

DELETE FROM recruiter.organizations WHERE id=1111;

------------------------------
-- Recruiters
------------------------------
INSERT INTO recruiter.recruiters (id, first_name, last_name, email, password, organization_id)
VALUES (DEFAULT, 'xxxx','xxxx', 'xxxx', 'xxxx', 1111);

UPDATE recruiter.recruiters
SET     first_name='xxxx'
AND     last_name='xxxx'
AND     email='xxxx'
AND     password='xxxx'
AND     organization_id=1111
WHERE id=1111;

DELETE FROM recruiter.recruiters WHERE id=1111;

------------------------------
-- Collections
------------------------------
INSERT INTO recruiter.collections (id, label, slug, description, organization_id)
VALUES (DEFAULT, 'xxxx','xxxx', 'xxxx', 1111);

UPDATE recruiter.collections
SET     label='xxxx'
AND     slug='xxxx'
AND     description='xxxx'
AND     organization_id=1111
WHERE id=1111;

DELETE FROM recruiter.collections WHERE id=1111;

------------------------------
-- Offers
------------------------------
INSERT INTO recruiter.offers (id, title, slug, description, responsibilities, skills, certifications,
                              education, seniority, arrangement, creation_date, expiry_date, collection_id)
VALUES (DEFAULT, 'xxxx','xxxx', 'xxxx', '{}', '{}', '{}',
                            'xxxx', 'xxxx', 'xxxx', 1111, 1111, 1111);

UPDATE recruiter.offers
SET     title='xxxx'
AND     slug='xxxx'
AND     description='xxxx'
AND     responsibilities='{}'
AND     skills='{}'
AND     certifications='{}'
AND     education='xxxx'
AND     seniority='xxxx'
AND     arrangement='xxxx'
AND     creation_date=1111
AND     expiry_date=1111
AND     collection_id=1111
WHERE id=1111;

DELETE FROM recruiter.offers WHERE id=1111;

-- ===============================================================================================================
-- ===============================================================================================================
-- ===============================================================================================================

------------------------------
-- Candidates
------------------------------
INSERT INTO candidate.candidates (id, title, education, seniority, arrangement, first_name, last_name, email, password, is_active,
                                  is_valid, registration_date, last_login)
VALUES (DEFAULT, 'xxxx','xxxx', 'xxxx', 'xxxx', 'xxxx', 'xxxx',
        'xxxx', 'xxxx', '1111', 1111, 1111, 1111);

UPDATE candidate.candidates
SET     title='xxxx'
AND     education='xxxx'
AND     seniority='xxxx'
AND     arrangement='xxxx'
AND     first_name='xxxx'
AND     last_name='xxxx'
AND     email='xxxx'
AND     password='xxxx'
AND     is_active=1111
AND     is_valid=1111
AND     registration_date=1111
AND     last_login=1111
WHERE id=1111;

DELETE FROM candidate.candidates WHERE id=1111;

------------------------------
-- Applications
------------------------------

INSERT INTO candidate.applications
    (id, cv_url, application_date, status, score_skills,score_experience, report_url, offer_id, candidate_id)
VALUES (DEFAULT,'uploads/cv/offer1/xxxx.pdf',1759740137,
        'PENDING', 0, 0,'', 1, 1);

UPDATE candidate.applications
SET     cv_url=1111
AND     application_date=1111
AND     status=1111
AND     score_experience=1111
AND     score_skills=1111
AND     report_url=1111
AND     offer_id='xxxx'
AND     candidate_id=1111
WHERE   id=1111;

DELETE FROM candidate.applications WHERE id=1111;