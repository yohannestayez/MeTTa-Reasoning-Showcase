# Carrer path Advisor
This metta career advisor leverages both forward and backward chaining to dynamically infer career paths. It uses a structured knowledge and rule base to analyze users' skills and interests, matching them to roles.

## Forward_chaining.metta
- This metta file demonstrates **forward chaining** reasoning. It recursively applies rules, feeding new facts back into the system until no further inferences can be made.
- **Forward Chaining:** A data-driven reasoning method that starts with known facts and applies inference rules to generate new facts. Through a process of inferencing, it continuously builds upon existing information until a conclusion is reached.

## Backward_chaining.metta
- This file showcases **backward chaining** reasoning technique well. It recursively traces the goal back through matching rules, verifying each required premise until it reaches known facts.
- **Backward Chaining:** A goal-driven reasoning method that starts with the desired conclusion and works backward to determine which facts must be true for that conclusion to hold.