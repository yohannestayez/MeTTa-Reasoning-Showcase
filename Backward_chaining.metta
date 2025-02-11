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


