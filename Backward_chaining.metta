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
!(add-atom &kb (required-skill software_engineer python_advanced))
!(add-atom &kb (required-skill software_engineer javascript_basics))
!(add-atom &kb (required-skill software_engineer javascript))
