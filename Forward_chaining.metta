;carrer path chainer

;Forward chaining

;Knowledge base
!(bind! &kb (new-space))

;; Roles and Requirements
;Devops Engineer
!(add-atom &kb (role devops_engineer))
!(add-atom &kb (required_skill devops_engineer fundamentals))
!(add-atom &kb (required_skill devops_engineer automation_cloud))

;Machine Learning Engineer
!(add-atom &kb (role ml_engineer))
!(add-atom &kb (required_skill ml_engineer python))
!(add-atom &kb (required_skill ml_engineer machine_learning))
!(add-atom &kb (required_skill ml_engineer deep_learning))


;; User Data
!(add-atom &kb (user user1)) ;User 1
!(add-atom &kb (user_skill user1 os_networking))
!(add-atom &kb (user_skill user1 git_programming))
!(add-atom &kb (user_skill user1 ci_cd_containerization))
!(add-atom &kb (user_skill user1 infrastructure_as_code))
!(add-atom &kb (user_skill user1 cloud_platforms))
!(add-atom &kb (user_skill user1 monitoring_security))
!(add-atom &kb (user_interest user1 infrastructure))
!(add-atom &kb (user_interest devops_engineer automation))

!(add-atom &kb (user user2)) ;User 2
!(add-atom &kb (user_skill user2 python_basics))
!(add-atom &kb (user_skill user2 python_advanced))
!(add-atom &kb (user_skill user2 statistics))
!(add-atom &kb (user_skill user2 Linear_algebra))
!(add-atom &kb (user_skill user2 machine_learning_basics))
!(add-atom &kb (user_skill user2 machine_learning_algorithms))
!(add-atom &kb (user_skill user2 neural-networks))
!(add-atom &kb (user_skill user2 deep_learning_architecture))
!(add-atom &kb (user_interest user2 machine_learning))



;Rule Base
!(bind! &rb (new-space))

; Devops Engineer
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


; Machine Learning Engineer
; 1. Python Qualification
!(add-reduct &rb
    (-> (user_skill $user python_basics)
        (user_skill $user python_advanced)
        (python_knowledge $user)))


!(add-reduct &rb
    (-> (python_knowledge $user)
        (required_skill ml_engineer python)
        (python_qualified $user)))

; 2. Machine Learning Qualification
!(add-reduct &rb
    (-> (python_qualified $user)
        (user_skill $user machine_learning_basics)
        (python_ml $user)))

!(add-reduct &rb
    (-> (python_ml $user)
        (user_skill $user machine_learning_algorithms)
        (basic_ml_qualified $user)))

; 3. Mathimatical knowledge on machine learning Qualification
!(add-reduct &rb
    (-> (basic_ml_qualified $user)
        (user_skill $user statistics)
        (ml_maths $user)))

!(add-reduct &rb
    (-> (ml_maths $user)
        (user_skill $user Linear_algebra)
        (ml_knowledge_with-maths $user)))

; 4. Advanced machine learning knowledge Qualification
!(add-reduct &rb
    (-> (ml_knowledge_with-maths $user)
        (user_skill $user neural-networks)
        (advanced_ml_knowledge $user)))

!(add-reduct &rb
    (-> (advanced_ml_knowledge $user)
        (required_skill ml_engineer machine_learning)
        (ml_qualified $user)))

; 5. Deep Learning Knowledge Qualification
!(add-reduct &rb
    (-> (ml_qualified $user)
        (user_skill $user deep_learning_architecture)
        (deep_learning_knowledge $user)))

!(add-reduct &rb
    (-> (deep_learning_knowledge $user)
        (required_skill ml_engineer deep_learning)
        (ml_dl_qualified $user)))

; 6. Final ML Engineer Qualification
!(add-reduct &rb
    (-> (ml_dl_qualified $user)
        (user_interest $user machine_learning)
        (qualifies-for $user ml_engineer)))


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

; What carrer path advise for user 1 based on his skills and interest?
!(fc (user_skill user1 os_networking) (fromNumber 9))
; expected output: [(user_skill user1 os_networking), (fundamentals_knowledge user1), (ci_cd_knowledge user1), (automation_knowledge user1), (required_skills_met user1), (qualifies-for user1 devops_engineer), (automation_cloud_qualified user1), (basic_automation_qualified user1), (fundamentals_qualified user1), (basic_fundamentals_qualified user1)]

; final advise: (qualifies-for user1 devops_engineer)

; What carrer path advise for user 2 based on his skills and interest?
!(fc(user_skill user2 python_basics) (fromNumber 11))

; expected output: [(user_skill user2 python_basics), (python_qualified user2), (basic_ml_qualified user2), (ml_knowledge_with-maths user2), (ml_qualified user2), (ml_dl_qualified user2), (qualifies-for user2 ml_engineer), (deep_learning_knowledge user2), (advanced_ml_knowledge user2), (ml_maths user2), (python_ml user2), (python_knowledge user2)]

; final advise: (qualifies-for user2 ml_engineer)