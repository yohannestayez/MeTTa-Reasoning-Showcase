; A career path advisor

;; Backward Chaining Implementation

;; Knowledge Base
!(bind! &kb (new-space))

;; Roles
!(add-atom &kb (role software_engineer))
!(add-atom &kb (role data_engineer))
!(add-atom &kb (role devops_engineer))
!(add-atom &kb (role web_developer))
!(add-atom &kb (role blockchain_developer))
!(add-atom &kb (role security_analyst))
!(add-atom &kb (role ml_engineer))
!(add-atom &kb (role computer_scientist))

;; Skills

; Software Engineer
!(add-atom &kb (required-skill software_engineer python_core))
!(add-atom &kb (required-skill software_engineer python))
!(add-atom &kb (required-skill software_engineer javascript_basics))
!(add-atom &kb (required-skill software_engineer javascript))

; Data Engineer
!(add-atom &kb (required-skill data_engineer python))
!(add-atom &kb (required-skill data_engineer cloud_basics))
!(add-atom &kb (required-skill data_engineer sql_basics))
!(add-atom &kb (required-skill data_engineer sql))

; DevOps Engineer
!(add-atom &kb (required-skill devops_engineer linux))
!(add-atom &kb (required-skill devops_engineer ci_cd))
!(add-atom &kb (required-skill devops_engineer docker))
!(add-atom &kb (required-skill devops_engineer networking))

; Web Developer
!(add-atom &kb (required-skill web_developer html_css))
!(add-atom &kb (required-skill web_developer javascript))
!(add-atom &kb (required-skill web_developer responsive_design))

; Blockchain Developer
!(add-atom &kb (required-skill blockchain_developer blockchain_fundamentals))
!(add-atom &kb (required-skill blockchain_developer solidity))
!(add-atom &kb (required-skill blockchain_developer cryptography))

; Security Analyst
!(add-atom &kb (required-skill security_analyst network_security))
!(add-atom &kb (required-skill security_analyst risk_assessment))
!(add-atom &kb (required-skill security_analyst incident_response))

; ML Engineer
!(add-atom &kb (required-skill ml_engineer python))
!(add-atom &kb (required-skill ml_engineer machine_learning_basics))
!(add-atom &kb (required-skill ml_engineer statistics))
!(add-atom &kb (required-skill ml_engineer data_preprocessing))
!(add-atom &kb (required-skill ml_engineer deep_learning))

; Computer Scientist
!(add-atom &kb (required-skill computer_scientist algorithms))
!(add-atom &kb (required-skill computer_scientist data_structures))
!(add-atom &kb (required-skill computer_scientist theory_of_computation))

;; Interests

!(add-atom &kb (required-interest software_engineer software_development))
!(add-atom &kb (required-interest data_engineer data_engineering))
!(add-atom &kb (required-interest data_engineer cloud_computing))
!(add-atom &kb (required-interest devops_engineer infrastructure))
!(add-atom &kb (required-interest devops_engineer automation))

!(add-atom &kb (required-interest web_developer web_development))
!(add-atom &kb (required-interest blockchain_developer blockchain_technology))
!(add-atom &kb (required-interest security_analyst cybersecurity))
!(add-atom &kb (required-interest ml_engineer machine_learning))
!(add-atom &kb (required-interest computer_scientist theoretical_computing))
!(add-atom &kb (True))



;; Rule Base

!(bind! &rb (new-space))

;; Software Engineer
!(add-reduct &rb
  (-> (user-skill $user python_core)
      (user-skill $user python_advanced)
      (sw-python $user)))

!(add-reduct &rb
  (-> (user-skill $user javascript_basics)
      (user-skill $user javascript)
      (sw-js $user)))

!(add-reduct &rb
  (-> (sw-python $user)
      (sw-js $user)
      (sw-skills $user)))

!(add-reduct &rb
  (-> (sw-skills $user)
      (user-interest $user software_development)
      (qualifies-for $user software_engineer)))


;; Data Engineer
!(add-reduct &rb
  (-> (user-skill $user python)
      (user-skill $user sql_basics)
      (de-sql-python $user)))

!(add-reduct &rb
  (-> (de-sql-python $user)
      (user-skill $user cloud_basics)
      (de-cloud-ready $user)))

!(add-reduct &rb
  (-> (de-cloud-ready $user)
      (user-interest $user data_engineering)
      (qualifies-for $user data_engineer)))


;; DevOps Engineer
!(add-reduct &rb
  (-> (user-skill $user linux)
      (user-skill $user ci_cd)
      (devops-step1 $user)))

!(add-reduct &rb
  (-> (devops-step1 $user)
      (user-skill $user networking)
      (devops-step2 $user)))

!(add-reduct &rb
  (-> (devops-step2 $user)
      (user-skill $user docker)
      (devops-skills-2 $user)))

!(add-reduct &rb
  (-> (devops-skills-2 $user)
      (user-interest $user infrastructure)
      (qualifies-for $user devops_engineer)))


;; Web Developer
!(add-reduct &rb
  (-> (user-skill $user html_css)
      (user-skill $user javascript)
      (web-core $user)))

!(add-reduct &rb
  (-> (web-core $user)
      (user-skill $user responsive_design)
      (web-skills $user)))

!(add-reduct &rb
  (-> (web-skills $user)
      (user-interest $user web_development)
      (qualifies-for $user web_developer)))


;; Blockchain Developer
!(add-reduct &rb
  (-> (user-skill $user blockchain_fundamentals)
      (user-skill $user solidity)
      (bc-core $user)))


!(add-reduct &rb
  (-> (bc-core $user)
      (user-skill $user cryptography)
      (bc-skills $user)))

!(add-reduct &rb
  (-> (bc-skills $user)
      (user-interest $user blockchain_technology)
      (qualifies-for $user blockchain_developer)))


;; Security Analyst
!(add-reduct &rb
  (-> (user-skill $user network_security)
      (user-skill $user risk_assessment)
      (sec-core $user)))

!(add-reduct &rb
  (-> (sec-core $user)
      (user-skill $user incident_response)
      (sec-skills $user)))

!(add-reduct &rb
  (-> (sec-skills $user)
      (user-interest $user cybersecurity)
      (qualifies-for $user security_analyst)))


;; ML Engineer
!(add-reduct &rb
  (-> (user-skill $user machine_learning_basics)
      (user-skill $user statistics)
      (ml-foundation $user)))

!(add-reduct &rb
  (-> (ml-foundation $user)
      (user-skill $user data_preprocessing)
      (ml-data $user)))

!(add-reduct &rb
  (-> (ml-data $user)
      (user-skill $user deep_learning)
      (ml-skills $user)))

!(add-reduct &rb
  (-> (ml-skills $user)
      (user-interest $user machine_learning)
      (qualifies-for $user ml_engineer)))


;; Computer Scientist
!(add-reduct &rb
  (-> (user-skill $user algorithms)
      (user-skill $user data_structures)
      (cs-core $user)))


!(add-reduct &rb
  (-> (cs-core $user)
      (user-skill $user theory_of_computation)
      (cs-skills $user)))

!(add-reduct &rb
  (-> (cs-skills $user)
      (user-interest $user theoretical_computing)
      (qualifies-for $user computer_scientist)))
