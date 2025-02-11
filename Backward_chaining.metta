; A career path advisor

;; Backward Chaining Implementation

;Knowledge Base

!(bind! &kb (new-space))

;fundamental facts
!(add-atom &kb (role software_engineer))
!(add-atom &kb (required_skill software_engineer python))
!(add-atom &kb (required_skill software_engineer javascript))

;User knowledge Data
!(add-atom &kb (user user1))
!(add-atom &kb (user_skill user1 python_basics))
!(add-atom &kb (user_skill user1 python_advanced))
!(add-atom &kb (user_skill user1 javascript_basics))
!(add-atom &kb (user_skill user1 javascript_advanced))
!(add-atom &kb (user_interest user1 software_development))
!(add-atom &kb (user_experience user1 has_experience))

;Rule Base
!(bind! &rb (new-space))

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


; Backward Chainer
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
