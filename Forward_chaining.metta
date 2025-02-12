;carrer path chainer

;Forward chaining

;Knowledge base
!(bind! &kb (new-space))

;; Roles and Requirements
!(add-atom &kb (role devops_engineer)) ;Devops Engineer
!(add-atom &kb (required_skill devops_engineer fundamentals))
!(add-atom &kb (required_skill devops_engineer automation_cloud))



;; User Data
!(add-atom &kb (user user1))
!(add-atom &kb (user_skill user1 os_networking))
!(add-atom &kb (user_skill user1 git_programming))
!(add-atom &kb (user_skill user1 ci_cd_containerization))
!(add-atom &kb (user_skill user1 infrastructure_as_code))
!(add-atom &kb (user_skill user1 cloud_platforms))
!(add-atom &kb (user_skill user1 monitoring_security))
!(add-atom &kb (user_interest user1 infrastructure))
!(add-atom &kb (user_interest devops_engineer automation))

;Rule Base
!(bind! &rb (new-space))

; Devops
; 1. Fundamentals Qualification
!(add-reduct &rb
    (-> (user_skill $user os_networking)
        (user_skill $user git_programming)
        (basic_fundamentals_qualified $user)))

!(add-reduct &rb
    (-> (basic_fundamentals_qualified $user)
        (user_skill $user monitoring_security)
        (fundamentals_knowledge $user)))

!(add-reduct &rb
    (-> (fundamentals_knowledge $user)
        (required_skill devops_engineer fundamentals)
        (fundamentals_qualified $user)))

!(add-reduct &rb
    (-> (fundamentals_qualified $user)
        (user_skill $user ci_cd_containerization)
        (ci_cd_knowledge $user)))

; 2. Automation & Cloud Qualification
!(add-reduct &rb
    (-> (ci_cd_knowledge $user)
        (user_skill $user infrastructure_as_code)
        (basic_automation_qualified $user)))

!(add-reduct &rb
    (-> (basic_automation_qualified $user)
        (user_skill $user cloud_platforms)
        (automation_knowledge $user)))

!(add-reduct &rb
    (-> (automation_knowledge $user)
        (required_skill devops_engineer automation_cloud)
        (automation_cloud_qualified $user)))

; 3. Final DevOps Engineer Qualifications
!(add-reduct &rb
    (-> (automation_cloud_qualified $user)
        (user_interest devops_engineer automation)
        (required_skills_met $user)))

!(add-reduct &rb
    (-> (required_skills_met $user)
        (user_interest $user infrastructure)
        (qualifies-for $user devops_engineer)))

;Forward chainer
(: fromNumber (-> Number Atom))
(= (fromNumber $n) (if (<= $n 0) Z (S (fromNumber (- $n 1)))))

;; Base case
(= (fc $premise $depth) $premise)
;; Recursive steps
(= (fc $premise1 (S $k))
   (match &rb (-> $premise1 $premise2 $conclusion)
          (match &kb $premise2 (fc $conclusion $k))))

(= (fc $premise2 (S $k))
   (match &rb (-> $premise1 $premise2 $conclusion)
          (match &kb $premise1 (fc $conclusion $k))))

; Test Cases
!(fc (user_skill user1 os_networking) (fromNumber 9))
