; A carrer path advisor

;; Backward Chaining Implementation

;; Knowledge Base
!(bind! &kb (new-space))

;; Roles
!(add-atom &kb (role software_engineer))
!(add-atom &kb (role data_engineer))
!(add-atom &kb (role devops_engineer))

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

;; Interests

!(add-atom &kb (required-interest software_engineer software_development))
!(add-atom &kb (required-interest data_engineer data_engineering))
!(add-atom &kb (required-interest data_engineer cloud_computing))
!(add-atom &kb (required-interest devops_engineer infrastructure))
!(add-atom &kb (required-interest devops_engineer automation))