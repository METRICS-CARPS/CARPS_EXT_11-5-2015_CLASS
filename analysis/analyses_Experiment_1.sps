USE ALL.
COMPUTE filter_$=(failed_essay = 0).
VARIABLE LABELS filter_$ 'failed_essay = 0 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

RELIABILITY
  /VARIABLES=moralSR_1 moralSR_2 moralSR_3 moralSR_4 moralSR_5 moralSR_6 moralSR_7 moralSR_8 
    moralSR_9 moralSR_10
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

RELIABILITY
  /VARIABLES=Impurity_1 Impurity_2 Impurity_3
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

RELIABILITY
  /VARIABLES=alienation_1 alienation_2 alienation_3 alienation_4
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

UNIANOVA alienation BY authenticity general_type
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(authenticity) COMPARE ADJ(BONFERRONI)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=authenticity general_type authenticity*general_type.

UNIANOVA moral_self_regard BY authenticity general_type
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(authenticity) COMPARE ADJ(BONFERRONI)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=authenticity general_type authenticity*general_type.

UNIANOVA impurity BY authenticity general_type
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(authenticity) COMPARE ADJ(BONFERRONI)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=authenticity general_type authenticity*general_type.

UNIANOVA words_essay BY authenticity general_type
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(authenticity) COMPARE ADJ(BONFERRONI)
  /PRINT=ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=authenticity general_type authenticity*general_type.

CORRELATIONS
  /VARIABLES=moral_self_regard impurity alienation words_essay
  /PRINT=TWOTAIL NOSIG
  /STATISTICS DESCRIPTIVES
  /MISSING=PAIRWISE.


