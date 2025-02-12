# Carrer path Advisor

This career path advisor, built using the metta programming language, shows the effective use of inferencing techniques by integrating both forward and backward chaining. It employs a well-structured knowledge base of roles, required skills, and user profiles alongside a comprehensive rule base to dynamically evaluate and recommend suitable career paths. The implementation efficiently analyzes users' skills and interests, aligning them with career requirements for roles like software engineer, web developer, devops engineer, and machine learning engineer, demonstrating a practical application of chaining techniques in intelligent decision support for career planning.

## Forward_chaining.metta
- This metta file demonstrates **forward chaining** reasoning. It recursively applies rules, feeding new facts back into the system until no further inferences can be made.
- **Forward Chaining:** A data-driven reasoning method that starts with known facts and applies inference rules to generate new facts. Through a process of inferencing, it continuously builds upon existing information until a conclusion is reached.

## Backward_chaining.metta
- This file showcases **backward chaining** reasoning technique well. It recursively traces the goal back through matching rules, verifying each required premise until it reaches known facts.
- **Backward Chaining:** A goal-driven reasoning method that starts with the desired conclusion and works backward to determine which facts must be true for that conclusion to hold.