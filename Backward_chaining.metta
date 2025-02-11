; A career path advisor

;; Backward Chaining Implementation

;Knowledge Base
!(bind! &kb (new-space))

;fundamental facts

!(add-atom &kb (role software_engineer)) ; Software engineer
!(add-atom &kb (required_skill software_engineer python))
!(add-atom &kb (required_skill software_engineer javascript))

!(add-atom &kb (role web_developer)) ; Web Developer
!(add-atom &kb (required-skill web_developer responsive_design))
!(add-atom &kb (required-skill web_developer backend_development))


;User knowledge Data

!(add-atom &kb (user user1)) ;user 1
!(add-atom &kb (user_skill user1 python_basics))
!(add-atom &kb (user_skill user1 python_advanced))
!(add-atom &kb (user_skill user1 javascript_basics))
!(add-atom &kb (user_skill user1 javascript_advanced))
!(add-atom &kb (user_interest user1 software_development))
!(add-atom &kb (user_experience user1 has_experience))

!(add-atom &kb (user user2)) ;User 2
!(add-atom &kb (user_skill user2 html))
!(add-atom &kb (user_skill user2 css))
!(add-atom &kb (user_skill user2 javascript))
!(add-atom &kb (user_skill user2 database_management))
!(add-atom &kb (user_skill user2 backend_development))
!(add-atom &kb (user_interest user2 web_development))
!(add-atom &kb (user_skill user2 backend_focus))


;Rule Base
!(bind! &rb (new-space))

;;; Software engineering
; 1. Skill Aggregation Rules
!(add-reduct &rb
    (-> (user_skill $user python_basics)
        (user_skill $user python_advanced)
        (python_qualified $user)))

!(add-reduct &rb
    (-> (user_skill $user javascript_basics)
        (user_skill $user javascript_advanced)
        (javascript_qualified $user)))

; 2. Requirement Matching Rules
!(add-reduct &rb
    (-> (python_qualified $user)
        (required_skill software_engineer python)
        (meets_python_req $user)))

!(add-reduct &rb
    (-> (javascript_qualified $user)
        (required_skill software_engineer javascript)
        (meets_javascript_req $user)))

; 3. Core Qualification Rule
!(add-reduct &rb
    (-> (meets_python_req $user)
        (meets_javascript_req $user)
        (has_required_skills $user)))

; 4. Final Qualification
!(add-reduct &rb
    (-> (has_required_skills $user)
        (user_interest $user software_development)
        (qualifies $user software_engineer)))
!(add-reduct &rb
    (-> (qualifies $user software_engineer)
        (user_experience $user has_experience)
        (qualifies-for $user senior_software_engineer)))
!(add-reduct &rb
    (-> (qualifies $user software_engineer)
        (user_experience $user no_experience)
        (qualifies-for $user junior_software_engineer)))


;;Web Development
; 1.Frontend Qualification
!(add-reduct &rb
    (-> (user_skill $user html)
        (user_skill $user css)
        (basic_frontend_qualified $user)))

!(add-reduct &rb
    (-> (basic_frontend_qualified $user)
        (user_skill $user javascript)
        (frontend_knowledge $user)))

!(add-reduct &rb
    (-> (frontend_knowledge $user)
        (required-skill web_developer responsive_design)
        (frontend_qualified $user)))

; 2. Backend Qualification
!(add-reduct &rb
    (-> (user_skill $user database_management)
        (user_skill $user backend_development)
        (basic_backend_qualified $user)))

!(add-reduct &rb
    (-> (basic_backend_qualified $user)
        (required-skill web_developer backend_development)
        (backend_qualified $user)))

; 3. Final Web Developer Qualification
!(add-reduct &rb
    (-> (frontend_qualified $user)
        (backend_qualified $user)
        (required_skills_met $user)))

!(add-reduct &rb
    (-> (required_skills_met $user)
        (user_interest $user web_development)
        (qualifies-for $user web_developer)))


; Backward Chainer
;
(: fromNumber (-> Number Atom))
(= (fromNumber $n) (if (<= $n 0) Z (S (fromNumber (- $n 1)))))

(: bc_bem (-> Atom Nat Atom))
;; Base case
(= (bc_bem $conclusion $depth)
   (match &kb $conclusion $conclusion))

;; Recursive step
(= (bc_bem $conclusion (S $k))
   (match &rb (-> $premise1 $premise2 $conclusion)
          (let* (($premise1 (bc_bem $premise1 $k))
                 ($premise2 (bc_bem $premise2 $k)))
            $conclusion)))



; Test Cases
!(bc_bem (qualifies-for user1 $s) (fromNumber 5))
!(bc_bem (qualifies-for user2 $s) (fromNumber 5))

